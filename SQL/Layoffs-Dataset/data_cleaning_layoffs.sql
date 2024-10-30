/* Context (from kaggle)
Tech firms around the globe are fighting the economic slowdown. The slow consumer spending, higher interest rates by central banks and strong dollars overseas are hinting towards 
possible recession and tech firms have started laying employees off. This economic slowdown has made Meta recently fire 13% of its workforce, which amounts to more than 11,000 employees. 
This dataset was made with the hope to enable Kaggle community to look into analyzing recent tech turmoil and discover useful insights.
*/

-- The dataset of this project can be found here:
-- https://www.kaggle.com/datasets/swaptr/layoffs-2022



-- Data Cleaning

SELECT *
FROM layoffs;

-- 0. Create a copy of our Database
-- 1. Remove Duplicates
-- 2. Standardize the Data
-- 3. Null Values or Blank Values
-- 4. Remove Any Columns & Rows



-- 0. Create a copy of our Database
-- (a). Create a copy of the table so we don't directly affect the original database
CREATE TABLE layoffs_staging
LIKE layoffs;

-- (b). Check our new table (without data)
SELECT *
FROM layoffs_staging;

-- (c). Insert all data into our table copy
INSERT layoffs_staging
SELECT *
FROM layoffs;

-- (d). Check our new table (with data)
SELECT *
FROM layoffs_staging;



-- 1. Remove Duplicates
-- (a). Check for rows with duplicates
WITH duplicate_cte AS
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, 
total_laid_off, percentage_laid_off, `date`, 
stage, country, funds_raised_millions) AS row_num
FROM layoffs_staging
)
SELECT *
FROM duplicate_cte
WHERE row_num > 1;

-- (b). Verify a specific example
SELECT *
FROM layoffs_staging
WHERE company = 'Casper';

-- (c). Create another table to determine rows of duplicate data
CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- (d). Insert data from (a). into our second table
INSERT INTO layoffs_staging2
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, 
total_laid_off, percentage_laid_off, `date`, 
stage, country, funds_raised_millions) AS row_num
FROM layoffs_staging;

-- (e). Check our second table (rows with duplicates)
SELECT *
FROM layoffs_staging2
WHERE row_num > 1;

-- (f). Delete rows with duplicates
DELETE
FROM layoffs_staging2
WHERE row_num > 1;

-- (g). Check if (f). works fine
SELECT *
FROM layoffs_staging2
WHERE row_num > 1;

-- (h). Check the updated table
SELECT *
FROM layoffs_staging2;



-- 2. Standardize the Data
-- (a). company (delete white spaces)
UPDATE layoffs_staging2
SET company = TRIM(company);

-- (b). industry (renaming similar industries, crypto in this case)
SELECT DISTINCT industry
FROM layoffs_staging2;

UPDATE layoffs_staging2
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%';

-- (c). location (everything looks fine)
SELECT DISTINCT location
FROM layoffs_staging2
ORDER BY 1;

-- (d). country (renaming same countries, USA in this case)
SELECT DISTINCT country
FROM layoffs_staging2
WHERE country LIKE 'United States%';

SELECT DISTINCT country, TRIM(TRAILING '.' FROM country)
FROM layoffs_staging2
ORDER BY 1;

UPDATE layoffs_staging2
SET country = TRIM(TRAILING '.' FROM country)
WHERE country LIKE 'United States%';

-- (e). date (converting date values from text to date)
SELECT `date`,
STR_TO_DATE(`date`, '%m/%d/%Y')
FROM layoffs_staging2;

UPDATE layoffs_staging2
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');

SELECT `date`
FROM layoffs_staging2;

ALTER TABLE layoffs_staging2
MODIFY COLUMN `date` DATE;

SELECT *
FROM layoffs_staging2;



-- 3. Null Values or Blank Values
-- (a). total_laid_off and percentage_laid_off 
SELECT *
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;
-- Will look at this in step 4

-- (b). industry (replace blank or null with relevant industry if exists) 
UPDATE layoffs_staging2
SET industry = NULL
WHERE industry = '';

SELECT *
FROM layoffs_staging2
WHERE industry IS NULL
OR industry = '';

SELECT *
FROM layoffs_staging2
WHERE company LIKE 'Bally%';

SELECT t1.industry, t2.industry
FROM layoffs_staging2 t1
JOIN layoffs_staging2 t2
	ON t1.company = t2.company
WHERE (t1.industry IS NULL OR t1.industry = '')
AND t2.industry IS NOT NULL;

UPDATE layoffs_staging2 t1
JOIN layoffs_staging2 t2
	ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE t1.industry IS NULL
AND t2.industry IS NOT NULL;

SELECT *
FROM layoffs_staging2;



-- 4. Remove Any Columns & Rows
-- (a). Remove rows that will not provide any insights on the problem we are trying to solve
SELECT *
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

DELETE
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

SELECT *
FROM layoffs_staging2;

-- (b). Remove the row_num column
ALTER TABLE layoffs_staging2
DROP COLUMN row_num;

SELECT *
FROM layoffs_staging2;
