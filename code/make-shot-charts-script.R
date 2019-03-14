#############################
## Title: Make Shot Charts
## Description: Converting ??
## Inputs: ??
## Outputs: ??
#############################

# load libraries
library(grid)
library(jpeg)
library(ggplot2)
library(dplyr)

# get player and court data
shot_data <- read.csv("~/Desktop/workout01/data/shots-data.csv", stringsAsFactors = FALSE)
court_file <- "~/Desktop/workout01/images/nba-court.jpg"

# create raste object
court_image <- rasterGrob(readJPEG(court_file), width = unit(1, "npc"), height = unit(1, "npc"))

# curry shot chart with court background
curry_shot_chart <- ggplot(data = filter(shot_data, shot_data$name == "Stephen Curry")) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) + 
  ggtitle('Shot Chart: Stephen Curry (2016 season)') + 
  theme_minimal()

# thompson shot chart
thompson_shot_chart <- ggplot(data = filter(shot_data, shot_data$name == "Klay Thompson")) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) + 
  ggtitle('Shot Chart: Klay Thompson (2016 season)') + 
  theme_minimal()

# durant shot chart
durant_shot_chart <- ggplot(data = filter(shot_data, shot_data$name == "Kevin Durant")) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) + 
  ggtitle('Shot Chart: Kevin Durant (2016 season)') + 
  theme_minimal()

# green shot chart
green_shot_chart <- ggplot(data = filter(shot_data, shot_data$name == "Draymond Green")) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) + 
  ggtitle('Shot Chart: Draymond Green (2016 season)') + 
  theme_minimal()

# iguodala shot chart
iguodala_shot_chart <- ggplot(data = filter(shot_data, shot_data$name == "Andre Iguodala")) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) + 
  ggtitle('Shot Chart: Andre Iguodala (2016 season)') + 
  theme_minimal()

# facetting plots
ggplot(data = shot_data, aes(x = x, y = y, color = shot_made_flag)) + 
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point() +
  ylim(-50, 420) +
  ggtitle('Shot Charts: GSW (2016 season)') +
  facet_wrap(~ name) +
  theme_minimal()