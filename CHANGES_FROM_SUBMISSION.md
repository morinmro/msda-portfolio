# Changes from the submitted coursework

The course folders (`D205`–`D214`) hold my coursework as submitted to WGU. Preparing it for publication, with Claude's help, required the edits listed here. None of them redo the analysis. Revised analyses live separately in [`ai-assisted/`](ai-assisted/).

## Removed or replaced

- **Title blocks** (name, course, instructor, date) at the top of each notebook.
- **Course video links.** Each submission linked to a recorded walkthrough that only WGU staff could open. Those sections were removed from the notebooks; in the D205 and D210 reports the link is replaced by a note.
- **File formats.** Written reports and slides were converted from Word and PowerPoint to PDF.
- **Data paths** now point to this repository's folders.

## Not included

- **WGU-provided datasets** and their data dictionaries (see [`data/README.md`](data/README.md)).
- **The D210 Tableau workbook,** because it embeds the WGU churn data.
- **The D214 report PDF,** which was a PDF export of the notebook.

## Code changes so the notebooks run on current libraries

Each change restores the behavior the code had when it was written.

| Change | Why | Notebooks |
|---|---|---|
| `read_csv(..., keep_default_na=False, na_values=['NA'])` | Newer pandas reads the category `"None"` (no internet service) as a missing value | D206, D207, D208, D209, D212 |
| `df[col] = df[col].fillna(...)` in place of `df[col].fillna(..., inplace=True)`; same for `.replace` | The chained in-place form no longer modifies the data | D206, D208, D209 Task 1 |
| `pd.get_dummies(..., dtype=int)` | Dummy columns now default to True/False instead of 1/0 | D208, D209 |
| `.corr(numeric_only=True)` | Text columns are no longer skipped automatically | D209 Task 1 |
| Removed `typ='levels'` from `SARIMAX.predict()` | The argument is no longer accepted | D213 Task 1, D214 |

## Numbers that changed on re-running

All notebooks were re-run with the pinned versions in `requirements.txt`. Three results moved slightly because of library differences, and the text quoting them was updated to match the new output.

| Project | As submitted | Re-run |
|---|---|---|
| D209 Task 2: random forest AUC | 0.958 | 0.957 |
| D212 Task 1: k-means cluster sizes | 2676 / 1794 / 2707 / 1822 | 2675 / 1799 / 2702 / 1823 |
| D214: SARIMA forecast MAPE | 0.754% | 0.772% |

The D213 Task 2 neural network is the exception: it keeps its submitted outputs, because training isn't seeded and each run gives a slightly different accuracy.
