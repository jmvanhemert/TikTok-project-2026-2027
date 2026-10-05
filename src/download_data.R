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

## Download WATCH EVENTS dataset as a csv because the SQLite database does not have the watch_events dataset
watchev_url <- paste0("https://raw.githubusercontent.com/hannesdatta/course-dprep/refs/heads/main/material/project/coaching_2_data/watch_events.csv")
watchev_path <- paste0(data_folder, "/tiktok_watch_events.csv")

if (!file.exists(watchev_path)) {
  download.file(url = watchev_url, destfile = watchev_path)
  cat("File downloaded successfully to:", watchev_path, "\n")
} else {
  cat("File already exists at:", watchev_path, "\n")}

## Download IMPRESSIONS dataset as a csv because the SQLite database does not have the impressions dataset
impressions_url <- "https://raw.githubusercontent.com/hannesdatta/course-dprep/refs/heads/main/material/project/coaching_2_data/impressions.csv"
impressions_path <- paste0(data_folder, "/impressions.csv")

if (!file.exists(impressions_path)) {
  download.file(url = impressions_url, destfile = impressions_path)
  cat("File downloaded successfully to:", impressions_path, "\n")
} else {
  cat("File already exists at:", impressions_path, "\n")}


con <- dbConnect(SQLite(), dbname = file_path)
print(dbListTables(con))




