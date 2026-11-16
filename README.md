# Master of Science, Data Analytics: Portfolio

**Michael Morin** · M.S. Data Analytics, Western Governors University (2026)

This repository collects my coursework from WGU's MSDA program, from SQL data acquisition and data cleaning through regression, machine learning, deep learning and a time-series capstone. Each folder is a self-contained project with its own README, notebook(s) and data.

## Featured projects

| Project | Techniques | Highlight |
|---|---|---|
| [**Capstone: US Electricity Price Forecast**](D214-capstone-electricity-price-forecast/) | SARIMA, auto_arima, time-series decomposition | Forecast 30 months of held-out FRED price data with **0.77% MAPE** |
| [**Churn Prediction with Random Forest**](D209-data-mining-1/) | Random forest, GridSearchCV, KNN | **0.90 accuracy / 0.957 AUC**, compared against a KNN baseline |
| [**Review Sentiment Neural Network**](D213-advanced-data-analytics/) | TensorFlow/Keras, NLP, tokenization, embeddings | Binary sentiment classifier on Amazon, IMDb and Yelp reviews |
| [**Logistic Regression for Churn**](D208-predictive-modeling/) | statsmodels, VIF feature reduction | Received a WGU **Excellence Award** |

## All projects

| Course | Project | Tools |
|---|---|---|
| [D205](D205-data-acquisition/) | Data Acquisition: average customer income by internet service | PostgreSQL |
| [D206](D206-data-cleaning/) | Data Cleaning: detecting and treating duplicates, missing values and outliers; PCA | pandas, scikit-learn |
| [D207](D207-exploratory-data-analysis/) | Exploratory Data Analysis: hypothesis testing (does outage time affect churn?) | SciPy, pandas |
| [D208](D208-predictive-modeling/) | Predictive Modeling: multiple linear and logistic regression | statsmodels, seaborn |
| [D209](D209-data-mining-1/) | Data Mining I: KNN classification and random forest | scikit-learn |
| [D210](D210-representation-and-reporting/) | Representation & Reporting: interactive churn/broadband dashboard | Tableau |
| [D211](D211-advanced-data-acquisition/) | Advanced Data Acquisition: external data into PostgreSQL, then a BI dashboard | PostgreSQL, Tableau |
| [D212](D212-data-mining-2/) | Data Mining II: k-means clustering, PCA, market basket analysis | scikit-learn, mlxtend |
| [D213](D213-advanced-data-analytics/) | Advanced Data Analytics: ARIMA revenue forecast, NLP sentiment neural net | statsmodels, pmdarima, TensorFlow |
| [D214](D214-capstone-electricity-price-forecast/) | Capstone: forecasting US electricity prices | statsmodels, pmdarima |

## Repository layout

```
├── data/                     # Shared public data; README explains the WGU datasets that aren't included
├── D2xx-<course-name>/
│   ├── README.md             # Research question, methods, results
│   ├── *.ipynb               # Analysis notebook(s), rendered with outputs
│   └── data/ | reports/      # Project-specific data and written deliverables
└── requirements.txt
```

## Running the notebooks

Tested with Python 3.12.

```bash
python -m venv .venv
.venv/Scripts/activate      # macOS/Linux: source .venv/bin/activate
pip install -r requirements.txt
jupyter lab
```

Open notebooks from inside their project folder; data paths are relative (`../data/` for shared data, `data/` for project data). Some notebooks write intermediate CSVs (prepared or train/test splits) next to themselves when run; `.gitignore` excludes those.

## Data sources

- **Telecom churn, time-series and market basket datasets**: fictional datasets provided by WGU for coursework. They aren't redistributed here (see [`data/README.md`](data/README.md)), but every notebook is committed with its outputs.
- **Broadband access**: Kaggle, "Broadband Access" dataset (MMattson, 2021)
- **Sentiment Labelled Sentences**: [UCI Machine Learning Repository](https://archive.ics.uci.edu/dataset/331/sentiment+labelled+sentences) (Kotzias et al., 2015)
- **Electricity prices**: [FRED series APU000072610](https://fred.stlouisfed.org/series/APU000072610), Federal Reserve Bank of St. Louis
