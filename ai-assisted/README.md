# AI-assisted revisions

The projects in this folder revisit my MSDA coursework with **Claude** (Anthropic) as an AI pair analyst. The originals stay unchanged in the course folders at the top of this repository, so the two can be compared directly.

## How the work was split

- **Me:** the original question, data sourcing and first analysis (the coursework). For each revision, I go through Claude's critique of my original point by point, decide what to accept, reject or add, and review the revised results before they're final.
- **Claude:** critiques the original, proposes the evaluation design and methods, writes and runs the code, drafts the notebook text and charts, and checks every number in the text against the executed outputs.

Each project's notebook opens with a link to the original it revises and ends with a table of what changed and why. The **Status** column below says whether I've completed my review.

## Projects

| Project | Revises | Status | Summary |
|---|---|---|---|
| [Forecasting US Electricity Prices](electricity-price-forecast/) | [D214 capstone](../D214-capstone-electricity-price-forecast/) | Revised after my point-by-point review ([decision log](electricity-price-forecast/README.md#decision-log)); final read-through pending | Extends the original's single 30-month test to a 25-origin rolling backtest against simple baselines, and shows which method works best at each horizon. Includes an out-of-sample check on April–October 2026 and an extension testing natural gas prices as a driver. |
