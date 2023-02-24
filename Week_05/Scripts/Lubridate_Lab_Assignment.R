###########################
#Lab Assignment
# Created on February 23rd, 2023
# Created by Kristen Howard
############################

#### Load Packages ####
library(tidyverse)
library(here)
library(lubridate)
library(ggplot2)

#### Load Data ####
view(CondData) #View data
glimpse(CondData)
view(DepthData)

#### Analysis ####
CondData <- read_csv(here("Week_05/Data/CondData.csv")) %>% #read in data
              mutate(date = mdy_hms(date),     #change to datetime format
                     date = round_date(date,"10 seconds")) #round by 10 seconds
DepthData <- read.csv("Week_05/Data/DepthData.csv") %>%
              mutate(date = ymd_hms(date)) %>% #make the data readable
                inner_join(CondData) %>% #combining with no NAs
                mutate(date = round_date(date, "minute")) %>% #create a column where you use this function
                group_by(date) %>% #group by the date and use summarize to calculate the mean
                summarise(date = mean(date, na.rm = TRUE),
                          depth = mean(Depth, na.rm = TRUE),
                          temp = mean(Temperature, na.rm = TRUE),
                         sal = mean(Salinity, na.rm = TRUE))
#### Create Graph ####
# Create a geom_line showing the average temperature over time
DepthData %>%
    ggplot(aes(x = date,
               y = depth )) +
    geom_line(color = "red") +
    labs(x = "Time", y = "Average Temperature", title = "Average Temperature Over Time") +
    theme_minimal() +
    theme(plot.title = element_text(hjust = 0.5))

# Created line plot showing average salinity and average temperature. Not adding 
# to output as the legend is not accurate to what the averages represent.

DepthData %>%
  ggplot(aes(x = date)) +
  geom_line(aes(y = sal, color = "red")) +
  geom_line(aes(y = temp,color = "steelblue")) +
  labs(x = "Time", y = "Average Temperature", title = "Average Temperature Over Time") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5))
# Thu Feb 23 16:05:41 2023 ------------------------------
  
