# Business Solution: Improving Bank Marketing Campaign Effectiveness

## Executive Summary

This project investigates how a bank can use customer analytics and predictive modeling to improve the effectiveness of direct marketing campaigns for term deposit subscriptions.

Analysis of 45,211 historical customer records identified substantial differences in subscription rates across customer characteristics and campaign activity.

The overall subscription rate was **11.70%**, with 5,289 successful subscriptions. Customers without housing loans, customers with higher account balances, and certain occupational groups demonstrated higher historical response rates.

A Random Forest classification model was also developed using eight customer characteristics available before marketing contact. The model achieved an ROC AUC of 0.688 and an Average Precision of 0.316.

**Proposed business solution:** Develop and evaluate a data informed customer prioritization process that combines historical segment analysis, predictive subscription probabilities, and campaign cost considerations.

The proposed solution is intended to improve marketing resource allocation and decision making. It has not been deployed or demonstrated to increase actual campaign conversions.

---

## 1. Business Problem

Direct marketing campaigns require banks to allocate limited resources across large customer populations.

Contacting customers involves operational costs, including employee time, communication expenses, and campaign administration.

When customers differ in their likelihood of subscribing, a uniform outreach strategy may not allocate these resources efficiently.

The central business question is:

**How can a bank identify promising customer segments and prioritize marketing outreach while maintaining responsible and measurable decision making?**

### Business Objectives

1. Improve the efficiency of customer outreach.
2. Identify customer characteristics associated with higher subscription rates.
3. Evaluate whether predictive modeling can support customer prioritization.
4. Reduce unnecessary marketing costs without assuming that historical associations are causal.
5. Provide stakeholders with accessible campaign performance metrics.

---

## 2. Key Findings and Business Implications

### Finding 1: Housing Loan Status Is Associated With Subscription Outcomes

| Housing Loan Status | Subscription Rate |
|---|---:|
| No Housing Loan | 16.70% |
| Has Housing Loan | 7.70% |

Customers without housing loans had an observed subscription rate approximately 9 percentage points higher than customers with housing loans.

**Business implication:** Housing loan status may be a useful variable when investigating customer segments and evaluating prediction models.

**Recommended action:** Include housing loan status in exploratory segmentation and model evaluation, while assessing whether the relationship remains informative when other customer characteristics are considered.

### Finding 2: Account Balance Is Associated With Subscription Outcomes

| Account Balance Segment | Subscription Rate |
|---|---:|
| High | 15.50% |
| Medium | 15.33% |
| Low | 10.90% |
| Negative or Zero | 6.90% |

Higher balance segments demonstrated higher historical subscription rates.

**Business implication:** Financial characteristics may provide useful information for understanding customer response patterns.

**Recommended action:** Evaluate balance alongside other characteristics when assessing predictive performance, rather than treating a balance threshold as an automatic targeting rule.

### Finding 3: Subscription Rates Vary Across Occupations

| Occupation | Subscription Rate |
|---|---:|
| Student | 28.68% |
| Retired | 22.79% |
| Management | 13.76% |
| Blue Collar | 7.27% |

Historical subscription rates differed substantially across occupational groups.

**Business implication:** A single marketing approach may not reflect differences across customer segments.

**Recommended action:** Investigate whether segment differences persist after accounting for other characteristics and whether any proposed segmentation approach meets applicable fairness, privacy, and compliance requirements.

### Finding 4: Campaign Contact Frequency Is Associated With Response Rates

| Number of Contacts | Subscription Rate |
|---|---:|
| 1 Contact | 14.60% |
| 2 Contacts | 11.20% |
| 3 Contacts | 11.19% |
| 4 or More Contacts | 7.35% |

Customers contacted once had higher observed subscription rates than customers contacted repeatedly.

**Business implication:** Additional contact attempts may have diminishing business value for some customers.

However, the data does not demonstrate that repeated contact causes lower subscription rates. Customers who have not subscribed may be more likely to receive additional contacts.

**Recommended action:** Evaluate the incremental conversion value and operational cost of additional contact attempts before changing campaign contact policies.

---

## 3. Proposed Business Solution

### Solution: Predictive Customer Prioritization

Develop a decision support workflow that estimates each eligible customer's likelihood of subscribing before marketing contact.

Instead of treating every customer as equally likely to respond, the bank could evaluate whether model generated probabilities provide useful information for planning outreach.

### Proposed Workflow

**Step 1: Collect Customer Information**

Use customer attributes that are available before marketing contact, subject to data governance and appropriate use requirements.

The project evaluated eight variables:

- Age
- Account Balance
- Occupation
- Marital Status
- Education
- Credit Default Status
- Housing Loan Status
- Personal Loan Status

**Step 2: Estimate Subscription Probability**

Apply a validated classification model to estimate the probability of a term deposit subscription.

The project evaluated Logistic Regression, Balanced Logistic Regression, and Random Forest.

The Random Forest achieved the strongest results in the completed comparison.

**Step 3: Evaluate Customer Prioritization**

Rank eligible customers by predicted subscription probability and compare the approach against an existing or randomly selected outreach strategy.

Ranking should be evaluated as an analytical experiment, not automatically adopted as an operational policy.

**Step 4: Incorporate Business Costs**

Consider the cost of contacting a customer and the expected financial contribution of a successful subscription.

A simplified decision framework is:

**Expected Value = (Estimated Conversion Probability × Contribution per Subscription) − Contact Cost**

This formula is illustrative. A production evaluation would require validated financial assumptions and potentially an estimate of incremental response caused by outreach.

**Step 5: Monitor Campaign Results**

Track subscription rates, contact costs, campaign performance, and model quality over time.

