# D208: Predictive Modeling

### Task 1: Multiple Linear Regression
**Question:** Which factors are correlated with customer bandwidth usage?

I built an initial OLS model, then reduced it using VIF and p-values. In the reduced model, contract type, DSL service, add-on services (online backup, streaming TV/movies, etc.) and tenure all have significant positive relationships with `Bandwidth_GB_Year`.

### Task 2: Logistic Regression ★ *WGU Excellence Award*
**Question:** Which factors contribute to customer churn?

I built and reduced a logistic regression model (VIF-based feature selection) and evaluated it with a confusion matrix. The model reached a pseudo R² of 0.24. Its limitations are discussed candidly, and the write-up recommends more flexible classifiers (explored in [D209](../D209-data-mining-1/)).

| File | Description |
|---|---|
| [`D208_task1_linear_regression.ipynb`](D208_task1_linear_regression.ipynb) | Linear regression analysis |
| [`D208_task2_logistic_regression.ipynb`](D208_task2_logistic_regression.ipynb) | Logistic regression analysis |
| [`D208_task2_excellence_award.pdf`](D208_task2_excellence_award.pdf) | Excellence Award for Task 2 |

**Data:** `../data/churn_clean.csv` *(WGU dataset, not included; see [data/README](../data/README.md))* · **Tools:** statsmodels, pandas, seaborn
