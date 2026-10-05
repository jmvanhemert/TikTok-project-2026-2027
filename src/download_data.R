# This is the R script to download the data

## Download ALL required packages for this project
library(tidyverse)
library(RSQLite)
library(DBI)

## Download SQLite file from the provided URL
url <- "https://filesender.surf.nl/download.php??token=29803da2-2322-4844-aebf-7e0b95129957&files_ids=38390042"
data_folder <- "data/raw"
file_path <- paste0(data_folder, "/tiktok_students.sqlite")

# Create the data/raw folder if it doesn't exist
if (!dir.exists(data_folder)) {
  dir.create(data_folder, recursive = TRUE)
  cat("Created directory:", data_folder, "\n")}

  # Download the SQLite database if it doesn't exist
if (!file.exists(file_path)) {
  download.file(url = url, destfile = file_path, mode = "wb")
  cat("File downloaded successfully to:", file_path, "\n")
} else {
  cat("File already exists at:", file_path, "\n")}

## Download video dataset as a csv because the SQLite database has not all columns
csv_url <- paste0("https://raw.githubusercontent.com/hannesdatta/course-dprep/refs/heads/main/material/project/video_view.csv")
csv_path <- paste0(data_folder, "/video_view.csv")

  # Download the csv file if it doesn't exist
if (!file.exists(csv_path)) {
  download.file(url = csv_url, destfile = csv_path)
  cat("File downloaded successfully to:", csv_path, "\n")
} else {
  cat("File already exists at:", csv_path, "\n")}



con <- dbConnect(SQLite(), dbname = file_path)
print(dbListTables(con))

