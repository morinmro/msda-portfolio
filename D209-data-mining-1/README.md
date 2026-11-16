# D209: Data Mining I (Classification)

### Task 1: K-Nearest Neighbors
**Question:** Which factors contribute to customer churn, and can they be used to predict it?

KNN classifier on scaled features with a train/test split. **Accuracy 0.82, AUC 0.875.** It was strong at identifying customers *unlikely* to churn and weaker on true churners.

### Task 2: Random Forest
**Question:** Can a random forest classifier accurately predict customer churn?

Random forest tuned with `GridSearchCV`. **Accuracy 0.90, AUC 0.957, F1 0.93 / 0.80** (non-churn / churn), a clear improvement over the KNN baseline. I recommended using it to flag at-risk customers for proactive retention outreach.

| File | Description |
|---|---|
| [`D209_task1_knn_classification.ipynb`](D209_task1_knn_classification.ipynb) | KNN model |
| [`D209_task2_random_forest.ipynb`](D209_task2_random_forest.ipynb) | Random forest model |

**Data:** `../data/churn_clean.csv` *(WGU dataset, not included; see [data/README](../data/README.md))* · **Tools:** scikit-learn, pandas, matplotlib
