##################
#Introduction: Introduction to Dates and time using lubridate
# Created on: 2023-23-02
# Created by: Kristen Howard

#### Load Packages ####
library(tidyverse)
library(here)
library(lubridate)


#### Read Data ####
CondData <- read_csv(here("Week_05/Data/CondData.csv"))
DepthData <- read_csv(here("Week_05/Data/DepthData.csv"))

View(CondData)
View(DepthData)

#### Class Notes ####
now() #This can be used for time stamping
now(tz = "EST")
today()
today(tz = "EST")
am(now()) #This helps if you are diving data into morning and evening
pm(now())

# Dates must always be a CHARACTER
# DATETIMES ARE IN POSIXCT (MISSED THIS IN READING!)
ymd("2021-02-23")
mdy_hms("02/24/2021 22:22:20")
mdy_hm("February 24 2021 10:22 PM")

#### Extracting specific date or time elements from dates ####
datetimes<-c("02/24/2021 22:22:20",#This is a string of characters
             "02/25/2021 11:21:10",
             "02/26/2021 8:01:52")
datetimes <- mdy_hms(datetimes) #The type represents a date format
month(datetimes) #This gives numbers, label will give you abbrv.
month(datetimes, label = TRUE) #Extract the months from the character string
month(datetimes, label = TRUE, abbr = FALSE) #This gets rid of abbreviations
wday(datetimes, label = TRUE) #This is how you extract the date of the week
#How do you extract the date of the week w/o abbreviations?
wday(datetimes, label = TRUE, abbr = FALSE) #BUENO
hour(datetimes)
minute(datetimes)
second(datetimes)

#### This is how you add dates and times ####
datetimes + hours(4)

# hour() extracts the hour component from a time
# hours() is used to add hours to a date and time 

datetimes + days(2)
# day() extracts the hour component from a time
# days() is used to add hours to a datetime

#This can be done with minutes(), seconds(), years(), etc. 

#### Rounding dates ####
round_date(datetimes, "minutes") #This will round to the nearest minute
round_date(datetimes, "5 mins") #round to nearest 5 min

#### THINK, PAIR, SHARE ####
# Convert Date Column to a datetime
CondData <- read_csv(here("Week_05/Data/CondData.csv")) %>%
        mutate(Date = as.character(), #This is if it wasnt a character but it already is 
               Date = mdy_hm(Date))
CondData <- read_csv(here("Week_05/Data/CondData.csv")) %>%
  mutate(Date = mdy_hm(Date))
