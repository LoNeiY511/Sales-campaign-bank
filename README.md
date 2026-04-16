# Bank Marketing Campaign Analysis

## Overview
This project analyzes the Bank Marketing dataset to understand customer behavior and campaign performance.

## Tools
* **Python**: Data Cleaning & Preprocessing
* **SQL Server**: Star Schema Modeling
* **Power BI**: Dashboard Visualization

---

## Dataset
**Bank Marketing Dataset** Dưới đây là chi tiết các thuộc tính có trong tập dữ liệu:

### Customer Information
* **1 - age**: (numeric)
* **2 - job**: type of job (categorical)
* **3 - marital**: marital status (categorical)
* **4 - education**: (categorical)
* **5 - default**: has credit in default? (categorical)
* **6 - housing**: has housing loan? (categorical)
* **7 - loan**: has personal loan? (categorical)

### Campaign Details
* **8 - contact**: contact communication type (categorical)
* **9 - month**: last contact month of year (categorical)
* **10 - day_of_week**: last contact day of the week (categorical)
* **11 - duration**: last contact duration, in seconds (numeric). 
> **Note:** This attribute highly affects the output target. It should be discarded for a realistic predictive model.

### Other Attributes
* **12 - campaign**: number of contacts performed during this campaign (numeric)
* **13 - pdays**: number of days passed after the client was last contacted (999 means not previously contacted)
* **14 - previous**: number of contacts performed before this campaign (numeric)
* **15 - poutcome**: outcome of the previous marketing campaign (categorical)

### Social and Economic Context
* **16 - emp.var.rate**: employment variation rate (numeric)
* **17 - cons.price.idx**: consumer price index (numeric)
* **18 - cons.conf.idx**: consumer confidence index (numeric)
* **19 - euribor3m**: euribor 3 month rate (numeric)
* **20 - nr.employed**: number of employees (numeric)

### Target Variable
* **21 - y**: has the client subscribed a term deposit? (binary: 'yes', 'no')

---

## Workflow
1. **Data Cleaning**: Handled using Python (Pandas).
2. **Data Modeling**: Implemented in PostgreSQL using a **Star Schema**.
3. **Data Visualization**: Built interactive dashboards in Power BI.

## Data Model
![Data Model](https://github.com/user-attachments/assets/6e7b2acf-2242-43b6-88f8-cef81915696d)


## Dashboard
| <img src="https://github.com/user-attachments/assets/267b74ce-3367-4c5d-a590-c5f5c4caa240" width="100%"> | <img src="https://github.com/user-attachments/assets/32c02f8a-08d6-4754-8856-6e31d4aa418c" width="100%"> |
| <img src="https://github.com/user-attachments/assets/f2058da2-24ab-4c9f-a7a5-ba50762303ed" width="100%"> | <img src="https://github.com/user-attachments/assets/a0be9abc-ac68-4957-9ebc-1523b9553df7" width="100%"> |
