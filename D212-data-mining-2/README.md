# D212: Data Mining II (Unsupervised Learning)

### Task 1: K-Means Clustering
Customers were segmented on bandwidth usage and monthly charge, with the number of clusters chosen by elbow and silhouette methods. The analysis found four segments, including about 2,700 customers with high bandwidth but low charges. I recommended a pricing model that tracks usage more closely.

### Task 2: Principal Component Analysis
Five continuous variables were reduced to **2 principal components** (Kaiser rule) that explain **~60% of total variance**.

### Task 3: Market Basket Analysis
Apriori association rules (support, confidence, lift) on online-store transactions, used to recommend product bundles.

| File | Description |
|---|---|
| [`D212_task1_kmeans_clustering.ipynb`](D212_task1_kmeans_clustering.ipynb) | K-means clustering |
| [`D212_task2_pca.ipynb`](D212_task2_pca.ipynb) | PCA |
| [`D212_task3_market_basket.ipynb`](D212_task3_market_basket.ipynb) | Market basket analysis |

**Data:** `../data/churn_clean.csv` (Tasks 1–2) and `data/teleco_market_basket.csv` (Task 3), both WGU datasets, not included; see [data/README](../data/README.md) · **Tools:** scikit-learn, mlxtend, pandas
