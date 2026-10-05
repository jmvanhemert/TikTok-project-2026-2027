# TikTok Group project Team 3

## Goal
This repository contains the group project for the Data Preparation course. 
The project uses TikTok data to practice downloading, preparing, summarizing, and analyzing data.
This project contains both the team project and the individual assignments.

## Contributors
- Justin Huijnen (SNR: 2116456)
- Judith van Hemert (SNR: 2191989)

## Requirements 
This project requires:
- R
- Quarto
- R packages tidyverse, SQLite, DBI, here
- Quarto
- TinyTeX (required to render the PDF report)
- Optional: make

## Run steps 
Packages can be installed in R using:
```r
install.packages("package_name")
```

Install TinyTeX once from the terminal: 
```bash
quarto install tinytex
```

The final analysis output can be rendered using:
```bash 
quarto render src/final_analysis.qmd --to pdf --output-dir ../output
```
Quarto executes the code in the document and combines the results, plots, and conclusions into one PDF.

To open the output: 
```bash
open output/final_analysis.pdf
```

## Expected output
- final_analysis.pdf

The final report contains:
- Basic data inspection
- Descriptive statistics
- Summary analysis
- Two regression models
- A plot of impressions and average watch shares
- Interpretation and conclusion

Additional regression output is saved in:
- `output/impressions_watchshare.png`
- `output/model1_summary.txt`
- `output/model2_summary.txt`

## Project structure
- data/raw - Contains the SQLite database with all raw data
- documentation - Contains AI.md (Information about AI usage in the project)
- src - Contains both the individual assignments, download_data.R to download the data in the project, and summary.qmd
- .gitignore - Specifies that the data/ folder and other outputs do not need to be uploaded to GitHub

## How to use the project
- First, download the data using the download_data.R file in the src folder
- Perform a first summary using the summary.qmd file in src folder
- Go into src/Week3Judith or src/week_3_individual_justin to see the individual work of Judith and Justin, along with their README's
- Run "make" in the terminal so that all steps are automated


