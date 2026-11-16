# Forecasting US Electricity Prices

*An AI-assisted revision, made with Claude, of my [D214 capstone](../../D214-capstone-electricity-price-forecast/). See [how the work was split](../README.md#how-the-work-was-split).*

> **Status:** revised after my point-by-point review of Claude's critique (see the [decision log](#decision-log)). My final read-through is pending.

**Question:** How accurately can the average US price of electricity be forecast 1–12 months ahead, using price history alone?

**Data:** FRED series [APU000072610](https://fred.stlouisfed.org/series/APU000072610) (BLS *Average Price: Electricity per Kilowatt-Hour in U.S. City Average*), monthly, March 2016 to March 2026. October 2025 was never collected because of the federal government shutdown. It is interpolated so the models get an evenly spaced series, and it is left out of all scoring.

**Approach:** A rolling-origin backtest. From each of 25 starting points (quarterly, March 2019 to March 2025), each model is refitted on the data so far and forecasts the next 12 months. The models are naive, seasonal naive, drift, damped exponential smoothing (ETS), SARIMA (`auto_arima`, re-selected at every origin) and an average of drift, ETS and SARIMA.

**Results**

| Model | MAPE, 1–12 months | 1 month | 12 months |
|---|---|---|---|
| Average (drift, ETS, SARIMA) | **2.6%** | **0.7%** | 4.1% |
| Drift | 2.7% | 1.0% | **3.9%** |
| ETS | 2.8% | 0.8% | 4.6% |
| Naive | 3.2% | 1.0% | 5.3% |
| SARIMA | 3.3% | 0.8% | 5.5% |
| Seasonal naive | 5.0% | 4.6% | 5.3% |

- **For the first few months, a statistical model is worth using.** ETS was the most consistent: it beat drift from 18 of 25 starting points at 1–3 months. SARIMA improved on the baselines on average, but from only 12 of 25.
- **By the second half of the year, a simple trend extrapolation did as well or better.**
- **The original hypothesis (MAPE under 10%) holds for every model,** including the simplest baseline, which is why the comparison between models is the more informative result.
- Seasonality is weak (about 3.5% from trough to peak). Most of the error comes from the 2021–22 price surge, which no price-only model could anticipate.
- The differences between methods are modest and haven't been tested for statistical significance.
- **Out-of-sample check.** Seven months of new prices (April to October 2026) were published after the forecast was committed. The averaged forecast was off by 1.5% on average, in line with the backtest's 1.8% for those horizons, and ETS, the average and SARIMA again led. The 80% interval contained four of the seven prices, which suggests it is too narrow in the first months. My original capstone model, refitted through March 2026, scored 2.4%.
- **12-month forecast:** about **19.6¢/kWh by March 2027**, up from 19.0¢ in March 2026 (80% interval: 19.1–21.8¢, based on the backtest's own errors).

## Decision log

Claude reviewed my original capstone and raised seven points. I went through each one and decided how to handle it.

| # | Claude's point | My decision | My reasoning |
|---|---|---|---|
| 1 | One 30-month test window can't show how reliable the method is. The original 0.77% moved to 1.8% with prices in cents, and to 2.4% with the missing month filled. | Accepted: 25-origin rolling backtest, 1–12 month horizons | I asked for the reasoning first. Many windows give an average and a spread, and 12 months matches annual planning cycles. |
| 2 | There was no baseline to compare SARIMA against. | Accepted | The original evaluated SARIMA as a standalone exercise. In a more rigorous academic or business setting, comparison against a baseline is necessary. |
| 3 | The "MAPE under 10%" hypothesis is passed by every method. | Kept, with an explanation | The rubric required null and alternative hypotheses. It didn't add much in context, and in practice I'd prefer comparison against baseline models, so the revision reports both. |
| 4 | Dropping October 2025 left an unevenly spaced series. | Interpolate for model input; exclude from scoring | The month was never collected because of the government shutdown, so I asked whether interpolation was really the better fix. It is for the models, but a filled value isn't an observation, so it isn't scored. |
| 5 | The model was chosen once and its residuals weren't checked. | Accepted: re-select at each origin, add diagnostics | Closer to how a model would be maintained in production. |
| 6 | Confidence intervals were plotted but not evaluated. | Accepted: intervals from the backtest's actual errors | |
| 7 | The recommendation (SARIMA for up to 3 years) reached further than the testing. | Accepted: recommendations only within the tested 12 months | I asked for the reasoning first. A recommendation should reach only as far as the evidence behind it. |

I also set the tone of the revision: it treats the original's gaps as opportunities for improvement.

**A correction during the revision.** The first draft grouped SARIMA with ETS as the most accurate methods at 1–3 months, based on average error. The consistency check added in this round showed that only ETS beat the drift baseline from most starting points, and the conclusions were changed to match.

**My addition.** After the review, I asked for a section testing the forecasts against the months published since my graduation. That became the out-of-sample check.

## Extension: natural gas prices

My original capstone proposed adding an outside driver such as natural gas prices. [`natural_gas_extension.ipynb`](natural_gas_extension.ipynb) tests that on the same backtest.

- **A lagged Henry Hub gas price adds little.** With a seven-month lag, chosen from data before the test period, the 1–12 month error went from 2.48% to 2.44%, and the gas model was more accurate from only 13 of 25 starting points.
- **The result depends on how gas enters the model.** A six-month trailing average did better (2.11%) and a 12-month one did worse (2.67%). Those were tried afterwards, so the better figure is a lead to test on new data, not a finding.
- **A side finding matters more.** A fixed, standard SARIMA (2.48%) was more accurate than the automatically selected SARIMA in the main notebook (3.34%), and better than every other method there over 1–12 months. The main notebook notes this; its backtest hasn't been rerun with the fixed model.

## Files

| File | Description |
|---|---|
| [`electricity_price_forecast.ipynb`](electricity_price_forecast.ipynb) | Full analysis (about 4 minutes to run, mostly `auto_arima`) |
| [`natural_gas_extension.ipynb`](natural_gas_extension.ipynb) | Extension: does the Henry Hub gas price improve the forecast? (about 1 minute to run) |
| [Original reports](../../D214-capstone-electricity-price-forecast/reports/) | Executive summary and slides from the original submission |
| `data/APU000072610.csv` | Source data from FRED, March 2016 to March 2026 (the capstone's dataset) |
| `data/APU000072610_bls_2025-01_to_2026-10.csv` | The same series from the BLS public API, downloaded 16 November 2026. Used only for the out-of-sample check. |
| `data/henry_hub_monthly_eia.csv` | Monthly Henry Hub natural gas spot price from the EIA (series RNGWHHD), January 2014 to October 2026, downloaded 16 November 2026 |

**Tools:** pandas, statsmodels (SARIMAX, Holt–Winters, Ljung–Box), pmdarima, matplotlib
