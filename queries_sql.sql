SELECT DISTINCT
    ROW_NUMBER() OVER (ORDER BY age, job, marital, education) AS customer_id,
    age,
    job,
    marital,
    education,
    default,
    housing,
    loan
INTO dim_customer
FROM bank_marketing_clean;

SELECT DISTINCT
    ROW_NUMBER() OVER (ORDER BY month, day_of_week) AS time_id,
    month,
    day_of_week
INTO dim_contact_time
FROM bank_marketing_clean;

SELECT DISTINCT
    ROW_NUMBER() OVER (ORDER BY emp_var_rate) AS eco_id,
    emp_var_rate,
    cons_price_idx,
    cons_conf_idx,
    euribor3m,
    nr_employed
INTO dim_economic
FROM bank_marketing_clean;

SELECT
    b.campaign,
    b.previous,
    b.pdays,
    b.duration,
    b.y,

    c.customer_id,
    t.time_id,
    e.eco_id

INTO fact_marketing
FROM bank_marketing_clean b

LEFT JOIN dim_customer c
ON  b.age = c.age
AND b.job = c.job
AND b.marital = c.marital
AND b.education = c.education
AND b.default = c.default
AND b.housing = c.housing
AND b.loan = c.loan

LEFT JOIN dim_contact_time t
ON  b.month = t.month
AND b.day_of_week = t.day_of_week

LEFT JOIN dim_economic e
ON  b.emp_var_rate = e.emp_var_rate
AND b.cons_price_idx = e.cons_price_idx
AND b.cons_conf_idx = e.cons_conf_idx
AND b.euribor3m = e.euribor3m
AND b.nr_employed = e.nr_employed;

ALTER TABLE dim_customer
ADD CONSTRAINT PK_dim_customer PRIMARY KEY (customer_id);

ALTER TABLE dim_contact_time
ADD CONSTRAINT PK_dim_time PRIMARY KEY (time_id);

ALTER TABLE dim_economic
ADD CONSTRAINT PK_dim_eco PRIMARY KEY (eco_id);