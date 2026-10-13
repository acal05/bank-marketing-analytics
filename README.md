# Bank Marketing Analytics & Response Prediction

## Project Overview

Banks often use direct marketing campaigns to promote financial products such as term deposits. While these campaigns can reach thousands of customers, contacting every customer can be costly and inefficient.

The objective of this project is to analyze customer demographics, financial characteristics, and previous marketing interactions to identify patterns associated with successful term deposit subscriptions.

The project follows an end-to-end analytics workflow that progresses from exploratory data analysis and customer segmentation to SQL business analysis, statistical analysis, predictive modeling, data visualization, and business recommendations.

The ultimate goal is to combine descriptive analytics and predictive modeling to support more informed marketing decisions within financial services.

---

## Data Source

This project uses the **Bank Marketing Dataset** from the UCI Machine Learning Repository. The dataset contains information from direct marketing campaigns conducted by a Portuguese banking institution, primarily through telephone contact.

The analysis uses the `bank-full.csv` dataset, containing **45,211 customer records** and information on customer demographics, financial characteristics, campaign interactions, previous campaign outcomes, and whether the customer subscribed to a term deposit.

**Source:** [UCI Machine Learning Repository — Bank Marketing Dataset](https://archive.ics.uci.edu/dataset/222/bank+marketing)

**Creators:** Sérgio Moro, Paulo Rita, and Paulo Cortez

**DOI:** 10.24432/C5K306

---

## Business Problem

**How can the bank improve the efficiency of its direct marketing campaigns by identifying customer and campaign characteristics associated with higher term deposit subscription rates?**

The project investigates how customer characteristics, financial obligations, and marketing activity relate to subscription outcomes.

The analysis focuses on translating historical campaign data into insights that could support customer segmentation, marketing strategy, and future predictive modeling.

---

## Dataset

The dataset contains 45,211 customer records and includes variables describing:

- Customer demographics
- Employment and education
- Account balances
- Credit default status
- Housing loan status
- Personal loan status
- Marketing contact methods
- Campaign contact frequency
- Previous marketing campaign outcomes
- Term deposit subscription status (`y`) as the target variable

The target variable identifies whether a customer subscribed to a term deposit, with values of `yes` or `no`.

---

## Tools & Technologies

### Currently Used

- Python
- pandas
- NumPy
- Matplotlib
- Jupyter Notebook
- SQL
- SQLite
- Visual Studio Code
- Git
- GitHub

### Planned for Later Phases

- Statistical Analysis
- Scikit-learn
- Logistic Regression
- Classification Model Evaluation
- Power BI

---

# Project Workflow

## Phase 1 — Data Preparation ✅

Initial preparation and validation included:

- Imported the raw dataset
- Inspected dataset dimensions and structure
- Reviewed data types
- Examined missing and unknown values
- Validated important variables
- Reviewed the target variable
- Prepared the dataset for exploratory analysis

The dataset contains **45,211 records**, providing a substantial sample for customer segmentation and predictive analysis.

---

## Phase 2 — Exploratory Data Analysis ✅

The initial exploratory analysis examines the overall characteristics of the bank's customers and marketing activity.

### Customer Characteristics

Analysis includes:

- Age
- Occupation
- Marital status
- Education
- Credit default
- Housing loans
- Personal loans
- Account balances

### Marketing Campaign Characteristics

Analysis includes:

- Contact method
- Contact month
- Campaign activity
- Term deposit subscription outcome

The exploratory analysis establishes the overall structure and distribution of the data before comparing customer groups.

---

## Phase 3 — Comparative Customer Analysis ✅

The comparative analysis extends the initial exploratory analysis by examining differences in term deposit subscription behavior across customer and campaign characteristics.

The analysis examines:

- Overall term deposit subscription rate
- Subscription rates across occupations
- Subscription rates across age groups
- Account balance differences between subscribers and non-subscribers
- Housing loan status and subscription behavior
- Personal loan status and subscription behavior
- Contact method and subscription behavior
- Campaign contact frequency
- Previous campaign outcomes
- Multi-variable customer segmentation

The purpose of this phase is to move beyond simple distributions and identify customer segments and campaign characteristics associated with different response rates.

These findings are **descriptive rather than causal**. They identify patterns and relationships in historical campaign data but do not establish that any individual characteristic causes a customer to subscribe.

---

## Phase 4 — SQL Business Analysis ✅

SQL was used to extend the Python analysis and investigate customer characteristics, financial obligations, and marketing campaign performance.

The analysis was performed using **SQLite** and the `bank_marketing` table containing 45,211 records.

### SQL Analysis Completed

**1. Data Validation and Campaign Performance**

- Verified the total number of customer records
- Calculated the number of successful and unsuccessful subscriptions
- Calculated the overall term deposit subscription rate

**2. Customer Segmentation**

- Compared subscription rates across occupations
- Ranked occupational groups by subscription performance
- Examined differences in subscription behavior across financial characteristics

**3. Financial Characteristics**

- Compared subscription rates for customers with and without housing loans
- Compared subscription rates for customers with and without personal loans
- Examined account balances across occupational groups
- Created balance-based customer segments to compare subscription behavior

**4. Marketing Campaign Performance**

- Compared subscription rates across contact methods
- Analyzed average campaign contact frequency
- Grouped customers by the number of campaign contacts
- Compared subscription rates across contact-frequency categories

**5. Multi-Variable Analysis**

- Compared occupation and housing loan status together
- Examined subscription rates within customer subgroups
- Used conditional aggregation to calculate multiple performance metrics in a single query

### SQL Techniques Demonstrated

- `SELECT` and `WHERE`
- `COUNT()`, `SUM()`, and `AVG()`
- `ROUND()`
- `CASE WHEN`
- `GROUP BY`
- `ORDER BY`
- Conditional aggregation
- Common Table Expressions (`WITH`)
- Window functions (`RANK() OVER`)
- Customer segmentation
- Calculated business metrics
- Multi-variable comparisons

These queries demonstrate how SQL can translate business questions into measurable customer and campaign performance indicators.

**SQL Analysis File:** [Customer and Campaign SQL Analysis](sql/01_customer_campaign_analysis.sql)

---

## Current Progress

| Phase | Status |
|---|:---:|
| Data Preparation | ✅ Complete |
| Exploratory Data Analysis | ✅ Complete |
| Comparative Customer Analysis | ✅ Complete |
| SQL Business Analysis | ✅ Complete |
| Statistical Analysis | ⏳ Planned |
| Predictive Modeling | ⏳ Planned |
| Model Evaluation | ⏳ Planned |
| Power BI Dashboard | ⏳ Planned |
| Business Recommendations | ⏳ Planned |

---

# Key Analytical Findings

## 1. Overall Campaign Performance

The dataset contains **45,211 customer records**.

Of these:

- **5,289 customers** subscribed to a term deposit.
- **39,922 customers** did not subscribe.
- The overall subscription rate was **11.70%**.

The relatively low positive response rate highlights the importance of understanding customer characteristics associated with successful subscriptions.

It also introduces a class imbalance consideration for future predictive modeling.

## 2. Housing Loan Status

Customers without housing loans had a higher historical term deposit subscription rate than customers with housing loans.

| Housing Loan Status | Customers | Subscription Rate |
|---|---:|---:|
| No | 20,081 | 16.70% |
| Yes | 25,130 | 7.70% |

This suggests that housing loan status is associated with differences in subscription behavior.

However, additional analysis would be needed to determine whether this relationship persists after accounting for other customer characteristics.

## 3. Personal Loan Status

Customers without personal loans also demonstrated higher subscription rates.

| Personal Loan Status | Customers | Subscription Rate |
|---|---:|---:|
| No | 37,967 | 12.66% |
| Yes | 7,244 | 6.68% |

These results suggest that existing financial obligations may be useful variables for understanding customer subscription behavior.

## 4. Contact Method Performance

Historical subscription rates differed across marketing contact methods.

| Contact Method | Customers | Subscription Rate |
|---|---:|---:|
| Cellular | 29,285 | 14.92% |
| Telephone | 2,906 | 13.42% |
| Unknown | 13,020 | 4.07% |

Cellular contacts were associated with the highest observed subscription rate.

The unknown category had a substantially lower rate, although this does not establish that the contact method itself caused the difference.

## 5. Campaign Contact Frequency

Subscription rates also varied depending on how many times customers were contacted during a campaign.

| Number of Contacts | Customers | Subscription Rate |
|---|---:|---:|
| 1 contact | 17,544 | 14.60% |
| 2 contacts | 12,505 | 11.20% |
| 3 contacts | 5,521 | 11.19% |
| 4+ contacts | 9,641 | 7.35% |

Customers contacted once had the highest observed subscription rate.

Customers contacted four or more times had the lowest rate.

These results suggest that contact frequency is an important variable to investigate when evaluating campaign efficiency.

However, customers may receive additional contacts because they have not yet subscribed, so these results should not be interpreted as evidence that additional contact attempts cause lower subscription rates.

## 6. Customer Balance Segmentation

Customers were grouped into balance categories to investigate whether account balance levels were associated with subscription behavior.

| Balance Segment | Customers | Subscription Rate |
|---|---:|---:|
| High | 2,845 | 15.50% |
| Medium | 11,786 | 15.33% |
| Low | 23,300 | 10.90% |
| Negative/Zero | 7,280 | 6.90% |

Customers in the high and medium balance segments had higher observed subscription rates than customers in the low or negative/zero balance segments.

This suggests that account balance may be useful for customer segmentation and future predictive modeling.

## 7. Occupational Differences

Subscription rates also varied across occupational categories.

Examples include:

- Students: **28.68%**
- Retired customers: **22.79%**
- Management: **13.76%**
- Technicians: **11.06%**
- Blue-collar workers: **7.27%**

These results show that subscription behavior differs across customer groups and reinforce the value of customer segmentation.

Occupational categories also vary substantially in size, which should be considered when interpreting their performance.

---

# Analytical Interpretation

The exploratory, comparative, and SQL analyses suggest that customer financial characteristics, occupational categories, and marketing campaign interactions are associated with differences in term deposit subscription rates.

Several variables appear promising for further investigation, including:

- Housing loan status
- Personal loan status
- Account balance
- Occupation
- Contact method
- Campaign contact frequency

These relationships provide a foundation for statistical analysis and predictive modeling.

**Important limitation:** All findings are based on historical observational data. The analysis identifies associations, not causal effects. Marketing decisions should not be based solely on these descriptive comparisons without further validation.

---

# Next Phase — Statistical Analysis and Predictive Modeling

The next stage of the project will move beyond descriptive analysis to evaluate relationships statistically and build predictive classification models.

### Planned Statistical Analysis

- Examine relationships between selected customer characteristics and subscription outcomes
- Apply appropriate statistical tests
- Interpret statistical significance alongside practical business relevance

### Planned Predictive Modeling

- Prepare features for machine learning
- Encode categorical variables
- Split data into training and testing sets
- Build a baseline classification model
- Train a logistic regression model
- Compare model performance
- Evaluate precision, recall, F1-score, and ROC-AUC
- Interpret confusion matrices
- Identify important predictors of subscription outcomes

Special attention will be given to class imbalance because successful subscriptions represent a minority of the dataset.

The modeling process will also consider information availability and potential data leakage to ensure that predictions reflect realistic marketing decisions.

---

# Example Visualizations

## Age Distribution

![Age Distribution](plots/age_distribution.png)

---

## Occupation Distribution

![Occupation Distribution](plots/job_distribution.png)

---

## Education Distribution

![Education Distribution](plots/education_distribution.png)

---

## Contact Method Distribution

![Contact Method Distribution](plots/contact_method_distribution.png)

---

## Customer Contacts by Month

![Customer Contacts by Month](plots/month_distribution.png)

---

## Subscription Rate by Age Group

![Subscription Rate by Age Group](plots/age_subscription_rate.png)

---

## Subscription Rate by Occupation

![Subscription Rate by Occupation](plots/job_subscription_rate.png)

---

## Subscription Rate by Housing Loan Status

![Subscription Rate by Housing Loan Status](plots/housing_subscription_rate.png)

---

## Account Balance by Subscription Outcome

![Account Balance by Subscription Outcome](plots/balance_subscription_boxplot.png)

---

# Skills Demonstrated

## Python & Data Analysis

- Data loading and inspection with pandas
- Data validation and preparation
- Exploratory data analysis
- Grouped aggregations
- Cross-tabulation
- Customer segmentation
- Comparative analysis
- Analysis of financial and campaign variables

## SQL & Database Analysis

- Querying relational data with SQLite
- Aggregation and grouping
- Conditional aggregation
- Creating calculated performance metrics
- Common Table Expressions
- Window functions
- Customer ranking
- Multi-variable segmentation
- Translating business questions into SQL queries

## Data Visualization

- Matplotlib
- Distribution visualizations
- Segment comparisons
- Subscription-rate visualizations
- Business-focused chart interpretation

## Analytical Thinking

- Translating business problems into analytical questions
- Comparing customer segments
- Evaluating mean and median for financial variables
- Identifying target class imbalance
- Examining multiple variables together
- Interpreting calculated performance metrics
- Distinguishing descriptive relationships from causal conclusions
- Translating analytical results into business context

## Version Control & Documentation

- Git
- GitHub
- Incremental project development
- Organized repository structure
- SQL script documentation
- Documentation of analytical findings and progress

---

# Project Structure

```text
bank-marketing-analytics/
├── README.md
├── requirements.txt
├── .gitignore
│
├── data/
│   ├── raw/
│   └── processed/
│
├── docs/
│   ├── BUSINESS_QUESTIONS.md
│   └── ROADMAP.md
│
├── notebooks/
│   ├── 01_data_exploration.ipynb
│   └── 02_comparative_analysis.ipynb
│
├── plots/
│   ├── age_distribution.png
│   ├── job_distribution.png
│   ├── marital_distribution.png
│   ├── education_distribution.png
│   ├── default_distribution.png
│   ├── housing_distribution.png
│   ├── personal_loan_distribution.png
│   ├── contact_method_distribution.png
│   ├── month_distribution.png
│   ├── age_subscription_rate.png
│   ├── job_subscription_rate.png
│   ├── housing_subscription_rate.png
│   └── balance_subscription_boxplot.png
│
├── sql/
│   └── 01_customer_campaign_analysis.sql
│
├── models/
└── powerbi/
```

*The repository will continue to expand as statistical analysis, predictive modeling, and dashboard development are completed.*

---

# Project Goals

By the completion of this project, the objective is to demonstrate the ability to:

1. Work with a real-world financial services dataset.
2. Prepare, validate, and analyze structured customer data.
3. Use Python and SQL to answer business questions.
4. Identify meaningful customer segments and campaign performance patterns.
5. Apply statistical analysis and predictive classification techniques.
6. Evaluate machine learning models using appropriate performance metrics.
7. Communicate findings through clear visualizations and an interactive dashboard.
8. Translate analytical results into actionable business recommendations.

The completed project is intended to demonstrate an end-to-end analytics workflow applicable to financial services, customer analytics, and data-driven business decision-making.