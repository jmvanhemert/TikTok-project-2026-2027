# This is the R script to download the data
library(tidyverse)
library(RSQLite)

data_url <- paste0("https://raw.githubusercontent.com/hannesdatta/course-dprep/refs/heads/main/material/project/video_view.csv")
data_folder <- "data/raw"
file_path <- paste0(data_folder, "/video_view.csv")

# Download SQLite file from the provided URL
url <- "https://filesender.surf.nl/download.php??token=29803da2-2322-4844-aebf-7e0b95129957&files_ids=38390042"
data_folder <- "data/raw"
file_path <- paste0(data_folder, "/tiktok_students.sqlite")
# or whatever you want to name it

# Create the folder if it doesn't exist
if (!dir.exists(data_folder)) {
  dir.create(data_folder, recursive = TRUE)
  cat("Created directory:", data_folder, "\n")}

  # Download the file if it doesn't exist
if (!file.exists(file_path)) {
  download.file(url = url, destfile = file_path)
  cat("File downloaded successfully to:", file_path, "\n")
} else {
  cat("File already exists at:", file_path, "\n")}

