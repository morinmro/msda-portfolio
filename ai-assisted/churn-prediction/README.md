# Predicting Customer Churn: Four Models on Equal Terms

*An AI-assisted revision, made with Claude, of three pieces of my coursework: [D208 Task 2 (logistic regression)](../../D208-predictive-modeling/), [D209 Task 1 (KNN)](../../D209-data-mining-1/) and [D209 Task 2 (random forest)](../../D209-data-mining-1/). See [how the work was split](../README.md#how-the-work-was-split).*

> **Status:** built after my point-by-point review of Claude's critique (see the [decision log](#decision-log)). My final read-through is pending.

**Question:** which customers of a telecom provider are likely to churn, and how well can that be predicted?

**Data:** WGU's fictional telecom churn dataset: 10,000 customers, 26.5% of whom churned. It isn't included in this repository (see [`data/README.md`](../../data/README.md)); the notebook is committed with its outputs.

**Approach:** The originals were separate course exercises, each on one method, with their own variables and scoring. Here every model gets the same customers, the same 36 predictors, the same 70/30 split and the same scoring. Settings are chosen by 5-fold cross-validation on the training data, and the test set is used once. Logistic regression, KNN and a random forest are the models the coursework set. Gradient boosting was added for this revision as a modern comparison.

**Results on the test set**

| Model | Accuracy | AUC | Recall at 50% cutoff |
|---|---|---|---|
| Logistic regression | **90.5%** | **0.962** | **82%** |
| Gradient boosting *(added)* | 90.1% | 0.957 | 80% |
| Random forest | 89.4% | 0.954 | 78% |
| KNN | 78.7% | 0.935 | 20% |
| Baseline: tenure only | 75.1% | 0.813 | 43% |
| Baseline: predict "no churn" for everyone | 73.5% | 0.500 | 0% |

- **On equal terms, logistic regression was the best of the four,** with gradient boosting and the random forest close behind. The gaps are small (0.005 and 0.008 of AUC), but bootstrap intervals for them exclude zero.
- **Tenure was the missing piece in the original logistic regression.** It had been dropped after a collinearity check. With it, the cross-validated AUC rises from 0.825 to 0.959.
- **Getting the inputs right mattered more than the choice of algorithm.** One variable moved the AUC by 0.13. Switching between the three best algorithms moved it by less than 0.01.
- **Churn is concentrated among newer customers on month-to-month contracts.** Each extra month of tenure lowers the churn probability by about 0.8 points on average, and a one- or two-year contract by about 23 points.
- **The model is useful for targeting.** Contacting the 20% of customers it rates as highest risk reaches 69% of those who churn; contacting 30% reaches 87%.
- **The data is fictional.** The scores are likely higher than real data would give, and a simple model coming out best may reflect how the data was generated.

## Decision log

Claude reviewed my three original notebooks and raised eight points. I went through each one and decided how to handle it.

| # | Claude's point | My decision | My reasoning |
|---|---|---|---|
| 1 | The logistic regression left out its strongest predictors. | Accepted: include additional predictors as necessary | |
| 2 | The three models can't be compared: different variables, different scoring. | Not a flaw in the originals; compared here by choice | The same dataset was used in different WGU courses, each focused on one method. They were never meant to be compared. For this revision I preferred one notebook so the results are easy to compare. |
| 3 | KNN's k was chosen using the test set. | Accepted: choose every setting by cross-validation on the training data | I asked how k should be selected before agreeing. |
| 4 | 10% of customers were removed as outliers. | Re-assess, and remove only where necessary. Result: all 10,000 kept | The original removal was more aggressive than I'd have preferred, in order to demonstrate the data-cleaning code. |
| 5 | No baselines; accuracy as the main measure. | Accepted: add baselines | The rubric never called for them. The coursework was meant to show familiarity with implementing specific models, often at the expense of the realistic analysis expected in practice. This revision is meant to show that analysis done from a real-world perspective, with AI assistance. |
| 6 | The random forest's grid was too narrow, AdaBoost was unexplained, and MSE was reported on yes/no predictions. | Accepted the proposed fixes | I asked how each would be fixed before agreeing. |
| 7 | Odds ratios were read as changes in likelihood, and the collinearity check lacked a constant. | Accepted, after asking for a full explanation | |
| 8 | No decision step. | Accepted, using cost ratios | The data is fictional and nothing supports cost estimates, so no dollar figures are invented. |

Other decisions I made:

- **A fourth model.** I agreed to add gradient boosting, on condition that it's clearly marked as a modern comparison and that the original three are identified as set by the coursework.
- **Context on ordering.** In several places the rubric dictated that steps be done at particular times or in a particular order, and graders followed it closely. Where the originals do something in an unusual order, that is usually why.

**A correction during the revision.** Claude's critique said the original logistic regression should also have included monthly charge. Building the notebook showed that monthly charge adds almost nothing once the service variables are in the model (it is 96% determined by them), and that tenure alone accounts for the improvement. The notebook says so, and leaves monthly charge out of the model used to read effects.

## Files

| File | Description |
|---|---|
| [`churn_prediction.ipynb`](churn_prediction.ipynb) | Full analysis (about 2 minutes to run). Needs the WGU churn file; see [`data/README.md`](../../data/README.md). |

**Tools:** pandas, scikit-learn (pipelines, cross-validated grid search, calibration, permutation importance), statsmodels, matplotlib
