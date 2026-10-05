# Load package
library(tidyverse)

# Load data
impressions <- read.csv("data/raw/impressions.csv")


# Check dataset
str(impressions)

colSums(is.na(impressions))

sum(duplicated(impressions))

# Checking duplicates

dups <- impressions[duplicated(impressions) | duplicated(impressions, fromLast = TRUE), ]

View(dups)

# Remove duplicates

impressions_clean <- impressions[!duplicated(impressions), ]

sum(duplicated(impressions_clean))

## Visualizing 
output_folder <- "src/Week3Judith/output"

if (!dir.exists(output_folder)) {
  dir.create(output_folder)
}

plot_sources <- ggplot(impressions_clean, aes(x = source_bucket)) +
  geom_bar(fill = "hotpink") +
  labs(
    title = "Mix of Feed Sources",
    x = "Feed source",
    y = "Number of impressions"
  ) +
  theme_minimal()

plot_sources

ggsave(
  filename = paste0(output_folder, "/mix_of_feed_sources.png"),
  plot = plot_sources,
  width = 8,
  height = 5
)

plot_scores <- ggplot(impressions_clean, aes(x = score_total)) +
  geom_histogram(
    bins = 30,
    fill = "hotpink"
  ) +
  labs(
    title = "Distribution of Ranking Scores",
    x = "Total ranking score",
    y = "Frequency"
  ) +
  theme_minimal()

plot_scores

ggsave(
  filename = paste0(output_folder, "/ranking_scores_distribution.png"),
  plot = plot_scores,
  width = 8,
  height = 5
)

plot_score_source <- ggplot(
  impressions_clean,
  aes(x = source_bucket, y = score_total)
) +
  geom_boxplot(fill = "hotpink") +
  labs(
    title = "Ranking Scores by Feed Source",
    x = "Feed source",
    y = "Total ranking score"
  ) +
  theme_minimal()

plot_score_source

ggsave(
  filename = paste0(output_folder, "/ranking_scores_by_source.png"),
  plot = plot_score_source,
  width = 8,
  height = 5
)

for (column in names(impressions_clean)) {
  print(paste(column, sum(is.na(impressions_clean[[column]]))))
}

grep("^score_", names(impressions_clean), value = TRUE)
