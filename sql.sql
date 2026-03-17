-- DIMENSION TABLES
-- Customer
CREATE TABLE dim_customer (
    customer_id SERIAL PRIMARY KEY,
    age INT,
    job TEXT,
    marital TEXT,
    education TEXT,
    credit_default TEXT,
    housing TEXT,
    loan TEXT,
    UNIQUE (age, job, marital, education, credit_default, housing, loan)
);

-- Time
CREATE TABLE dim_time (
    time_id SERIAL PRIMARY KEY,
    month TEXT,
    day_of_week TEXT,
    month_num INT,
    UNIQUE (month, day_of_week)
);

-- Contact Type
CREATE TABLE dim_contact_type (
    contact_id SERIAL PRIMARY KEY,
    contact TEXT UNIQUE
);

-- Economic
CREATE TABLE dim_economic (
    economic_id SERIAL PRIMARY KEY,
    emp_var_rate NUMERIC,
    cons_price_idx NUMERIC,
    cons_conf_idx NUMERIC,
    euribor3m NUMERIC,
    nr_employed NUMERIC,
    UNIQUE (emp_var_rate, cons_price_idx, cons_conf_idx, euribor3m, nr_employed)
);

-- Campaign
CREATE TABLE dim_campaign (
    campaign_id SERIAL PRIMARY KEY,
    poutcome TEXT UNIQUE
);


-- FACT TABLE


CREATE TABLE fact_marketing (
    fact_id SERIAL PRIMARY KEY,
    customer_id INT,
    time_id INT,
    contact_id INT,
    economic_id INT,
    campaign_id INT,

    duration INT,
    campaign INT,
    pdays INT,
    previous INT,
    y BOOLEAN,

    FOREIGN KEY (customer_id) REFERENCES dim_customer(customer_id),
    FOREIGN KEY (time_id) REFERENCES dim_time(time_id),
    FOREIGN KEY (contact_id) REFERENCES dim_contact_type(contact_id),
    FOREIGN KEY (economic_id) REFERENCES dim_economic(economic_id),
    FOREIGN KEY (campaign_id) REFERENCES dim_campaign(campaign_id)
);
CREATE INDEX idx_fact_customer ON fact_marketing(customer_id);
CREATE INDEX idx_fact_time ON fact_marketing(time_id);
CREATE INDEX idx_fact_contact ON fact_marketing(contact_id);
CREATE INDEX idx_fact_economic ON fact_marketing(economic_id);
CREATE INDEX idx_fact_campaign ON fact_marketing(campaign_id);


TRUNCATE TABLE 
    fact_marketing,
    dim_customer,
    dim_time,
    dim_contact_type,
    dim_economic,
    dim_campaign
RESTART IDENTITY CASCADE;

INSERT INTO dim_customer (age, job, marital, education, credit_default, housing, loan)
SELECT DISTINCT 
    age, job, marital, education, "default", housing, loan
FROM customer

INSERT INTO dim_time (month, day_of_week, month_num)
SELECT DISTINCT 
    month,
    day_of_week,
    CASE 
        WHEN month = 'jan' THEN 1
        WHEN month = 'feb' THEN 2
        WHEN month = 'mar' THEN 3
        WHEN month = 'apr' THEN 4
        WHEN month = 'may' THEN 5
        WHEN month = 'jun' THEN 6
        WHEN month = 'jul' THEN 7
        WHEN month = 'aug' THEN 8
        WHEN month = 'sep' THEN 9
        WHEN month = 'oct' THEN 10
        WHEN month = 'nov' THEN 11
        WHEN month = 'dec' THEN 12
    END
FROM customer

INSERT INTO dim_contact_type (contact)
SELECT DISTINCT contact
FROM customer
;

INSERT INTO dim_economic (
    emp_var_rate, 
    cons_price_idx, 
    cons_conf_idx, 
    euribor3m, 
    nr_employed
)
SELECT DISTINCT 
    emp_var_rate,
    cons_price_idx,
    cons_conf_idx,
    euribor3m,
    nr_employed
FROM customer

INSERT INTO dim_campaign (poutcome)
SELECT DISTINCT poutcome
FROM customer

INSERT INTO fact_marketing (
    customer_id, time_id, contact_id, economic_id, campaign_id,
    duration, campaign, pdays, previous, y
)
SELECT 
    dc.customer_id,
    dt.time_id,
    dct.contact_id,
    de.economic_id,
    dca.campaign_id,

    c.duration,
    c.campaign,
    c.pdays,
    c.previous,
    CASE WHEN c.y = 'yes' THEN TRUE ELSE FALSE END

FROM customer c

JOIN dim_customer dc 
ON c.age = dc.age 
AND c.job = dc.job 
AND c.marital = dc.marital 
AND c.education = dc.education
AND c.default = dc.credit_default 
AND c.housing = dc.housing 
AND c.loan = dc.loan

JOIN dim_time dt 
ON c.month = dt.month 
AND c.day_of_week = dt.day_of_week

JOIN dim_contact_type dct 
ON c.contact = dct.contact

JOIN dim_economic de 
ON c.emp_var_rate = de.emp_var_rate
AND c.cons_price_idx = de.cons_price_idx
AND c.cons_conf_idx = de.cons_conf_idx
AND c.euribor3m = de.euribor3m
AND c.nr_employed = de.nr_employed

JOIN dim_campaign dca 
ON c.poutcome = dca.poutcome; 

SELECT * FROM dim_contact_type
SELECT * FROM dim_campaign
SELECT * FROM dim_customer
SELECT * FROM dim_economic
SELECT * FROM dim_time
SELECT * FROM fact_marketing