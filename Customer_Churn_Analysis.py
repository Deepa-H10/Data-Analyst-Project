# ============================================================
# 📊 CUSTOMER CHURN ANALYSIS FOR TELECOM INDUSTRY
# ============================================================

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import LabelEncoder, StandardScaler
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import classification_report, confusion_matrix, accuracy_score
import shap
from pathlib import Path

# ============================================================
# 1️⃣ Load Dataset
# ============================================================
df = pd.read_csv('data/Telco-Customer-Churn.csv')
print("Shape:", df.shape)
print(df.head())

# ============================================================
# 2️⃣ Data Cleaning
# ============================================================
# Convert TotalCharges to numeric and handle missing values
df['TotalCharges'] = pd.to_numeric(df['TotalCharges'], errors='coerce')
df.dropna(inplace=True)

# Drop customerID since it's not needed for prediction
if 'customerID' in df.columns:
    df.drop('customerID', axis=1, inplace=True)

# Encode categorical columns
le = LabelEncoder()
for col in df.select_dtypes(include='object'):
    df[col] = le.fit_transform(df[col])

# ============================================================
# 3️⃣ Exploratory Data Analysis (EDA)
# ============================================================
plt.figure(figsize=(6, 4))
sns.countplot(x='Churn', data=df)
plt.title("Churn Distribution")
plt.show()

plt.figure(figsize=(10, 8))
sns.heatmap(df.corr(), cmap='coolwarm')
plt.title("Feature Correlation Heatmap")
plt.show()

# ============================================================
# 4️⃣ Feature Splitting
# ============================================================
X = df.drop('Churn', axis=1)
y = df['Churn']

X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=42)

# ============================================================
# 5️⃣ Model Training
# ============================================================
model = RandomForestClassifier(n_estimators=200, random_state=42)
model.fit(X_train, y_train)

y_pred = model.predict(X_test)
print("✅ Model Accuracy:", accuracy_score(y_test, y_pred))

# ============================================================
# 6️⃣ Model Evaluation
# ============================================================
print("\nClassification Report:\n", classification_report(y_test, y_pred))
sns.heatmap(confusion_matrix(y_test, y_pred),
            annot=True, fmt='d', cmap='Greens')
plt.title("Confusion Matrix")
plt.show()

# ============================================================
# 7️⃣ Feature Importance
# ============================================================
importances = pd.Series(model.feature_importances_, index=X.columns)
importances.sort_values(ascending=False).head(
    10).plot(kind='bar', figsize=(8, 4))
plt.title("Top 10 Feature Importances")
plt.tight_layout()
Path('visuals').mkdir(parents=True, exist_ok=True)
plt.savefig('visuals/feature_importance.png')
plt.show()

# ============================================================
# 8️⃣ Model Explainability with SHAP
# ============================================================
explainer = shap.TreeExplainer(model)
shap_values = explainer.shap_values(X_test)
shap.summary_plot(shap_values[1], X_test, show=False)
plt.savefig('visuals/shap_summary.png', bbox_inches='tight')

# ============================================================
# 9️⃣ Export Processed Data for Power BI
# ============================================================
Path('data').mkdir(parents=True, exist_ok=True)
final_data = X_test.copy()
final_data['Actual_Churn'] = y_test
final_data['Predicted_Churn'] = y_pred
final_data.to_csv('data/final_predictions.csv', index=False)
print("✅ Exported predictions to data/final_predictions.csv")
