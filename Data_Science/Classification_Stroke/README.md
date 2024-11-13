# Project 1: Predicting Stroke Using Machine Learning (Classification)
  > We aim to visualize the relationships between various habits/factors and strokes & predict stroke events with the best model and hyper-tuned parameters.

The original data came from [Kaggle](https://www.kaggle.com/datasets/fedesoriano/stroke-prediction-dataset/data).


## Summary
In this project, I did the following steps:

1. Imported relevant libraries and cleaned the data.
2. Created useful visualizations to answer our questions & assumptions.
3. Normalized the dataset and applied SMOTE to the imbalanced dataset to generate synthetic samples for the minority class (stroke = 1).
4. Implemented and evaluated a few machine learning models using appropriate metrics.
5. Chose the top two models: **AdaBoost Classifier** & **Logistic Regression**.


## Relationships Between Various Factors & Strokes (Visualizations)
Here are some useful plots to visualize relationships between various factors & strokes:

### Numerical Features (Age, BMI, Average Glucose Level)
![merged_dist](https://github.com/user-attachments/assets/9c879520-9eb8-4895-8239-e0340374ac22)

### Categorical Features (Gender, Hypertension, Heart Disease, Work Type, Smoking Status, Ever Married, Residence Type)
![merged_bar](https://github.com/user-attachments/assets/f7187306-6cf5-45ee-863d-759ca150dfde)


## Confusion Matrices
Here are the confusion matrices compared side to side:

![merged_confusion-matrix-2](https://github.com/user-attachments/assets/e1b47599-fac0-471d-9f0f-10fb09b12f59)

## Comparing Models
We compared all models based on their **ROC AUC Score**, **F1 Score**, and **Weighted Average F1 Score**.

By **ROC AUC Score**: <br>
![sort_by_auc](https://github.com/user-attachments/assets/a33f9b76-6a17-4a1b-8790-0a06143f1989)

By **F1 Score (Minority Class, i.e. stroke = 1)**: <br>
![sort_by_f1](https://github.com/user-attachments/assets/de8795c2-0ec1-415c-9ce2-c76eb8ecf51f)

By **Weighted Average F1 Score**: <br>
![sort_by_weighted_f1](https://github.com/user-attachments/assets/48a32969-9b77-4430-8e84-f3bfa4d32a60)

Top 4 across all three metrics: <br>
![top4](https://github.com/user-attachments/assets/b50d03d6-eba6-4198-b85b-56c50c58159f)


## Best Models
Finally, note that we are focusing on **medical diagnosis** in this project. This means that we need to **reduce** as many **False Negatives** as possible. According to the formulas, this directly implies that we need to prioritize **F1 Score (stroke = 1)**, i.e. choose the models that achieved the **highest F1 Score (stroke = 1)**. Therefore, the top two models we will choose are **AdaBoost Classifier** and **Logistic Regression**. 

These are the performances of the best two models:

![top2models](https://github.com/user-attachments/assets/f96f745f-6003-4a6e-ad19-6931aa803fac)


## What's Next?
To create predictive models with higher accuracy and better performance, we could continue doing hyperparameter tuning or try other models.
