# D206: Data Cleaning

**Question:** Which variables most strongly correlate with customer churn? (This framed the cleaning work.)

**Approach:** I profiled the 10,000-record raw churn dataset for duplicates, missing values, outliers and re-expression issues. I then imputed missing values (median, mean or mode depending on each column's distribution), handled outliers, recoded categorical variables, and ran PCA on the continuous variables.

| File | Description |
|---|---|
| [`D206_data_cleaning.ipynb`](D206_data_cleaning.ipynb) | Full cleaning workflow and write-up |

**Data:** `../data/churn_raw_data.csv` *(WGU dataset, not included; see [data/README](../data/README.md))* · **Tools:** pandas, NumPy, seaborn, scikit-learn (PCA)
