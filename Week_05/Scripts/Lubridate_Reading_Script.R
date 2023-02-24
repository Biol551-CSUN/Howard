##############
#Lubridate Reading

library(tidyverse)
library(lubridate)
library(nycflights13)

#################
#Creating date/times
#Remember that date-times are more complicated because of the time zones
#You can use these commands to get the date and time:
today()
now()

#The three ways to create a date/time is from 1) a string, 2)individual date-time components,
# 3) and from an existing date/time object

########Here is how to create date/time from strings
ymd("2017-01-31")
mdy("January 31st, 2017")
dmy("31-Jan-2017")