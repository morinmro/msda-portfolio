# D213: Advanced Data Analytics

### Task 1: Time-Series Revenue Forecast
**Question:** Can 180 days of revenue be forecast using time-series analysis?

I tested stationarity (ADF), differenced the series, decomposed seasonality and trend, and examined ACF/PACF. `auto_arima` selected **SARIMAX(1,1,0)**, which achieved **RMSE ≈ 2.15** on the held-out period.

### Task 2: Sentiment Analysis Neural Network
**Question:** Can a neural network classify customer reviews as positive or negative?

I combined Amazon, IMDb and Yelp labelled reviews, then cleaned, tokenized and padded the text. A Keras model with an embedding layer and early stopping reached **~77% test accuracy**. The write-up discusses next steps for production readiness.

| File | Description |
|---|---|
| [`D213_task1_time_series_forecast.ipynb`](D213_task1_time_series_forecast.ipynb) | ARIMA forecast |
| [`D213_task2_sentiment_analysis_nn.ipynb`](D213_task2_sentiment_analysis_nn.ipynb) | Sentiment neural network |
| `data/` | UCI Sentiment Labelled Sentences (Task 2). The Task 1 revenue series is a WGU dataset and isn't included; see [data/README](../data/README.md) |

**Tools:** statsmodels, pmdarima, TensorFlow/Keras, NLTK
