# AGENTS.md

Instructions for agents working in **PowellOnPoint/msds-6372-project1-insurance**. This is the private DS 6372 Project 1 group repo (Aaron Powell, Thuan-Andy Bui). Turner, Fall 2026. Due **9 February**.

Do not treat this folder as the SMU MSDS school monorepo. That monorepo gitignores this path. Open `6372-Project1-Insurance.Rproj`.

## What this repo is

Insurance charges (`data/insurance.csv`). Two objectives:

1. **Interpret.** SLR first, then an MLR. Are customer variables associated with `charges`? Do those associations depend on **region**? Coefficient table, residual diagnostics, at least one interpreted CI.
2. **Predict.** Keep the Objective 1 MLR. Compare it to other **course** methods. Prompt floor is **three** models in one table: Obj 1 MLR, a more complex MLR, and one nonparametric (`caret` kNN / tree / RF). Extra glmnet or a second \(k\) is optional. 10-fold CV RMSE on the **dollar** scale. Recommend one model.

Do not skip the complex MLR or the nonparametric. Do not use methods outside 6372 (no XGBoost, no neural nets, no Python for the submitted notebook).

Human-facing status and split live in `README.md`. Update the status table when a step actually finishes.

## Layout and knit

```
data/insurance.csv
docs/MSDS 6372 Project 1 Description 2026.docx
EDA/Project1_Insurance_EDA.Rmd
EDA/Project1_Insurance_EDA.html
```

- Knit with **rmarkdown** (`output: html_document`), not Quarto. TOC, `df_print: kable`, `code_folding: hide`.
- Knit working directory is the **document** folder. From `EDA/` read `../data/insurance.csv`.
- Knit the `.Rmd` before committing so HTML matches.
- YAML author can list both students. Do not invent a third author.

Packages already in the EDA: `ggplot2`, `dplyr`, `tidyr`, `GGally`, `naniar`, `gridExtra`. Add `caret` / `glmnet` / `boot` when modeling starts. R 4.6.x.

## Data facts (do not re-litigate)

- Raw \(n=1338\), 7 columns, no missing.
- One **exact** duplicate: 19-year-old male, northwest, non-smoker, BMI 30.59, 0 children, charges \(1639.56\). Drop with `distinct()` in the notebook; **do not edit** `data/insurance.csv`. Analysis \(n=1337\).
- Smoker is the dominant main effect (~\$32k vs ~\$8.4k).
- BMI \(\times\) smoker: \(r \approx 0.81\) smokers, \(r \approx 0.08\) non-smokers. Put `bmi * smoker` in the Objective 1 MLR, not only Objective 2.
- Region \(\times\) smoker is mostly a level shift; SE smokers highest. That is the “depend on region?” question.
- Stop expanding EDA unless a residual plot forces a new transform. Next work is Obj 1 SLR, then MLR.

## How to change things

- Prefer editing existing `.Rmd` files over new notebooks until Obj 1/2 need their own files (`Obj1/`, `Obj2/`, or `analysis/`).
- Drop the duplicate in code, not by rewriting the CSV.
- Formal coefficient interpretations: units, direction, CI, and the ceteris-paribus clause. Interaction means the smoker gap is **not** one number.
- If `charges` residuals fail, try `log(charges)` for diagnostics; still report Obj 2 RMSE in **dollars**.
- Do not quote CV RMSE, \(R^2\), or “best model” until that number is produced in a knitted chunk.

## Git

- Remote: `https://github.com/PowellOnPoint/msds-6372-project1-insurance.git` (private).
- `git pull --ff-only` (or Pull in RStudio) before Push. This repo has already diverged from GitHub-web README edits.
- Branches: `obj1-slr-mlr`, `obj2-compare`, `slides` — or commit on `main` if the pair is sequential.
- Commit message: what changed and why, in complete sentences. Include knitted HTML with the Rmd.
- Do not commit `.RData`, `~$*`, `*_files/`, `.Rproj.user/`, AppleDouble `._*`.
- RStudio Git executable: `/opt/homebrew/bin/git`.

## Do not

- Complete live-session or graded writeups wholesale unless the user explicitly asks for that file.
- Mix this work into the SMU MSDS monorepo commit.
- Force-push `main`.
- Invent partner names, Kaggle scores, or unearned model performance.
