# Bank Marketing Analytics & Response Prediction
## Project Roadmap

### Project Objective

Analyze historical bank marketing campaign data to understand customer subscription behavior, identify meaningful customer segments, evaluate predictive models, and communicate findings through an interactive Tableau dashboard.

The project demonstrates an end to end analytics workflow relevant to banking, financial services, customer analytics, and marketing performance.

---

## Phase 1: Data Preparation

**Status: Complete**

- Imported the UCI Bank Marketing dataset using Python and pandas.
- Inspected 45,211 records and 17 variables.
- Reviewed data types, missing values, and unknown categories.
- Validated the target variable and subscription outcomes.
- Prepared data for exploratory and comparative analysis.

**Deliverable:** `notebooks/01_data_exploration.ipynb`

## Phase 2: Exploratory Data Analysis

**Status: Complete**

- Examined customer age, occupation, education, marital status, and financial characteristics.
- Analyzed account balances, housing loans, and personal loans.
- Explored contact methods and marketing campaign activity.
- Created visualizations to understand distributions and identify patterns.
- Identified the imbalance between successful and unsuccessful subscriptions.

**Deliverable:** `notebooks/01_data_exploration.ipynb`

## Phase 3: Comparative Customer Analysis

**Status: Complete**

- Calculated overall and segment specific subscription rates.
- Compared subscription outcomes across occupations and financial characteristics.
- Examined housing loans, personal loans, and account balance segments.
- Compared marketing contact methods and campaign contact frequency.
- Interpreted differences in historical customer response rates.

**Deliverable:** `notebooks/02_comparative_analysis.ipynb`

## Phase 4: SQL Business Analysis

**Status: Complete**

- Used SQLite to analyze customer and campaign data.
- Validated customer counts and subscription outcomes.
- Applied aggregations, conditional calculations, and Common Table Expressions.
- Analyzed customer segments and marketing performance.
- Used SQL to translate business questions into measurable results.

**Deliverable:** `sql/01_customer_campaign_analysis.sql`

## Phase 5: Statistical Analysis

**Status: Complete**

- Investigated relationships between customer characteristics and subscription outcomes.
- Applied statistical tests to selected categorical and numerical variables.
- Calculated and interpreted confidence intervals.
- Compared account balance distributions.
- Distinguished statistical significance from practical business relevance.
- Documented limitations of observational data.

**Deliverable:** `notebooks/03_statistical_analysis.ipynb`

## Phase 6: Predictive Modeling

**Status: Complete**

- Defined term deposit subscription as a binary classification problem.
- Selected eight customer characteristics available before marketing contact.
- Excluded call duration and other information unsuitable for the intended prediction timing.
- Prepared categorical and numerical features for modeling.
- Split the data into training and testing sets.
- Trained three classification models:
  - Logistic Regression
  - Balanced Logistic Regression
  - Random Forest
- Evaluated model performance using classification metrics.
- Examined feature importance and model limitations.

**Selected Random Forest Results:**

| Metric | Result |
|---|---:|
| F1 Score | 0.330 |
| ROC AUC | 0.688 |
| Average Precision | 0.316 |

These results represent a predictive baseline rather than a production ready marketing model.

**Deliverable:** `notebooks/04_predictive_modeling.ipynb`

## Phase 7: Tableau Dashboard

**Status: Complete**

Developed an interactive Bank Marketing Performance Dashboard using Tableau.

The dashboard includes:

- Total Customers: 45,211
- Successful Subscriptions: 5,289
- Subscription Rate: 11.70%
- Subscription Rate by Job
- Subscription Rate by Campaign Contacts
- Subscription Rate by Housing Loans
- Interactive filtering to explore customer segments

The dashboard provides a visual summary of historical marketing performance and supports exploration of differences between customer groups.

**Deliverables:**

- `tableau/bank-marketing-analysis.twbx`
- `tableau/bank_marketing_dashboard.png`

## Phase 8: Documentation and Portfolio Presentation

**Status: Final review**

- Documented project objectives and business questions.
- Organized notebooks, SQL analysis, plots, and Tableau files.
- Summarized findings and modeling results.
- Updated the README and project roadmap.
- Prepared the repository for GitHub portfolio presentation.

**Deliverables:**

- `README.md`
- `docs/ROADMAP.md`
- `docs/BUSINESS_QUESTIONS.md`

---

## Project Completion Summary

| Phase | Status |
|---|---|
| Data Preparation | Complete |
| Exploratory Data Analysis | Complete |
| Comparative Customer Analysis | Complete |
| SQL Business Analysis | Complete |
| Statistical Analysis | Complete |
| Predictive Modeling | Complete |
| Model Evaluation | Complete |
| Tableau Dashboard | Complete |
| Documentation | Final review |

## Potential Future Improvements

The core portfolio project is complete. Potential extensions include:

1. Evaluating additional classification algorithms and tuning model hyperparameters.
2. Investigating probability calibration and decision thresholds.
3. Comparing model performance across customer segments.
4. Incorporating marketing contact costs and expected financial value into targeting decisions.
5. Evaluating performance on more recent campaign data.
6. Improving dashboard usability and adding further business metrics where appropriate.

These are optional extensions rather than unfinished requirements.

---

## Project Limitations

The dataset represents historical marketing campaign observations from a Portuguese banking institution.

Observed differences between customer groups do not establish causal relationships.

Predictive model results are based on historical data and should not be interpreted as guaranteed future performance.

The dashboard is intended for descriptive analysis. The predictive modeling notebook addresses a separate question: whether subscription outcomes can be estimated using information available before marketing contact.

## Final Project Goal

Demonstrate the ability to combine Python, SQL, statistical analysis, machine learning, and Tableau into a coherent analytics project that supports evidence based business decision making in financial services.