Use the Tableau dashboard to support descriptive reporting and segment exploration.

---

## 4. Predictive Model Evaluation

### Models Evaluated

| Model | Purpose |
|---|---|
| Logistic Regression | Establish an interpretable classification baseline |
| Balanced Logistic Regression | Examine the effect of accounting for class imbalance |
| Random Forest | Capture more complex relationships among customer characteristics |

### Selected Random Forest Results

| Metric | Result |
|---|---:|
| F1 Score | 0.330 |
| ROC AUC | 0.688 |
| Average Precision | 0.316 |

### Business Interpretation

The Random Forest demonstrated some ability to distinguish between subscribers and nonsubscribers using precontact customer characteristics.

However, its performance is not sufficient to conclude that it would improve campaign profitability or justify production deployment.

Before operational use, the bank would need to assess:

- Probability calibration.
- Performance at different customer selection thresholds.
- Precision and recall within proposed outreach groups.
- Model stability on more recent data.
- Performance differences across customer segments.
- Incremental campaign value compared with current practices.

**Recommendation:** Treat the existing model as a proof of concept and conduct additional validation before using it for customer targeting.

---

## 5. Business Impact Measurement

The project does not claim realized cost savings, increased conversions, or revenue growth.

Instead, it proposes a framework for measuring potential business impact.

### Key Performance Indicators

| KPI | Business Purpose |
|---|---|
| Subscription Rate | Measure the proportion of contacted customers who subscribe |
| Cost per Contact | Track outreach expenses |
| Cost per Subscription | Measure acquisition efficiency |
| Conversion Rate by Customer Segment | Understand differences in historical response |
| Precision Among Prioritized Customers | Evaluate the quality of model based customer ranking |
| Incremental Subscriptions | Estimate additional subscriptions attributable to a new strategy |
| Net Campaign Contribution | Compare financial contribution with campaign costs |

### Illustrative Financial Scenario

Assume the following hypothetical campaign conditions:

| Assumption | Value |
|---|---:|
| Customers Contacted | 10,000 |
| Baseline Subscription Rate | 11.70% |
| Hypothetical Improved Rate | 13.00% |
| Additional Subscriptions | 130 |
| Illustrative Contribution per Additional Subscription | €100 |
| Illustrative Gross Additional Contribution | €13,000 |

Under these assumptions, increasing the subscription rate from 11.70% to 13.00% across 10,000 contacts would result in 130 additional subscriptions.

At an assumed contribution of €100 per additional subscription, this would represent €13,000 in additional gross contribution before accounting for incremental costs.

**Important:** This is a hypothetical scenario for illustrating financial evaluation. The project did not establish that the proposed model can achieve a 13.00% conversion rate or generate this financial outcome.

Actual impact would need to be measured through a controlled campaign evaluation.

---

## 6. Implementation Roadmap

### Stage 1: Analytical Validation

Validate data quality, feature availability, model performance, and customer segment findings.

**Success criterion:** Reproducible model results and clearly documented limitations.

### Stage 2: Business Evaluation

Estimate contact costs, expected contribution per subscription, and operational constraints.

Compare potential prioritization strategies against the existing outreach process.

**Success criterion:** Evidence that a proposed strategy has plausible economic value under realistic assumptions.

### Stage 3: Controlled Pilot

Conduct a controlled pilot with appropriate customer eligibility, compliance review, and an established comparison group.

Evaluate actual subscription outcomes rather than relying only on predicted probabilities.

**Success criterion:** Measurable incremental improvement in campaign contribution or efficiency without unacceptable customer or compliance impacts.

### Stage 4: Performance Monitoring

If the pilot demonstrates sufficient value, establish ongoing monitoring of campaign outcomes, model performance, data drift, and fairness considerations.

**Success criterion:** Stable performance, documented governance, and evidence that the strategy continues to deliver value.

---

## 7. Risks and Limitations

### Historical Data Limitations

The analysis uses historical campaign data from a Portuguese banking institution. Results may not generalize to other institutions or future campaigns.

### Correlation Versus Causation

Differences in historical subscription rates do not establish that customer characteristics or contact practices cause subscription outcomes.

### Prediction Versus Incremental Impact

A model that predicts subscription likelihood does not necessarily identify customers whose behavior would change because of marketing outreach.

A future uplift modeling approach or randomized experiment could help estimate incremental marketing impact.

### Model Performance

The Random Forest provides an experimental baseline, not a production ready decision system.

### Responsible Customer Treatment

Any operational use of customer characteristics must be reviewed for privacy, fairness, applicable regulations, and internal governance requirements.

Customer prioritization should not automatically result in unfair exclusion from financial products or services.

---

## 8. Final Business Recommendation

The bank should consider a **measured, data informed approach to marketing optimization**, rather than immediately deploying the predictive model.

The recommended priorities are:

1. Use descriptive analytics to understand historical campaign performance and customer segments.
2. Validate whether precontact predictive models improve customer ranking compared with existing approaches.
3. Incorporate contact costs and expected financial contribution into business evaluation.
4. Test proposed outreach strategies through a controlled pilot.
5. Monitor actual incremental business outcomes and responsible model use before considering broader implementation.

## Conclusion

This project demonstrates how Python, SQL, statistical analysis, machine learning, and Tableau can support a practical banking business problem.

The analytical findings suggest opportunities for more informed customer segmentation and campaign evaluation.

The predictive modeling results provide an initial foundation for further testing, while the Tableau dashboard helps communicate historical performance to stakeholders.

**The primary business value of this project is not a claimed increase in revenue. It is a structured, evidence based framework for evaluating how a bank could improve marketing resource allocation, measure campaign effectiveness, and make more informed decisions.**