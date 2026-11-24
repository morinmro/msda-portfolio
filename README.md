# Master of Science, Data Analytics: Portfolio

**Michael Morin** · M.S. Data Analytics, Western Governors University (2026)

This repository has two parts:

1. **[Coursework](#coursework-my-original-work)**: my original work from WGU's MSDA program, as submitted. It runs from SQL data acquisition and data cleaning through regression, machine learning, deep learning and a time-series capstone.
2. **[AI-assisted revisions](#ai-assisted-revisions)**: selected projects revisited with Claude (Anthropic) as an AI pair analyst. These show what the same questions look like when re-examined with stronger methods, and what I can produce working with an AI partner.

They're kept separate on purpose, so it's clear which work is mine alone and which was done with AI assistance.

## Coursework: my original work

The analysis, code and written conclusions in these folders are my own, as submitted for grading. Preparing them for this repository (with Claude's help) added the project READMEs and removed links to course-only videos. It also made a few minimal compatibility fixes so the notebooks run on current library versions; each fix keeps the original behavior. No analysis was redone. Every edit is listed in [`CHANGES_FROM_SUBMISSION.md`](CHANGES_FROM_SUBMISSION.md).

It should be emphasized that the analyses in this repository were completed as coursework for the Master of Science in Data Analytics program at Western Governors University; as such, they are intended to demonstrate conceptual understanding and technical implementation of specific analytical methods. Each project follows a structure prescribed by the program's assessment rubrics, and that structure may differ from how the same problem would be approached in a professional setting.

Because the coursework emphasized step-by-step application of individual techniques over comprehensive analysis of business problems, certain standard practices are not consistently present, such as establishing a baseline model against which more advanced methods are evaluated. In some instances, the rubrics also required steps to be performed out of sequence or repeated. These projects should therefore be viewed as demonstrations of methodological competency in an academic setting, rather than as representative examples of applied, real-world analysis.

### Featured

| Project | Techniques | Highlight |
|---|---|---|
| [**Capstone: US Electricity Price Forecast**](D214-capstone-electricity-price-forecast/) | SARIMA, auto_arima, time-series decomposition | SARIMA forecast of 30 held-out months of FRED price data. *The [AI-assisted revision](ai-assisted/electricity-price-forecast/) builds on it with a broader evaluation.* |
| [**Churn Prediction with Random Forest**](D209-data-mining-1/) | Random forest, GridSearchCV, KNN | **0.90 accuracy / 0.957 AUC**, compared against a KNN baseline |
| [**Review Sentiment Neural Network**](D213-advanced-data-analytics/) | TensorFlow/Keras, NLP, tokenization, embeddings | Binary sentiment classifier on Amazon, IMDb and Yelp reviews |
| [**Logistic Regression for Churn**](D208-predictive-modeling/) | statsmodels, VIF feature reduction | Received a WGU **Excellence Award** |

### All courses

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

## AI-assisted revisions

Projects in [`ai-assisted/`](ai-assisted/) were revised with Claude. Each one links back to the original it revises and lists what changed. See [`ai-assisted/README.md`](ai-assisted/README.md) for how the work was split between me and the AI.

| Project | Revises | What's new |
|---|---|---|
| [**Forecasting US Electricity Prices**](ai-assisted/electricity-price-forecast/) | [D214 capstone](D214-capstone-electricity-price-forecast/) | Builds on the original with a rolling-origin backtest of SARIMA, exponential smoothing and simple baselines across 25 forecast origins. It finds that a simple, fixed SARIMA is the most reliable method, checks the forecasts against seven months of newer data, and tests natural gas prices as a driver. |
| [**Predicting Customer Churn**](ai-assisted/churn-prediction/) | [D208 Task 2](D208-predictive-modeling/), [D209](D209-data-mining-1/) | Four models compared on equal terms, with baselines, cross-validated tuning and a decision section. Logistic regression comes out best (0.96 AUC) once tenure is included. |

**In progress:** I'm currently working on an AI-assisted rework of the [D213 Task 2](D213-advanced-data-analytics/) NLP project (review sentiment with a neural network). It will be added to this table when it's complete.

## Repository layout

```
├── D2xx-<course-name>/       # Original coursework, one folder per course
│   ├── README.md             # Research question, methods, results
│   ├── *.ipynb               # Analysis notebook(s), rendered with outputs
│   └── data/ | reports/      # Project-specific data and written deliverables
├── ai-assisted/              # Revisions made with Claude; each links to its original
├── data/                     # Shared public data; README explains the WGU datasets that aren't included
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
