
Bank Marketing Analytics & Response Prediction
An end to end financial services analytics project combining Python, SQL, statistical testing, machine learning, and an interactive Tableau dashboard to investigate term deposit subscription behavior.

Project Overview
Business question: How can a bank better understand historical direct marketing performance and identify customer characteristics associated with term deposit subscriptions?

The project uses the UCI Bank Marketing dataset to explore customer and campaign characteristics, quantify differences in subscription outcomes, and evaluate whether information available before a marketing call can help predict subscription response.

Dataset: 45,211 records, 17 original variables, and 5,289 successful subscriptions (11.70%). The dataset represents historical marketing campaigns by a Portuguese banking institution. These records describe campaign contacts and should not automatically be interpreted as 45,211 unique people.

Data source: UCI Bank Marketing Dataset by Sérgio Moro, Paulo Rita, and Paulo Cortez. DOI: 10.24432/C5K306.

## Business Solution

This project goes beyond descriptive analysis by proposing a practical framework for improving bank marketing efficiency.

Historical customer segmentation and predictive modeling are used to investigate how a bank could prioritize outreach, evaluate campaign costs, and measure incremental subscription outcomes.

The proposed solution includes customer prioritization, financial impact evaluation, a controlled pilot, and performance monitoring. It is a business recommendation, not a deployed system or a claim of realized financial improvement.

**[Read the Business Solution](docs/BUSINESS_SOLUTION.md)**

Interactive Tableau Dashboard


The dashboard summarizes overall subscription performance and compares historical response rates by occupation, number of campaign contacts, and housing loan status. Selecting a housing loan category filters the other views and key performance indicators.

Open the packaged Tableau workbook in Tableau Desktop to explore the interactive dashboard. The image above is a static preview.

Key Findings
Measure or segment	Historical subscription rate
Overall	11.70%
Students	28.68%
Retired customers	22.79%
Blue collar occupations	7.27%
No housing loan	16.70%
Housing loan	7.70%
No personal loan	12.66%
Personal loan	6.68%
One campaign contact	14.60%
Four or more campaign contacts	7.35%
Other descriptive results include higher historical subscription rates for cellular contacts (14.92%) than contacts with an unknown method (4.07%), and for customers in high balance segments (15.50%) than customers with zero or negative balances (6.90%).

These findings identify associations, not causal effects. For example, customers may receive additional contacts because they have not subscribed, so the lower response rate among customers with more contacts does not prove that extra calls reduce conversions.

Statistical Analysis
The statistical analysis investigates relationships between subscription outcomes and financial characteristics using hypothesis tests, confidence intervals, and distribution comparisons. For example, median account balance was €733 among subscribers versus €417 among non subscribers. Statistical significance should be interpreted alongside practical relevance and the limitations of observational data.

See Statistical Analysis for methodology and test results.

Predictive Modeling
Three classification approaches were compared using a consistent training and testing workflow:

Logistic regression
Logistic regression with class balancing
Random forest
The model uses eight customer attributes available before contact: age, balance, job, marital, education, default, housing, and loan. Call duration is excluded because it would not be known before a call and could cause target leakage in a precontact prediction scenario.

The random forest was the strongest model in the project's comparison on the reported evaluation metrics:

Metric	Random forest result
F1 score	0.330
ROC AUC	0.688
Average precision	0.316
These results indicate some predictive signal but do not establish that the model is ready for deployment. Threshold selection, calibration, operational costs, fairness assessment, and evaluation on more recent campaign data would be needed before business use.

See Predictive Modeling for the complete model comparison, evaluation, and permutation feature importance analysis.

Methods and Tools
Python: pandas, NumPy, Matplotlib, SciPy, statsmodels, scikit learn, Jupyter notebooks.

SQL: SQLite queries for customer segmentation, aggregation, campaign performance, and business questions.

Visualization: Tableau Desktop interactive dashboard and Matplotlib exploratory charts.

Workflow: Visual Studio Code, Git, and GitHub.

Project Workflow
Phase	Status	Output
Data preparation and validation	Complete	Dataset checks and exploration
Exploratory data analysis	Complete	Distributions and visualizations
Comparative customer analysis	Complete	Segment level subscription comparisons
SQL business analysis	Complete	Customer and campaign analysis queries
Statistical analysis	Complete	Tests and confidence intervals
Predictive modeling	Complete	Three model comparison and feature importance
Tableau dashboard	Complete	Packaged workbook and dashboard preview
Documentation	Complete	README, business questions, roadmap
Repository Guide
Location	Contents
`notebooks/01_data_exploration.ipynb`
Data inspection and exploratory analysis
`notebooks/02_comparative_analysis.ipynb`
Segment comparisons and campaign patterns
`notebooks/03_statistical_analysis.ipynb`
Statistical tests and interpretation
`notebooks/04_predictive_modeling.ipynb`
Model training and evaluation
`sql/01_customer_campaign_analysis.sql`
SQL business analysis
`tableau/bank-marketing-analysis.twbx`
Interactive Tableau workbook
`tableau/bank_marketing_dashboard.png`
Dashboard preview
`docs/BUSINESS_QUESTIONS.md`
Business questions and findings
`docs/ROADMAP.md`
Completed work and future extensions
plots/	Exploratory visualizations
requirements.txt	Python dependencies
Reproducing the Analysis
Clone the repository and install its Python dependencies:

git clone https://github.com/acal05/bank-marketing-analytics.git
cd bank-marketing-analytics
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
Download bank-full.csv from the UCI dataset page and place it in the data location expected by the notebooks. Run the notebooks in numeric order, updating local file paths if necessary. The Tableau workbook can be opened separately in Tableau Desktop.

Interpretation and Limitations
The dataset is historical and observational, so segment differences do not establish causality. Some categories include unknown values. The positive outcome is relatively uncommon (11.70%), making accuracy alone insufficient for model evaluation. The predictive model deliberately uses a narrower precontact feature set than the descriptive dashboard. Real world use would require current data, additional validation, monitoring, and responsible treatment of customer information.

Business Implications
Historical results suggest that housing loan status, account balance, and occupation are worth examining for campaign segmentation. Contact frequency patterns merit investigation when assessing campaign efficiency. Predictive scores could eventually help prioritize outreach, but any deployment decision should be based on validated business impact rather than these historical comparisons alone.

