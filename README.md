# Insurance Charges — Multiple Linear Regression

**MSDS 6372 — Applied Statistics: Inference and Modeling**  
**Southern Methodist University** · Jacob Turner · Fall 2026

Private group repository for Project 1 using `data/insurance.csv`. Course stack only: SLR/MLR, transformations, interactions, residual diagnostics, glmnet, kNN, and `caret` trees/forests.

## Table of Contents
- [Project Overview](#project-overview)
- [Project Status](#project-status)
- [Repository Structure](#repository-structure)
- [How to Reproduce](#how-to-reproduce)
- [Authors](#authors)

## Project Overview

An insurance provider wants to know whether customer information is associated with health-account **charges**, and whether those associations **depend on region**.

- **Objective 1 — interpret.** SLR first (one predictor, one formal coefficient + CI), then an MLR that answers both prompt questions: are customer variables associated with charges, and do those associations depend on region? Include why variables were kept/dropped, a coefficient table, residual diagnostics, and at least one interpreted CI.
- **Objective 2 — predict.** Keep the Objective 1 MLR as the baseline. Compare it to other course methods (at minimum: one **more complex MLR** and one **nonparametric** model — kNN, tree, or RF via `caret`). Extra comparators (log-MLR, glmnet, a second kNN/\(k\)) are allowed. One CV error table on the **dollar** scale and a recommendation.

Due **9 February**. One person submits: slides, 20-minute recording, R notebook. Peer review is a separate Canvas assignment.

**Suggested split:** one person owns Objective 1 (SLR → MLR → diagnostics → CIs); the other owns Objective 2 (extra models → CV table → recommendation). Shared: EDA (done), slides, talk. Put names in the Owner column.

## Project Status

| Step | Stage | Status | Owner | Done when |
|------|-------|--------|-------|-----------|
| 1 | **Load & codebook** | ✅ Complete | both | `insurance.csv` (\(n=1338\), 7 columns) in `data/`; variable table in the EDA |
| 2 | **Clean** | ✅ Complete | both | No missingness; factors have explicit levels. Stop cleaning here |
| 3 | **EDA** | ✅ Complete | both | 4–6 response-vs-predictor plots; **two interaction plots**. First commit; notes below |
| 4 | **Obj 1 — SLR** | ⬜ Not started | | Fit `charges ~ smoker` (or `~ bmi`). Interpret slope/mean gap **and** a 95% CI |
| 5 | **Obj 1 — MLR** | ⬜ Not started | | Interpretable MLR that includes **region** (main effect and/or `smoker * region`) and `bmi * smoker`. Write include/exclude |
| 6 | **Obj 1 — diagnostics** | ⬜ Not started | | Residual plots, outliers/influence, constant variance. Try `log(charges)` only if the raw-scale MLR fails assumptions |
| 7 | **Obj 1 — answer the prompt** | ⬜ Not started | | Coefficient table + at least one formal CI that addresses *association* and *does it depend on region?* |
| 8 | **Obj 2 — complex MLR** | ⬜ Not started | | Prompt-required second MLR: extra interactions, polynomials, or log-\(y\). Not for interpretation |
| 9 | **Obj 2 — nonparametric** | ⬜ Not started | | Prompt-required `caret` kNN **or** tree **or** RF |
| 10 | **Obj 2 — extra course models** | ⬜ Optional | | glmnet, a second \(k\), bagged tree, etc. Same CV protocol as 8–9 |
| 11 | **Obj 2 — comparison table** | ⬜ Not started | | One table: Obj 1 MLR vs complex MLR vs nonparametric (+ extras). 10-fold CV RMSE in **dollars**. Recommend one model for future charges |
| 12 | **Final remarks** | ⬜ Not started | both | Scope of inference (four US regions, not a national sample); limits; if we had more time |
| 13 | **Slides + 20-min talk** | ⬜ Not started | both | Intro 10 / EDA 20 / Obj 1 20 / Obj 2 20 / close 10. Both present. Isolate output; do not let plots talk |
| 14 | **Knit notebook + appendix** | ⬜ Not started | both | HTML matches slides; extra tables in appendix or Rmd |
| 15 | **Peer review (Canvas)** | ⬜ Not started | each | Individual; not in this repo |

Prompt floor for Objective 2 is **three** models in the table (Obj 1 MLR, complex MLR, one nonparametric). Extra models are fine; skipping the complex MLR or the nonparametric is not.

### EDA already in the first commit

The file is clean (\(n=1338\), no missing). Plots that have to survive into the talk:

- **Smoker** is the dominant main effect (mean charges about \$32,050 vs \$8,434) — natural SLR for step 4
- **BMI × smoker** — \(r=0.81\) for smokers, \(r=0.08\) for non-smokers. Put this in the Objective 1 MLR, not only in Objective 2
- **Region × smoker** — the “depend on region?” question; Southeast smokers highest; region is mostly a level shift
- Age slopes in both smoker groups; `log(charges)` is nearly symmetric if diagnostics force a transform

Next: step 4 (SLR), then step 5 (MLR). Not more EDA.

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
