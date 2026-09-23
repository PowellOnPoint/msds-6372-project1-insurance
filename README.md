# MSDS 6372 Project 1 — Insurance charges

Private group repo for **DS 6372 Applied Statistics: Inference and Modeling** (Turner, Fall 2026). Dataset: `data/insurance.csv`.

## Objectives

**Objective 1 (interpretability).** An insurance provider wants to know whether customer information is associated with health-account charges, and whether those associations depend on region. Fit an MLR that can be interpreted: coefficients, confidence intervals, residual diagnostics. At least one formal coefficient interpretation with a CI.

**Objective 2 (prediction).** Keep the Objective 1 MLR. Add a more complex MLR and a nonparametric model (`caret` kNN, regression tree, or random forest). Compare with an appropriate CV error metric and recommend one model for predicting future charges.

Due **9 February**. Deliverables: 20-minute presentation, slides, R notebook, Canvas peer review (not in this repo).

## Repo layout

```
data/insurance.csv
docs/MSDS 6372 Project 1 Description 2026.docx
EDA/Project1_Insurance_EDA.Rmd      # start here
EDA/Project1_Insurance_EDA.html
```

Knit working directory is the **document** folder (`EDA/`). Data is read as `../data/insurance.csv`.

## How we work

1. Open `6372-Project1-Insurance.Rproj` in RStudio.
2. Branch for a slice of work (`eda`, `obj1-mlr`, `obj2-caret`, `slides`).
3. Knit the `.Rmd` before you push so the HTML matches.
4. Do not commit `.RData`, Office lockfiles (`~$*`), or knitted `*_files/` folders.

To add the second GitHub user as a collaborator, send Aaron the GitHub username. The repo is **private**.

## EDA already in the first commit

The insurance file is clean (\(n=1338\), no missing). The plots that have to survive into the talk:

- smoker is the dominant main effect
- **BMI × smoker** (required interaction)
- **region × smoker** (the Objective 1 question)
- age slope, log(charges) for later modeling

Next: Objective 1 MLR with `bmi * smoker` (and region), not more EDA.
