-- Bank Marketing Analytics
-- Customer & Campaign SQL Analysis
-- Author: Abigail Calvert

-- Purpose:
-- Analyze customer characteristics and marketing campaign performance
-- using SQL to identify patterns associated with term deposit subscriptions.


-- ============================================================
-- 1. DATA VALIDATION
-- ============================================================

-- Confirm the number of customer records in the dataset.


SELECT COUNT(*) AS total_customers 
FROM bank_marketing;


SELECT
    y AS subscription_status,
    COUNT(*) AS total_customers
FROM bank_marketing
GROUP BY y;
-- Calculate the overall term deposit subscription rate.

SELECT
    ROUND(
        100.0 * SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS subscription_rate_pct
FROM bank_marketing;

-- ============================================================
-- 2. CUSTOMER SEGMENTATION BY JOB
-- ============================================================

-- Compare term deposit subscription rates across job categories.
-- This helps identify customer segments with higher response rates.
SELECT
    job,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) AS subscribed_customers,
    ROUND(
        100.0 * SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS subscription_rate_pct
FROM bank_marketing
GROUP BY job
ORDER BY subscription_rate_pct DESC;

-- ============================================================
-- 3. HOUSING LOAN ANALYSIS
-- ============================================================

-- Compare term deposit subscription rates between customers
-- with and without an existing housing loan.

SELECT 
    housing,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) AS subscribed_customers,
    ROUND(
        100.0 * SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS subscription_rate_pct

FROM bank_marketing
GROUP BY housing;

-- ============================================================
-- 4. PERSONAL LOAN ANALYSIS
-- ============================================================

-- Compare term deposit subscription rates between customers
-- with and without an existing personal loan.
SELECT 
    loan,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) AS subscribed_customers,
    ROUND(
        100.0 * SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS subscription_rate_pct
FROM bank_marketing
GROUP BY loan;

-- ============================================================
-- 5. CONTACT METHOD ANALYSIS
-- ============================================================

-- Compare term deposit subscription rates across contact methods.
-- This helps evaluate whether campaign response differs by
-- the method used to contact customers.

SELECT
    contact,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) AS subscribed_customers,
    ROUND(
        100.0 * SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS subscription_rate_pct
FROM bank_marketing
GROUP BY contact
ORDER BY subscription_rate_pct DESC;

-- ============================================================
-- 6. CAMPAIGN CONTACT FREQUENCY
-- ============================================================

-- Compare the average number of campaign contacts
-- for customers who subscribed versus those who did not.

SELECT
    y AS subscription_status,
    COUNT(*) AS total_customers,
    ROUND(AVG(campaign), 2) AS avg_campaign_contacts
FROM bank_marketing
GROUP BY y
ORDER BY avg_campaign_contacts DESC;

SELECT
    CASE 
        WHEN campaign = 1 THEN '1 contact'
        WHEN campaign = 2 THEN '2 contacts'
        WHEN campaign = 3 THEN '3 contacts'
        ELSE '4+ contacts'
    END AS contact_frequency,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) AS subscribed_customers,
    ROUND(
        100.0 * SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS subscription_rate_pct
FROM bank_marketing
GROUP BY contact_frequencY
ORDER BY subscription_rate_pct DESC;

-- ============================================================
-- 7. POSITIVE BALANCE CUSTOMER ANALYSIS
-- ============================================================

-- Compare average balances and subscription rates by job
-- for customers with positive account balances.
SELECT
    job,
    COUNT(*) AS total_customers,
    ROUND(AVG(balance), 2) AS avg_balance,
    ROUND(
        100.0 * SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS subscription_rate_pct
FROM bank_marketing
WHERE balance > 0
GROUP BY job
ORDER BY avg_balance DESC;

-- =====================================================
-- 8. BALANCE SEGMENT ANALYSIS USING A CTE
-- =====================================================

-- Segment customers by account balance and compare
-- term deposit subscription behavior across the segments.

WITH customer_segments AS (
    SELECT
        CASE
            WHEN balance <= 0 THEN 'Negative/Zero'
            WHEN balance <= 1000 THEN 'Low'
            WHEN balance <= 5000 THEN 'Medium'
            ELSE 'High'
        END AS balance_segment,
        y
    FROM bank_marketing
)
SELECT
    balance_segment,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) AS subscribed_customers,
    ROUND(
        100.0 * SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS subscription_rate_pct
FROM customer_segments
GROUP BY balance_segment
ORDER BY subscription_rate_pct DESC;

-- =====================================================
-- 9. JOB PERFORMANCE RANKING USING WINDOW FUNCTIONS
-- =====================================================

-- Rank job categories by term deposit subscription rate.
-- Demonstrates CTEs and the RANK() window function.

WITH job_performance AS(
    SELECT
        job,
        COUNT(*) AS total_customers,
        SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) AS subscribed_customers,
        ROUND(
            100.0 * SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) / COUNT(*),
            2
        ) AS subscription_rate_pct
    FROM bank_marketing
    GROUP BY job
)
    SELECT
        job,
        total_customers,
        subscribed_customers,
        subscription_rate_pct,
        RANK() OVER (
            ORDER BY subscription_rate_pct DESC
        ) AS subscription_rank
    FROM job_performance
    ORDER BY subscription_rank;

