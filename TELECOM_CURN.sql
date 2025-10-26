CREATE TABLE telco_churn (
    customerID VARCHAR(20) PRIMARY KEY,
    gender VARCHAR(10),
    SeniorCitizen INT,
    Partner VARCHAR(5),
    Dependents VARCHAR(5),
    tenure INT,
    PhoneService VARCHAR(5),
    InternetService VARCHAR(20),
    Contract VARCHAR(30),
    PaymentMethod VARCHAR(30),
    MonthlyCharges DECIMAL(10,2),
    TotalCharges DECIMAL(10,2),
    Churn VARCHAR(5)
);

INSERT INTO telco_churn VALUES
('C001', 'Female', 0, 'Yes', 'No', 2, 'Yes', 'Fiber optic', 'Month-to-month', 'Electronic check', 80.50, 160.75, 'Yes'),
('C002', 'Male', 1, 'No', 'No', 24, 'Yes', 'DSL', 'One year', 'Mailed check', 65.00, 1500.00, 'No'),
('C003', 'Female', 0, 'Yes', 'Yes', 12, 'Yes', 'Fiber optic', 'Month-to-month', 'Credit card (automatic)', 90.75, 1000.50, 'Yes'),
('C004', 'Male', 0, 'No', 'No', 48, 'Yes', 'DSL', 'Two year', 'Bank transfer (automatic)', 55.25, 2500.75, 'No'),
('C005', 'Female', 1, 'Yes', 'No', 5, 'Yes', 'Fiber optic', 'Month-to-month', 'Electronic check', 95.00, 475.00, 'Yes'),
('C006', 'Male', 0, 'Yes', 'Yes', 36, 'Yes', 'DSL', 'One year', 'Credit card (automatic)', 70.50, 2540.00, 'No'),
('C007', 'Female', 0, 'No', 'No', 1, 'Yes', 'Fiber optic', 'Month-to-month', 'Electronic check', 99.00, 99.00, 'Yes'),
('C008', 'Male', 0, 'No', 'No', 60, 'Yes', 'DSL', 'Two year', 'Bank transfer (automatic)', 50.00, 3100.00, 'No');


SELECT 
    ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate_percentage
FROM telco_churn;


SELECT 
    Contract,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate
FROM telco_churn
GROUP BY Contract
ORDER BY churn_rate DESC;

SELECT 
    Churn,
    ROUND(AVG(MonthlyCharges), 2) AS avg_monthly_charges
FROM telco_churn
GROUP BY Churn;

SELECT 
    InternetService,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers
FROM telco_churn
GROUP BY InternetService
ORDER BY churned_customers DESC;

SELECT 
    CASE 
        WHEN tenure BETWEEN 0 AND 12 THEN '0–1 Year'
        WHEN tenure BETWEEN 13 AND 24 THEN '1–2 Years'
        WHEN tenure BETWEEN 25 AND 48 THEN '2–4 Years'
        ELSE '4+ Years'
    END AS tenure_group,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers
FROM telco_churn
GROUP BY tenure_group
ORDER BY churned_customers DESC;


