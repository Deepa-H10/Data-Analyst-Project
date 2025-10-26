Project Overview

Customer churn is one of the most critical challenges faced by telecom companies. This project focuses on analyzing telecom customer data to understand the main factors that contribute to churn and to predict which customers are likely to discontinue their services.
Using data analytics, visualization, and machine learning, this project provides actionable insights to help reduce customer attrition and improve business performance.

🎯 Objective

To predict whether a telecom customer will churn based on their service usage and demographic information.

To identify key behavioral and financial factors influencing churn.

To provide actionable insights and retention strategies through visual dashboards.

🧰 Tools & Technologies Used
Category	Tools / Libraries
Programming	Python
Data Analysis	Pandas, NumPy
Visualization	Matplotlib, Seaborn
Machine Learning	Scikit-learn (Random Forest Classifier)
Model Explainability	SHAP
Dashboard	Power BI
Reporting	Microsoft Word / PDF
🧩 Project Workflow

Data Collection:
Used the Telco Customer Churn Dataset from Kaggle (7,043 rows, 21 columns).

Data Preprocessing:

Converted blank values in TotalCharges to numeric.

Dropped irrelevant columns such as customerID.

Encoded categorical features using LabelEncoder.

Exploratory Data Analysis (EDA):

Visualized churn rate by gender, contract type, and payment method.

Analyzed correlation between tenure, monthly charges, and churn.

Model Building:

Applied Random Forest Classifier to predict churn.

Achieved ~82% accuracy on the test data.

Model Evaluation & Explainability:

Evaluated using Accuracy, Precision, Recall, and F1-score.

Used SHAP values to understand key churn factors.

Visualization (Power BI):

Created an interactive dashboard showing churn distribution, monthly charges, and tenure impact.

Added slicers for gender, contract type, and payment method.

Report Preparation:

Compiled a 2-page summary report including introduction, objectives, tools, steps, and conclusion.

📊 Key Insights

Customers with month-to-month contracts show the highest churn rate.

High monthly charges and short tenure (<12 months) strongly correlate with churn.

Customers using electronic check payments are more likely to churn.

🚀 Results

Model Accuracy: 82%

Top Features Affecting Churn: Contract Type, Tenure, Monthly Charges, Payment Method.

Deliverables:

Python model & visualizations

Power BI interactive dashboard

2-page summary report
🧠 Future Enhancements

Implement deep learning models (e.g., Neural Networks) for better accuracy.

Automate dashboard updates using Power BI API or Python scripts.

Integrate customer churn alerts with CRM systems.

💬 Conclusion

This project demonstrates how data-driven insights can transform business strategies in the telecom industry. With the combination of predictive modeling and visualization, companies can proactively retain customers, improve satisfaction, and boost revenue.