-- =====================================================
-- 10. JOB AND HOUSING LOAN SEGMENT COMPARISON
-- =====================================================

-- Compare term deposit subscription rates for customers
-- with and without housing loans across job categories.

-- =====================================================
-- 10. JOB AND HOUSING LOAN SEGMENT COMPARISON
-- =====================================================

-- Compare term deposit subscription rates for customers
-- with and without housing loans across job categories.

SELECT
    job,
    COUNT(*) AS total_customers,

    SUM(CASE WHEN housing = 'no' THEN 1 ELSE 0 END)
        AS no_housing_customers,

    ROUND(
        100.0 * SUM(
            CASE WHEN housing = 'no' AND y = 'yes' THEN 1 ELSE 0 END
        ) / NULLIF(
            SUM(CASE WHEN housing = 'no' THEN 1 ELSE 0 END),
            0
        ),
        2
    ) AS no_housing_rate_pct,

    SUM(CASE WHEN housing = 'yes' THEN 1 ELSE 0 END)
        AS housing_customers,

    ROUND(
        100.0 * SUM(
            CASE WHEN housing = 'yes' AND y = 'yes' THEN 1 ELSE 0 END
        ) / NULLIF(
            SUM(CASE WHEN housing = 'yes' THEN 1 ELSE 0 END),
            0
        ),
        2
    ) AS housing_rate_pct

FROM bank_marketing
GROUP BY job
ORDER BY total_customers DESC;

-- =====================================================
-- SQL ANALYSIS: KEY BUSINESS INSIGHTS
-- =====================================================

-- 1. OVERALL CAMPAIGN PERFORMANCE
-- The dataset contains 45,211 customer records.
-- Of these, 5,289 resulted in a term deposit subscription.
-- Overall subscription rate: 11.70%.

-- 2. FINANCIAL CHARACTERISTICS
-- Customers without housing loans had a 16.70% subscription
-- rate, compared with 7.70% for customers with housing loans.
--
-- Customers without personal loans had a 12.66% subscription
-- rate, compared with 6.68% for customers with personal loans.

-- 3. CONTACT FREQUENCY
-- Customers contacted once had a 14.60% subscription rate.
-- Customers contacted four or more times had a 7.35% rate.
-- These results show an association, not causation.

-- 4. CUSTOMER BALANCE
-- Customers with balances above 5,000 had a 15.50%
-- subscription rate, compared with 6.90% among customers
-- with zero or negative balances.

-- 5. MULTIVARIABLE SEGMENTATION
-- Across all 12 job categories, customers without housing
-- loans had higher subscription rates than customers
-- with housing loans.
--
-- Students without housing loans: 35.85%.
-- Students with housing loans: 8.84%.

-- BUSINESS INTERPRETATION
-- Customer financial characteristics, occupation, and
-- campaign contact frequency are associated with differences
-- in term deposit subscription behavior.
--
-- These findings may help identify customer segments for
-- further marketing analysis, but do not establish causation.