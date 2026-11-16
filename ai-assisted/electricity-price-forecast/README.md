# Forecasting US Electricity Prices

*An AI-assisted revision, made with Claude, of my [D214 capstone](../../D214-capstone-electricity-price-forecast/). See [how the work was split](../README.md#how-the-work-was-split).*

> **Status:** draft produced by Claude. My point-by-point review is in progress.

**Question:** How accurately can the average US price of electricity be forecast 1–12 months ahead, using price history alone?

**Data:** FRED series [APU000072610](https://fred.stlouisfed.org/series/APU000072610) (BLS *Average Price: Electricity per Kilowatt-Hour in U.S. City Average*), monthly, March 2016 to March 2026. The one missing month (October 2025) is filled by linear interpolation.

**Approach:** A rolling-origin backtest. From each of 25 starting points (quarterly, March 2019 to March 2025), each model is refitted on the data so far and forecasts the next 12 months. The models are naive, seasonal naive, drift, damped ETS (Holt–Winters), SARIMA (`auto_arima`, re-selected at every origin) and an average of drift, ETS and SARIMA.

**Results**

| Model | MAPE, 1–12 months | 1 month | 12 months |
|---|---|---|---|
| Average (drift, ETS, SARIMA) | **2.6%** | **0.7%** | 4.1% |
| Drift | 2.7% | 1.0% | **3.9%** |
| ETS | 2.8% | 0.8% | 4.6% |
| SARIMA | 3.3% | 0.8% | 5.5% |
| Naive | 3.2% | 1.0% | 5.3% |
| Seasonal naive | 5.0% | 4.6% | 5.3% |

- SARIMA and ETS are the most accurate 1–3 months ahead. Beyond that, a straight-line drift forecast matches or beats them.
- Seasonality is weak (about 3.5% from trough to peak). Most of the error comes from the 2021–22 price surge, which no price-only model could anticipate.
- **12-month forecast:** about **19.6¢/kWh by March 2027**, up from 19.0¢ in March 2026 (80% interval: 19.1–21.8¢, based on the backtest's own errors).

**Revisiting the original capstone.** The [version submitted to WGU](../../D214-capstone-electricity-price-forecast/) reported 0.77% MAPE from a single 30-month test window. That result turned out not to be robust. Refitting the same model on the same data in cents instead of dollars gives 1.8%. Handling the missing month properly gives 2.4%, worse than drift. The notebook's last section lists every change and the reason for it.

| File | Description |
|---|---|
| [`electricity_price_forecast.ipynb`](electricity_price_forecast.ipynb) | Full analysis (about 4 minutes to run, mostly `auto_arima`) |
| [Original reports](../../D214-capstone-electricity-price-forecast/reports/) | Executive summary and slides from the original submission. They report the earlier single-window result. |
| `data/APU000072610.csv` | Source data from FRED |

**Tools:** pandas, statsmodels (SARIMAX, Holt–Winters), pmdarima, matplotlib
