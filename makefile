# This is the makefile for automation: simply just run make in the terminal
all: data src/summary.html src/week_3_individual_justin/plots/Average_watch_time.png src/Week3Judith/output src/final_analysis.pdf

data: src/download_data.R
	Rscript src/download_data.R

src/summary.html: data/raw/tiktok_students.sqlite src/summary.qmd
	quarto render src/summary.qmd

src/week_3_individual_justin/plots/Average_watch_time.png: data/raw/tiktok_watch_events.csv src/week_3_individual_justin/analysis.R
	Rscript src/week_3_individual_justin/analysis.R

src/Week3Judith/output: data/raw/impressions.csv src/Week3Judith/analysis.R
	Rscript src/Week3Judith/analysis.R

src/final_analysis.pdf: data/raw/tiktok_students.sqlite src/final_analysis.qmd
	quarto render src/final_analysis.qmd

clean:
	-rmdir /S /Q "data"
	-rmdir /S /Q "src/summary_files"
	-rmdir /S /Q "src/Week3Judith/output"
	-rmdir /S /Q "src/week_3_individual_justin/plots"
	-rmdir /S /Q "src/output"
	-del /Q "Rplots.pdf"
	-del /Q "src/final_analysis.pdf"
	-rmdir /S /Q "output"

