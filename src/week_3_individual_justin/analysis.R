# This is the R script for the individual analysis from Justin

# Read the data
watch_events <- read.csv("data/raw/tiktok_watch_events.csv")

# Basic summary
summary(watch_events)
dim(watch_events)
str(watch_events)
names(watch_events)

# Delete missing values:
watch_events <- na.omit(watch_events)

plot_folder <- "src/week_3_individual_justin/plots"

if (!dir.exists(plot_folder)) {
  dir.create(plot_folder, recursive = TRUE)
  cat("Created directory:", plot_folder, "\n")}

# 1. Visualize Action type:
table(watch_events$action)
ggplot(data=watch_events,aes(x=action, fill=action)) + 
  geom_bar() + 
  theme_minimal() + 
  labs(title = "Distribution of user interactions", subtitle = "Count of each action type in watch data", x="Action type", y= "Count") +
  scale_fill_manual(name = "Action type", values = c("red", "steelblue", "darkgreen", "yellow"), labels = c("Exit app", "Skip halfway the video", "Skip immediately", "Watch full video")) + 
  theme(axis.text.x = element_blank())
ggsave("src/week_3_individual_justin/plots/Actionspread_tiktok.png", width=7,height=4)

# 2. Proportion of actions per creator

# Summary of action counts by creator (to get an overview)
action_by_creator <- watch_events %>% group_by(creator_id, action) %>% summarize(count = n(), .groups = 'drop')
action_by_creator

# Calculate proportion per creator
action_by_creator <- action_by_creator %>% group_by(creator_id) %>% mutate(proportion = count / sum(count))

# Create stacked bar plot
ggplot(action_by_creator, aes(x = creator_id, y = proportion, fill = action)) +
  geom_bar(stat = 'identity') +
  labs(title = "Proportion of actions per creator", subtitle = "What proportion of videos leads to each action type",
   x = "Creator ID", y = "Proportion of users", fill = "Action Type") +
  scale_fill_manual(name = "Action type", values = c("red", "steelblue", "darkgreen", "yellow"), labels = c("Exit app", "Skip halfway the video", "Skip immediately", "Watch full video")) +
  theme_minimal()
ggsave("src/week_3_individual_justin/plots/Actions_by_creators_tiktok.png", width=7,height=4)

# 3. Average watch time by creator
video_avg <- watch_events %>% group_by(video_id) %>% summarize(avg_watch_seconds = mean(watch_seconds, na.rm = TRUE))

ggplot(video_avg, aes(x = video_id, y = avg_watch_seconds)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(title = "Average Watch Time per video", x = "Video ID", y = "Average watch time (seconds)") +
  theme_minimal()
ggsave("src/week_3_individual_justin/plots/Average_watch_time.png", width=7,height=4)

# 4. Total watch time per user
user_watch_time <- watch_events %>% group_by(user_id) %>% summarize(total_watch_seconds = sum(watch_seconds, na.rm = TRUE)) %>% arrange(total_watch_seconds)
user_watch_time <- user_watch_time %>% mutate(total_watch_minutes = total_watch_seconds / 60)

ggplot(user_watch_time, aes(x = user_id, y = total_watch_minutes)) +
  geom_bar(stat = "identity", fill = "red") +
  labs(title = "Total Watch Time per user", x = "User ID", y = "Total Watch Time (minutes)") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
ggsave("src/week_3_individual_justin/plots/Total_tiktok_time.png", width=7,height=4)
