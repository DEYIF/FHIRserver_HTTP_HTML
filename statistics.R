library(plyr)
library(lme4)
library(here)
library(ggpubr)
library(tidyverse)
library(dplyr)
library(car)

#Helena's measurements

#First trial
time_t1_s1 <- c(23, 33, 43, 53, 63, 73, 83, 93, 103, 113, 123, 133)
watch_t1_s1 <- c(72, 74, 75, 76, 75, 75, 78, 78, 80, 77, 78, 78)
ppg_t1_s1 <- c(76, 80, 79, 77, 74, 77, 77, 90, 77, 80, 80, 88)
  
#Second trial
time_t2_s1 <- c(23, 33, 43, 53, 63, 73, 83, 93, 103, 113, 123, 133)
watch_t2_s1 <- c(73, 74, 78, 79, 72, 72, 73, 74, 75, 75, 74, 74)
ppg_t2_s1 <- c(72, 101, 82, 80, 75, 106, 133, 81, 82, 76, 81, 77)
  
#Third trial
time_t3_s1 <- c(23, 33, 43, 53, 63, 73, 83, 93, 103, 113, 123, 133)
watch_t3_s1 <- c(78, 75, 72, 73, 72, 74, 73, 76, 73, 73, 75, 73)
ppg_t3_s1 <- c(78, 75, 72, 73, 76, 79, 81, 82, 74, 77, 75, 79)

#Yufeng's measurements

#First trial
time_t1_s2 <- c(23, 33, 43, 53, 63, 73, 83, 93, 103, 113, 123, 133)
watch_t1_s2 <- c(86, 89, 91, 91, 88, 88, 90, 86, 88, 86, 85, 88)
ppg_t1_s2 <- c(101, 94, 100, 91, 88, 115, 92, 107, 92, 85, 89, 82)

#Second trial
time_t2_s2 <- c(23, 33, 43, 53, 63, 73, 83, 93, 103, 113, 123, 133)
watch_t2_s2 <- c(83, 87, 86, 82, 83, 86, 83, 85, 82, 81, 83, 85)
ppg_t2_s2 <- c(102, 90, 92, 84, 83, 82, 88, 83, 82, 83, 88, 88)

#Third trial
time_t3_s2 <- c(23, 33, 43, 53, 63, 73, 83, 93, 103, 113, 123, 133)
watch_t3_s2 <- c(83, 83, 83, 84, 83, 79, 81, 86, 87, 88, 90, 89)
ppg_t3_s2 <- c(93, 97, 132, 81, 80, 90, 102, 85, 93, 101, 98, 84)

# Data combined
data <- data.frame(
  time = rep(c(time_t1, time_t2, time_t3), 4), # Repeat for each device and subject
  heart_rate = c(watch_t1, watch_t2, watch_t3, ppg_t1, ppg_t2, ppg_t3,
                 watch_t1_s2, watch_t2_s2, watch_t3_s2, ppg_t1_s2, ppg_t2_s2, ppg_t3_s2), # Combine all heart rate data
  device = rep(c("watch", "ppg"), each = length(watch_t1) * 3 * 2), # Indicate device type
  trial = rep(c("trial1", "trial2", "trial3"), each = length(watch_t1), times = 4), # Indicate trial
  subject = rep(c("subject1", "subject2"), each = length(watch_t1) * 3 * 2) # Indicate subject
)

model <- lmer(heart_rate ~ device * trial + (1 | subject) + (1 | time), data = data)
summary(model)

# Plot
data_plot <- data.frame(
  time = rep(time_t1_s1, 2),
  heart_rate = c(watch_t2_s1, ppg_t2_s1),
  device = rep(c("watch", "ppg"), each = length(time_t1_s1))
)

# Plotting both lines using ggplot
ggplot(data_plot, aes(x = time, y = heart_rate, color = device)) +
  geom_line() +
  geom_point() +
  labs(x = "Time (s)", y = "Heart Rate (bpm)") +
  theme_minimal()
