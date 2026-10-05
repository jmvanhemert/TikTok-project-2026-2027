# This is the makefile for automation: simply just run make in the terminal
all: download_data summary_week1 run_Justin_analysis download_impressions.csv output/analysis_done.txt Rplots.pdf_gone

download_data: src/download_data.R
	Rscript src/download_data.R

summary_week1: data/raw/tiktok_students.sqlite src/summary.qmd
	quarto render src/summary.qmd

## Run week 3 individual Justin:
download_week_3_data:
	Rscript src/week_3_individual_justin/download_week3_data.R

run_Justin_analysis:
	Rscript src/week_3_individual_justin/analysis.R

## Run week 3 individual Judith:

download_impressions.csv:
	Rscript src/Week3Judith/download_data.R

output/analysis_done.txt:
	Rscript src/Week3Judith/analysis.R

Rplots.pdf_gone:
	del /Q "Rplots.pdf"

clean:
	rmdir /S /Q "data"
	rmdir /S /Q "src/summary_files"
	rmdir /S /Q "src/Week3Judith/raw"
	rmdir /S /Q "src/Week3Judith/output"
	rmdir /S /Q "src/week_3_individual_justin/data"
	rmdir /S /Q "src/week_3_individual_justin/plots"

