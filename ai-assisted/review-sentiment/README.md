# Review Sentiment: Rebuilding the Foundations

*An AI-assisted revision, worked through with Claude, of my [D213 Task 2 coursework](../../D213-advanced-data-analytics/) (sentiment analysis with a neural network).*

> **Status:** in progress. Sections 1 (loading the data) and 2 (a word-count baseline) are complete. The neural network sections are still to come.

**Question:** can the sentiment of a short customer review, positive or negative, be predicted from its text?

**Data:** *Sentiment Labelled Sentences* from the [UCI Machine Learning Repository](https://archive.ics.uci.edu/dataset/331/sentiment+labelled+sentences) (Kotzias et al., 2015): 1,000 reviews each from Amazon, IMDb and Yelp.

## How this one was made

This revision is a learning walkthrough. Claude explained each concept, wrote the code and ran the experiments. I asked questions until each step made sense, made the decisions, and wrote what I had understood. In the notebook, those passages are marked **In my words**.

## Findings so far

- **The original lost 252 reviews when loading the data.** Unmatched quotation marks in the IMDb file made the loader merge many lines into one. All 3,000 reviews now load, and 17 exact duplicates are dropped.
- **The original cleaning removed negations.** The standard stopword list includes "not" and "no". Keeping them raises a simple model's accuracy by about 3 points, and "not" turns out to be the most informative word in the data.
- **A word-count baseline reaches 83.4% on the validation set.** That is the standard the neural networks have to beat. The original network scored 77.5%.

## Decision log

| Decision | What I chose | Why |
|---|---|---|
| How to approach this revision | A step-by-step learning walkthrough | This was the coursework I got least from, and I wanted to build the foundation properly. |
| Text cleaning | My original steps, with negations protected, and each step measured | Claude recommended lowercasing only. I chose to keep my steps and test them. The test showed my version, with negations kept, was the most accurate of the six. |
| Duplicate reviews | Dropped before splitting the data | So the same review can't appear in both training and test data. |

## Files

| File | Description |
|---|---|
| [`review_sentiment.ipynb`](review_sentiment.ipynb) | The walkthrough notebook (in progress) |

**Tools:** pandas, scikit-learn, NLTK, matplotlib
