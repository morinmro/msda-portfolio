# D214 Capstone: Forecasting US Electricity Prices

**Question:** Can the average monthly price of electricity in the US be accurately forecast from historical pricing data?

**Hypothesis:** A forecast with MAPE < 10% can be built from historical data.

**Data:** FRED series [APU000072610](https://fred.stlouisfed.org/series/APU000072610), *Average Price: Electricity per Kilowatt-Hour in U.S. City Average*, monthly, March 2016 to March 2026.

**Approach:** Seasonal decomposition and model selection with `auto_arima`, then a SARIMA model trained on historical data and evaluated on the final 30 months.

**Result:** **MAPE ≈ 0.77%** on the 30-month test window, far below the 10% threshold, so the null hypothesis is rejected.

> The executive summary and slides report 0.75% from the original run. Re-running with the pinned package versions gives 0.77% because of small optimizer differences between library versions.

| File | Description |
|---|---|
| [`D214_capstone_analysis.ipynb`](D214_capstone_analysis.ipynb) | Full analysis |
| [`reports/D214_executive_summary.pdf`](reports/D214_executive_summary.pdf) | Executive summary |
| [`reports/D214_presentation.pdf`](reports/D214_presentation.pdf) | Presentation slides |
| `data/APU000072610.csv` | Source data from FRED |

**Tools:** pandas, statsmodels, pmdarima, scikit-learn, matplotlib
