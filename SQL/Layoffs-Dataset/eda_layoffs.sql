-- Exploratory Data Analysis

-- To start with, we are just going to explore the data and try to find patterns/outliers
SELECT *
FROM layoffs_staging2;

-- The maximum total laid off and the maximum percentage laid off
SELECT MAX(total_laid_off), MAX(percentage_laid_off)
FROM layoffs_staging2;

-- Which companies had 1 which is basically 100 percent of they company laid off
-- Ordered by funds_raised_millions (so we can see how big the companies are)
SELECT *
FROM layoffs_staging2
WHERE percentage_laid_off = 1
ORDER BY funds_raised_millions DESC;

-- Companies with the biggest single Layoff
SELECT company, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company
ORDER BY 2 DESC;

-- When did the layoff start and end (ONLY for this dataset)
SELECT MIN(`date`), MAX(`date`)
FROM layoffs_staging2;

-- Industries with most total layoffs (in descending order)
SELECT industry, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY industry
ORDER BY 2 DESC;

-- Countries with most total layoffs (in descending order)
SELECT country, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY country
ORDER BY 2 DESC;

-- Stages with most total layoffs (in descending order)
SELECT stage, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY stage
ORDER BY 2 DESC;

-- Total layoffs by year
SELECT YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY YEAR(`date`)
ORDER BY 1 DESC;

-- Sum of percentage_laid_off by company (doesn't look very useful)
SELECT company, SUM(percentage_laid_off)
FROM layoffs_staging2
GROUP BY company
ORDER BY 2 DESC;

-- Total layoffs per month
SELECT SUBSTRING(`date`, 1, 7) AS `month`, SUM(total_laid_off)
FROM layoffs_staging2
WHERE SUBSTRING(`date`, 1, 7) IS NOT NULL
GROUP BY `month`
ORDER BY 1 ASC;

-- Rolling total layoffs per month
WITH Rolling_Total AS
(
SELECT SUBSTRING(`date`, 1, 7) AS `month`, SUM(total_laid_off) AS total_off
FROM layoffs_staging2
WHERE SUBSTRING(`date`, 1, 7) IS NOT NULL
GROUP BY `month`
ORDER BY 1 ASC
)
SELECT `month`, total_off, 
SUM(total_off) OVER(ORDER BY `month`) AS rolling_total
FROM Rolling_Total;

-- After exploring, we would like to know the following:
-- Companies with the most total layoffs per year (showing top 5 each year)
WITH Company_Year (company, years, total_laid_off) AS
(
SELECT company, YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company, YEAR(`date`)
), Company_Year_Rank AS 
(SELECT *, DENSE_RANK() OVER (PARTITION BY years ORDER BY total_laid_off DESC) AS ranking
FROM Company_Year
WHERE years IS NOT NULL
)
SELECT *
FROM Company_Year_Rank
WHERE Ranking <= 5;
