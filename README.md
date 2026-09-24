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

Due **Sunday, 27 September 2026**. One person submits: slides, 20-minute recording, R notebook. Peer review is a separate Canvas assignment.

**Suggested split:** one person owns Objective 1 (SLR → MLR → diagnostics → CIs); the other owns Objective 2 (extra models → CV table → recommendation). Shared: EDA (done), slides, talk.

## Project Status

| Step | Stage | Status | Done when |
|------|-------|--------|-----------|
| 1 | **Load & codebook** | ✅ Complete | `insurance.csv` (\(n=1338\), 7 columns) in `data/`; variable table in the EDA |
| 2 | **Clean** | ✅ Complete | No missingness. One exact duplicate dropped (`distinct()`); \(n=1337\). Factors recoded. Stop cleaning here |
| 3 | **EDA** | ✅ Complete | 4–6 response-vs-predictor plots; **two interaction plots**. First commit; notes below |
| 4 | **Obj 1 — simple model** | ✅ Complete | `charges ~ bmi * smoker` on the dollar scale. Smoker gap and a 95% CI at BMI 25, 30, and 35. Not a one-predictor `charges ~ smoker` |
| 5 | **Obj 1 — MLR** | ✅ Complete | `charges ~ age + children + bmi * smoker + region`. Include/exclude written. Sex and `smoker * region` not in the reported equation |
| 6 | **Obj 1 — diagnostics** | ✅ Complete | Residual plots, outliers/influence, constant variance. Raw vs square-root vs log compared; scale choice not closed |
| 7 | **Obj 1 — answer the prompt** | ✅ Complete | Coefficient table + at least one formal CI that addresses *association* and *does it depend on region?* |
| 8 | **Obj 2 — complex MLR** | ✅ Complete | Full linear model is every two-way interaction. Stepwise, both directions, by AIC. No squared BMI term |
| 9 | **Obj 2 — nonparametric** | ✅ Complete | Scaled `caret` kNN and a `caret` random forest. 10-fold CV beside an 80/20 split, in dollars |
| 10 | **Obj 2 — extra course models** | ✅ Complete | Lasso (`glmnet`), bagged trees, and bootstrap of the Objective 1 equation. Same folds as steps 8–9 |
| 11 | **Obj 2 — comparison table** | ✅ Complete | One table: AIC, BIC, adjusted \(R^2\), PRESS where defined, plus 10-fold and 80/20 RMSE in dollars. Random forest is the lowest-error predictor |
| 12 | **Final remarks** | ⬜ Not started | Scope of inference (four US regions, not a national sample); limits; if we had more time |
| 13 | **Slides + 20-min talk** | ⬜ Not started | Intro 10 / EDA 20 / Obj 1 20 / Obj 2 20 / close 10. Both present. Isolate output; do not let plots talk |
| 14 | **Knit notebook + appendix** | ⬜ Not started | HTML matches slides; extra tables in appendix or Rmd |
| 15 | **Peer review (Canvas)** | ⬜ Not started | Individual; not in this repo |

Prompt floor for Objective 2 is **three** models in the table (Obj 1 MLR, complex MLR, one nonparametric). Extra models are fine; skipping the complex MLR or the nonparametric is not.

### EDA

Raw file \(n=1338\), one exact duplicate dropped (19-year-old northwest male, non-smoker, charges \$1,639.56) → \(n=1337\). No missing. Plots:

- **Smoker** is the dominant main effect (mean charges about \$32,050 vs \$8,434) — natural SLR for step 4
- **BMI × smoker** — \(r=0.81\) for smokers, \(r=0.08\) for non-smokers. Objective 1 MLR, not only Objective 2
- **Region × smoker** — the “depend on region?” question; Southeast smokers highest; region is mostly a level shift
- Age slopes in both smoker groups; `log(charges)` is nearly symmetric if diagnostics force a transform

Next: finish step 6 (diagnostics) and step 7 (the prompt answer), then slides and the talk. The Objective 1 notebook is `Objective_1/Project1_Insurance_Objective1.Rmd`. The Objective 2 notebook is `Objective_2/Project1_Insurance_Objective2.Rmd`. Not more EDA.

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
├── Objective_1/
│   ├── Project1_Insurance_Objective1.Rmd
│   └── Project1_Insurance_Objective1.html
├── Objective_2/
│   ├── Project1_Insurance_Objective2.Rmd
│   └── Project1_Insurance_Objective2.html
├── README.md
└── 6372-Project1-Insurance.Rproj
```

Knit working directory is the **document** folder. From `EDA/`, `Objective_1/`, or `Objective_2/`, data is read as `../data/insurance.csv`.

## How to Reproduce

1. Open `6372-Project1-Insurance.Rproj` in RStudio.
2. Knit `EDA/Project1_Insurance_EDA.Rmd` (packages: `ggplot2`, `dplyr`, `tidyr`, `GGally`, `naniar`, `gridExtra`).
3. Knit `Objective_1/Project1_Insurance_Objective1.Rmd` and `Objective_2/Project1_Insurance_Objective2.Rmd`. Objective 2 also uses `caret`, `glmnet`, and `lmboot`.
4. Branch for a slice of work (`obj1-slr-mlr`, `obj2-compare`, `slides`).
5. Knit the `.Rmd` before you push so the HTML matches.
6. Do not commit `.RData`, Office lockfiles (`~$*`), or knitted `*_files/` folders.

To add the second GitHub user as a collaborator, send Aaron the GitHub username. The repo is **private**.

## Authors
- Aaron Powell – MSDS Candidate, Southern Methodist University  
- Thuan-Andy Bui – MSDS Candidate, Southern Methodist University  

## Acknowledgments
- Course instructors: Dr. Turner
- Dataset: Insurance Charges
- Special thanks to the SMU MSDS program for the rigorous statistical applications provided in MSDS 6372.
