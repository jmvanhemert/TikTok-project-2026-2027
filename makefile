# This is the makefile for automation: simply just run make in the terminal
all: download_data summary_week1 Justin_analysis Judith_analysis Rplots.pdf_gone final_analysis

download_data: src/download_data.R
	Rscript src/download_data.R

summary_week1: data/raw/tiktok_students.sqlite src/summary.qmd
	quarto render src/summary.qmd

Justin_analysis: data/raw/tiktok_watch_events.csv src/week_3_individual_justin/analysis.R
	Rscript src/week_3_individual_justin/analysis.R

Judith_analysis: data/raw/impressions.csv src/Week3Judith/analysis.R
	Rscript src/Week3Judith/analysis.R

final_analysis: data/raw/tiktok_students.sqlite src/final_analysis.qmd
	quarto render src/final_analysis.qmd

Rplots.pdf_gone:
	del /Q "Rplots.pdf"

clean:
	rmdir /S /Q "data"
	rmdir /S /Q "src/summary_files"
	rmdir /S /Q "src/Week3Judith/output"
	rmdir /S /Q "src/week_3_individual_justin/data"
	rmdir /S /Q "src/week_3_individual_justin/plots"

