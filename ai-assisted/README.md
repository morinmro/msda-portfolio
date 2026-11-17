# AI-assisted revisions

The projects in this folder revisit my MSDA coursework with **Claude** (Anthropic) as an AI pair analyst. The originals stay unchanged in the course folders at the top of this repository, so the two can be compared directly.

## How the work was split

- **Me:** the original question, data sourcing and first analysis (the coursework). For each revision, I go through Claude's critique of my original point by point, decide what to accept, reject or add, and review the revised results before they're final.
- **Claude:** critiques the original, proposes the evaluation design and methods, writes and runs the code, drafts the notebook text and charts, and checks every number in the text against the executed outputs.

Each project's notebook opens with a link to the original it revises and ends with a table of what changed and why. The **Status** column below says whether I've completed my review.

## Projects

| Project | Revises | Status | Summary |
|---|---|---|---|
| [Forecasting US Electricity Prices](electricity-price-forecast/) | [D214 capstone](../D214-capstone-electricity-price-forecast/) | Revised after my point-by-point review ([decision log](electricity-price-forecast/README.md#decision-log)); final read-through pending | Extends the original's single 30-month test to a 25-origin rolling backtest against simple baselines, and finds that a simple, fixed SARIMA is the most reliable method. Includes an out-of-sample check on April–October 2026 and an extension testing natural gas prices as a driver. |
| [Predicting Customer Churn](churn-prediction/) | [D208 Task 2](../D208-predictive-modeling/), [D209 Tasks 1 and 2](../D209-data-mining-1/) | Built after my point-by-point review ([decision log](churn-prediction/README.md#decision-log)); final read-through pending | Puts logistic regression, KNN, a random forest and gradient boosting on equal terms: same customers, variables, split and scoring. Logistic regression comes out best once tenure is included, and a decision section shows whom to contact. |
