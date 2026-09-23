# Insurance Charges — Multiple Linear Regression

**MSDS 6372 — Applied Statistics: Inference and Modeling**  
**Southern Methodist University** · Jacob Turner · Fall 2026

Private group repository for Project 1 using `data/insurance.csv`. Methods stay inside the course stack: MLR, transformations, interactions, residual diagnostics, and `caret` nonparametric models (kNN / tree / random forest).

## Table of Contents
- [Project Overview](#project-overview)
- [Project Status](#project-status)
- [Repository Structure](#repository-structure)
- [How to Reproduce](#how-to-reproduce)
- [Authors](#authors)

## Project Overview

An insurance provider wants to know whether customer information is associated with health-account **charges**, and whether those associations **depend on region**.

- **Objective 1 (interpretability).** Fit an MLR that can be explained: coefficients, confidence intervals, residual diagnostics. At least one formal coefficient interpretation with a CI.
- **Objective 2 (prediction).** Keep the Objective 1 MLR. Add a more complex MLR and a nonparametric model. Compare with an appropriate CV error metric and recommend one model for predicting future charges.

Due **9 February**. Deliverables: 20-minute presentation, slides, R notebook, Canvas peer review (not in this repo).

## Project Status

| Step | Pipeline Stage | Status | Notes / Next Steps |
|------|----------------|--------|--------------------|
| 1 | **Data Understanding & Loading** | ✅ Complete | `insurance.csv` (\(n=1338\), 7 columns) loaded; codebook reviewed |
| 2 | **Data Cleaning & Preprocessing** | ✅ Complete | No missing values; factors recoded with explicit levels in the EDA notebook |
| 3 | **Exploratory Data Analysis (EDA)** | ✅ Complete | First commit: `EDA/Project1_Insurance_EDA.Rmd` (knitted HTML). See notes below |
| 4 | **Objective 1 — Interpretable MLR** | ⬜ Not started | `charges ~ age + bmi * smoker + children + region` (add `smoker * region` if the region question needs a coefficient) |
| 5 | **Model Diagnostics & Assumptions** | ⬜ Not started | Residuals on `charges` and `log(charges)`; influence |
| 6 | **Objective 2 — Complex MLR** | ⬜ Not started | Interactions / polynomials beyond the interpretability model |
| 7 | **Objective 2 — Nonparametric Model** | ⬜ Not started | `caret` kNN, regression tree, or random forest |
| 8 | **Model Comparison & Recommendation** | ⬜ Not started | 10-fold CV RMSE on the **dollar** scale |
| 9 | **Presentation, Slides & Documentation** | ⬜ Not started | 20-minute talk; peer review is a Canvas assignment |

### EDA already in the first commit

The insurance file is clean (\(n=1338\), no missing). Plots that have to survive into the talk:

- **Smoker** is the dominant main effect (mean charges about \$32,050 vs \$8,434)
- **BMI × smoker** — \(r=0.81\) for smokers, \(r=0.08\) for non-smokers (put this interaction in Objective 1, not only in the complex MLR)
- **Region × smoker** — the Objective 1 question; Southeast smokers are the highest on average; region is mostly a level shift
- Age has a positive slope in both smoker groups; `log(charges)` is nearly symmetric for later residual work

Next: Objective 1 MLR with `bmi * smoker` (and region), not more EDA.

## Repository Structure

```
6372-Project1-Insurance/
├── data/
│   └── insurance.csv
├── docs/
│   └── MSDS 6372 Project 1 Description 2026.docx
├── EDA/
│   ├── Project1_Insurance_EDA.Rmd    # start here
│   └── Project1_Insurance_EDA.html
├── README.md
└── 6372-Project1-Insurance.Rproj
```

Knit working directory is the **document** folder (`EDA/`). Data is read as `../data/insurance.csv`.

## How to Reproduce

1. Open `6372-Project1-Insurance.Rproj` in RStudio.
2. Knit `EDA/Project1_Insurance_EDA.Rmd` (packages: `ggplot2`, `dplyr`, `tidyr`, `GGally`, `naniar`, `gridExtra`).
3. Branch for a slice of work (`eda`, `obj1-mlr`, `obj2-caret`, `slides`).
4. Knit the `.Rmd` before you push so the HTML matches.
5. Do not commit `.RData`, Office lockfiles (`~$*`), or knitted `*_files/` folders.

To add the second GitHub user as a collaborator, send Aaron the GitHub username. The repo is **private**.

## Authors

- Aaron Powell
- *(collaborator — GitHub username TBD)*
