#############
# Introduction to Lubridate - TIME/DATES
# Created on Feburary 23rd
#  
##############

#### Load Packages ####
library(tidyverse)
library(here)
library(lubridate)
library(devtools)
library(CatterPlots)

#### Load Data ####
CondData <- read.csv("Week_05/Data/CondData.csv")
DepthData <- read.csv("Week_05/Data/DepthData.csv")
#Both the date columns are formatted as mdy w/ time

#### Class notes ####
now() #This tells you the exact time
now(tz = "EST") #You can also specify the tz
now(tz = "GMT")
today() #This can also give you the date for today
today(tz = "GMT")
am(now()) #You can also as if it is morning or night!
pm(now())
leap_year(now()) #You can ask if it is a leap year

#### Date specifications for lubridate ###
# DATES MUST BE A CHARACTER
ymd_hms("2021-02-24 10:22:20 PM")
mdy_hms("02/24/2021 22:22:20")
mdy_hm("February 24 2021 10:22 PM")

#### Extracting specific date or time elements from dates ####
datetimes<-c("02/24/2021 22:22:20",#This is a string of characters
             "02/25/2021 11:21:10",
             "02/26/2021 8:01:52")
datetimes <- mdy_hms(datetimes) #Create a vector and convert them to date and times
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
#ALL THIS IS WRONGGG!!!!!!!!!!!!!!!
# CondData2 <- CondData %>%
#               separate(CondData,
#                        col = "Date",
#                        into = c("Date","Time",
#                        sep = "_[^[:alnum:]]+_"))
# view(CondData2)
# 
# CondData3 <- CondData %>%
#                select(Date) %>%
#                mutate()
# view(CondData3)

#### AWESOME PACKAGE ####

# CATTERPLOT
x <-c(2:8)# make up some data
y<-c(2:8)
catplot(xs=x, ys=y, cat=3, catcolor='purpe')               
