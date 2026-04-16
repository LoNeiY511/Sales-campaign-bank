# Bank Marketing Campaign Analysis

## Overview
This project analyzes the Bank Marketing dataset to understand customer behavior and campaign performance.

## Tools
- Python (Pandas, Data Cleaning)
- SQL Server (Star Schema Modeling)
- Power BI (Dashboard Visualization)
## Dataset
Bank Marketing Dataset
### 1 - age (numeric) 
### 2 - job : type of job (categorical: 'admin.','blue-collar','entrepreneur','housemaid','management','retired','self-employed','services','student','technician','unemployed','unknown') 
### 3- marital : marital status (categorical: 'divorced','married','single','unknown'; note: 'divorced' means divorced or widowed) 
### 4 - education (categorical: 'basic.4y','basic.6y','basic.9y','high.school','illiterate','professional.course','university.degree','unknown') 
### 5 - default: has credit in default? (categorical: 'no','yes','unknown') 
### 6 - housing: has housing loan? (categorical: 'no','yes','unknown') 
### 7 - loan: has personal loan? (categorical: 'no','yes','unknown') 
# # related with the last contact of the current campaign: 
### 8 - contact: contact communication type (categorical: 'cellular','telephone') 
### 9 - month: last contact month of year (categorical: 'jan', 'feb', 'mar', ..., 'nov', 'dec') 
### 10 - day_of_week: last contact day of the week (categorical: 'mon','tue','wed','thu','fri') 
### 11 - duration: last contact duration, in seconds (numeric). Important note: this attribute highly affects the output target (e.g., if duration=0 then y='no'). Yet, the duration is not known before a call is performed. Also, after the end of the call y is obviously known. Thus, this input should only be included for benchmark purposes and should be discarded if the intention is to have a realistic predictive model. 
# other attributes 
### 12 - campaign: number of contacts performed during this campaign and for this client (numeric, includes last contact) 
### 13 - pdays: number of days that passed by after the client was last contacted from a previous campaign (numeric; 999 means client was not previously contacted) 
### 14 - previous: number of contacts performed before this campaign and for this client (numeric) 
### 15 - poutcome: outcome of the previous marketing campaign (categorical: 'failure','nonexistent','success') 
# social and economic context attributes 
### 16 - emp.var.rate: employment variation rate - quarterly indicator (numeric) 
### 17 - cons.price.idx: consumer price index - monthly indicator (numeric) 
### 18 - cons.conf.idx: consumer confidence index - monthly indicator (numeric) 
### 19 - euribor3m: euribor 3 month rate - daily indicator (numeric) 
### 20 - nr.employed: number of employees - quarterly indicator (numeric) 
# # campaign result 
### 21 - y - has the client subscribed a term deposit? (binary: 'yes','no') 

## Workflow
1. Data Cleaning using Python
2. Data Modeling using PostgreSQL (Star Schema)
3. Data Visualization using Power BI

## Data Model
<img width="951" height="620" alt="image" src="https://github.com/user-attachments/assets/6e7b2acf-2242-43b6-88f8-cef81915696d" />


## Dashboard
<img width="879" height="507" alt="image" src="https://github.com/user-attachments/assets/267b74ce-3367-4c5d-a590-c5f5c4caa240" />
<img width="876" height="507" alt="image" src="https://github.com/user-attachments/assets/32c02f8a-08d6-4754-8856-6e31d4aa418c" />
<img width="877" height="508" alt="image" src="https://github.com/user-attachments/assets/f2058da2-24ab-4c9f-a7a5-ba50762303ed" />
<img width="877" height="506" alt="image" src="https://github.com/user-attachments/assets/a1dc5a5a-ddc8-4a61-be0e-a0483e02d4e0" />



## Dataset
Bank Marketing Dataset
