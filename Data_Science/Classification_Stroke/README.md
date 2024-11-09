# [Project 1: Predicting Stroke Using Machine Learning (Classification)](Data_Science/Classification_Stroke)
  > We aim to visualize the relationships between various habits/factors and strokes & predict stroke events with the best model and hyper-tuned parameters.

The original data came from [kaggle](https://www.kaggle.com/datasets/fedesoriano/stroke-prediction-dataset/data).


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


## Best Models
These are the performances of the best two models.

![top2models](https://github.com/user-attachments/assets/f96f745f-6003-4a6e-ad19-6931aa803fac)


## What's Next?
To create predictive models with higher accuracy and better performance, we could continue doing hyperparameter tuning or try other models.
