# D207: Exploratory Data Analysis

**Question:** Is there a difference in weekly service-outage time between customers who churned and those who didn't?

**Approach:** Univariate and bivariate exploration, then a two-sample t-test on `Outage_sec_perweek` grouped by `Churn`.

**Result:** p = 0.9875, so we fail to reject the null hypothesis. Outage time does not appear to drive churn, and I recommended the ISP focus retention efforts elsewhere.

| File | Description |
|---|---|
| [`D207_exploratory_analysis.ipynb`](D207_exploratory_analysis.ipynb) | Analysis and write-up |

**Data:** `../data/churn_clean.csv` *(WGU dataset, not included; see [data/README](../data/README.md))* · **Tools:** pandas, SciPy, matplotlib
