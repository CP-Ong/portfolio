# Project 2: Sentiment Analysis Of Steam Game Reviews (Black Myth: Wukong)
  > We aim to develop a sentiment analysis model using natural language processing (NLP) techniques to analyze Steam reviews for **Black Myth: Wukong**. This model will identify key drivers of positive and negative user sentiment, providing actionable insights to help game developers address weaknesses and implement data-driven improvements that enhance player satisfaction.

The data was scraped from the [Steam Review Page](https://steamcommunity.com/app/2358720/reviews/) for the game from *10 September 2024* to *14 November 2024* (around 2 months).


## Summary
In this project, I did the following steps:

1. Scraped data (Reviews) from the Steam Review Page of the game.
2. Cleaned our dataset and applied NLTK to the reviews.
3. Carried out keyword analysis and created useful visualizations such as bar plots and word clouds.
4. Implemented sentiment classification using VADER and RoBERTa models.
5. Evaluated the performances of the two models using appropriate metrics.
6. Compared the two models with simple visualizations and suggested improvement methods. 


## Folder Structure
```
📂 root_directory  
 ├── 📂 Dataset  
 │    ├── wukong-dataset.csv: The initial dataset scraped from the Steam Review Page of the game.  
 │    ├── wukong-cleaned-dataset.csv: The dataset used to do simple EDA.
 │    ├── wukong-cleaned-dataset-updated.csv: The dataset used to do keyword analysis.
 ├── 📂 Notebooks  
 │    ├── scraping-steam.ipynb: Notebook to scrape data (reviews) from the Steam Review Page of the game.
 │    ├── data-cleaning.ipynb: Notebook for Data Cleaning.
 │    ├── end-to-end-sentiment-analysis.ipynb: Main Notebook for the project.
 ├── 📂 Model-Scores 
 │    ├── model_scores.csv: The dataset including columns of model scores (VADER & RoBERTa).
```


## Counts of Recommendations (Visualization)
![recommendedornot-bar](https://github.com/user-attachments/assets/58bfda5f-34e5-44ef-8d6f-cbe0ee51e19c)


## Keyword Analysis & Visualizations (WordClouds)

### Word Clouds ('Recommended' Reviews)
![recommended_wordcloud](https://github.com/user-attachments/assets/afc9ec06-c516-4275-ae9a-2ad3fcd91289)

### Most Common 'Recommended' Words
![most-common-top-20-recommended](https://github.com/user-attachments/assets/080fd7bb-4281-42c2-a2bf-f362bf38b888)

### Word Clouds ('Not Recommended' Reviews)
![not_recommended_wordcloud](https://github.com/user-attachments/assets/b6b0cc75-8f68-4244-850c-36de7d394b01)

### Most Common 'Not Recommended' Words
![not-recommended-top-20-words](https://github.com/user-attachments/assets/b1f3a3a7-3b84-49b3-8aab-e6679c308685)


## Keyword Analysis & Visualizations (Based on Positive & Negative Themes)
We separated the reviews into a few categories as follows:

### Positive Themes
* **Performance**: "good", "great", "best", "amazing", "smooth", "fast", "playable", "responsive", "stable", "optimize"

* **Mechanics**: "mechanics", "play", "fun", "boss", "combat", "fight", "gameplay", "attack", "action", "control", "interaction", "enemy"

* **Storyline**: "story", "plot", "narrative", "character", "end", "ending", "wukong", "monkey", "immersive", "dialogue", "lore"

* **Graphics**: "graphic", "visual", "art", "design", "beautiful", "animation", "realistic", "textures", "scenery"

* **Difficulty**: "easy", "challenging", "manageable", "fair", "perfect", "balance", "rewarding", "adaptive", "learning curve", "grind"

![positive-themes](https://github.com/user-attachments/assets/bddd6f9c-6c0f-4738-a968-66780a303d2b)


### Negative Themes
* **Performance**: "good", "bad", "worst", "awful", "lag", "slow", "crash", "fps", "performance", "unstable", "unresponsive", "glitch", "lag", "laggy", "disconnect", "optimize"

* **Mechanics**: "mechanics", "play", "fun", "boss", "combat", "fight", "gameplay", "attack", "action", "control", "interaction", "enemy", "dodge", "invisible wall", "broken", "tedious"

* **Storyline**: "story", "plot", "narrative", "character", "end", "ending", "wukong", "monkey", "immersive", "dialogue", "lore", "boring", "predictable", "disconnected", "shallow"

* **Graphics**: "graphic", "visual", "art", "design", "beautiful", "animation", "realistic", "textures", "scenery", "ugly", "blurry", "pixelated", "poor"

* **Difficulty**: "hard", "difficulty", "challenging", "unfair", "frustrate", "frustrating", "impossible", "punish", "punishing", "grind"

![negative-themes](https://github.com/user-attachments/assets/529175c0-81ef-4d07-a3cb-f47215643ca2)


### Main Observations

* For both 'Recommended' and 'Not Recommended' reviews, **Mechanics** is the most discussed theme. This indicates that **gameplay mechanics** significantly impact player satisfaction and decision-making.
* Moreover, **Performance** came second for both 'Recommended' and 'Not Recommended' reviews. 
  
For more details, refer to the [main notebook](Notebooks/end-to-end-sentiment-analysis.ipynb).


## Modelling & Sentiment Classification
Here are some visualizations of the sentiment scores of our models, including comparisons based on some metrics.

### VADER (Valence Aware Dictionary and sEntiment Reasoner)
![vader_sentiment_scores](https://github.com/user-attachments/assets/2015d681-6280-4769-a395-854bbde62a27)

### RoBERTa (Twitter-roBERTa-base for Sentiment Analysis)
![roberta_sentiment_scores](https://github.com/user-attachments/assets/3837a1a8-678d-407b-9877-fba7ef88dc9f)

### Comparing Models (Performance Metrics)
![model_comparison_metrics](https://github.com/user-attachments/assets/42699a11-0b77-4a95-bf73-ea11d0b0d5e3)

### Summary (For Models)

*VADER* performs better in terms of **accuracy**, **recall**, **F1-Score**, and **Weighted Average F1 Score**.

*RoBERTa* performs better in terms of **precision** and **ROC AUC Score**.


## What's Next?
1. In Section 3.2 when we were doing **keyword analysis**, there might be better/more accurate ways to improve our analysis by adding relevant words in our positive & negative themes dictionaries. Also, there might be duplicates of words in the same review (e.g. someone mentioned good for multiple times in a single review). Moreover, there might be typos/spelling in the reviews.
   
2. In Section 4.3 when we were comparing models, RoBERTa should perform better than VADER in theory (since it is a transformer-based model and is more sophisticated than VADER). However, its performance ultimately depends on the following factors:

    * **Imbalanced Dataset**: Our dataset is imbalanced, which can heavily influence the performance of the model. For instance, RoBERTa might overfit to the majority class 'Recommended' due to its complicated nature, whereas a rule-based model such as VADER is simpler and might perform better on such an imbalanced dataset.
      
    * **Thresholding**: RoBERTa predictions are based on probabilities, and selecting a fixed threshold might not be optimal for our dataset (A different threshold might yield better results). As a reminder, we chose the outcome with the largest probability in our case.
   
    * **Fine-tuning**: Without training it specifically on our dataset, RoBERTa might not generalize well.
      
    * **Task Alignment**: Pre-trained RoBERTa was tuned for tweets, not for game reviews, which might differ in styles and vocabulary.

    To further improve our RoBERTa model, we can do the following:
   
    * **Fine-tune RoBERTa**: Train the model on our game review dataset to adapt it better to the task.
  
    * **Re-adjust Thresholds**: Since our dataset is imbalanced, we could adjust the threshold to obtain better predictions.
  
    * **Balance Our Dataset**: We could use techniques such as undersampling or oversampling (SMOTE) to address the class imbalance between 'Recommended' and 'Not Recommended'.
  
    * **Try Other Models**: We would explore more models which will give us a broader perspective on how well our game reviews are being analyzed (different models have different pros and cons). For example:
        * BERT/DistilBERT - These are simpler models compared to RoBERTa.
        * XLNet/ALBERT - These models are also variations of transformer-based models that could be useful for sentiment analysis tasks.
        * LightGBM/XGBoost - Non-deep learning models that might work well (after feature engineering).
        * Emsemble Models - Combine the strengths of both VADER and RoBERTa using an ensemble model, which could provide a more robust prediction.

3. We could analyse reviews for other games by obtaining data (reviews) from Steam, Twitter, Reddit etc.
