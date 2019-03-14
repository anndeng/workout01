#################################################################
## Title: Code for shots-data.csv
## Description: Code to make "shots-data.csv" for data visualization
## Inputs: .csv files of players from data folder
## Outputs: shots-data.csv, shots-data-summary.txt, playerfirst-last-summary.txt
#################################################################

# library load
library(dplyr)

# reading in .csvs
curry <- read.csv("~/Desktop/workout01/data/stephen-curry.csv", stringsAsFactors = FALSE)
thompson <- read.csv("~/Desktop/workout01/data/klay-thompson.csv", stringsAsFactors = FALSE)
durant <- read.csv("~/Desktop/workout01/data/kevin-durant.csv", stringsAsFactors = FALSE)
green <- read.csv("~/Desktop/workout01/data/draymond-green.csv", stringsAsFactors = FALSE)
iguodala <- read.csv("~/Desktop/workout01/data/andre-iguodala.csv", stringsAsFactors = FALSE)

# add name column
curry$name <- "Stephen Curry"
thompson$name <- "Klay Thompson"
durant$name <- "Kevin Durant"
green$name <- "Draymond Green"
iguodala$name <- "Andre Iguodala"

# clarifying shot_made_flag
curry$shot_made_flag[curry$shot_made_flag == 'y'] <- "shot_yes"
curry$shot_made_flag[curry$shot_made_flag == 'n'] <- "shot_no"
thompson$shot_made_flag[thompson$shot_made_flag == 'y'] <- "shot_yes"
thompson$shot_made_flag[thompson$shot_made_flag == 'n'] <- "shot_no"
durant$shot_made_flag[durant$shot_made_flag == 'y'] <- "shot_yes"
durant$shot_made_flag[durant$shot_made_flag == 'n'] <- "shot_no"
green$shot_made_flag[green$shot_made_flag == 'y'] <- "shot_yes"
green$shot_made_flag[green$shot_made_flag == 'n'] <- "shot_no"
iguodala$shot_made_flag[iguodala$shot_made_flag == 'y'] <- "shot_yes"
iguodala$shot_made_flag[iguodala$shot_made_flag == 'n'] <- "shot_no"

# adding shot minute
curry$minute <- ((curry$period - 1) * 12 + (12 - curry$minutes_remaining))
thompson$minute <- ((thompson$period - 1) * 12 + (12 - thompson$minutes_remaining))
durant$minute <- ((durant$period - 1) * 12 + (12 - durant$minutes_remaining))
green$minute <- ((green$period - 1) * 12 + (12 - green$minutes_remaining))
iguodala$minute <- ((iguodala$period - 1) * 12 + (12 - iguodala$minutes_remaining))

# sinking to output
sink("~/Desktop/workout01/output/stephen-curry-summary.txt")
summary(curry)
sink()
sink("~/Desktop/workout01/output/klay-thompson-summary.txt")
summary(thompson)
sink()
sink("~/Desktop/workout01/output/kevin-durant-summary.txt")
summary(durant)
sink()
sink("~/Desktop/workout01/output/draymond-green-summary.txt")
summary(green)
sink()
sink("~/Desktop/workout01/output/andre-iguodala-summary.txt")
summary(iguodala)
sink()

# rbind and export
stacked_tables <- rbind(curry, durant, green, iguodala, thompson)
write.csv(stacked_tables, file = "~/Desktop/workout01/data/shots-data.csv")
sink("~/Desktop/workout01/output/shots-data-summary.txt")
summary(stacked_tables)
sink()