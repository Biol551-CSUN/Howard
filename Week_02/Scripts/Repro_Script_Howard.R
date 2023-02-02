## This is our first script. We are learning how to import data. 
## Created by: Kristen Howard
## Created on: 2023-01-02
## Updated on: 
# install.packages("here")
install.packages("tidyverse")
########################################
# Libraries -----------------------------
library(tidyverse)
library(here)

# Load data -----------------------------
WeightData<-read_csv(here("Week_02","data","weightdata.csv"))

#View Data ------------------------------
View(WeightData)
glimpse(WeightData) #This gives a preview of the data as well dbl = numeric

# Data Analysis --------------------------
head(WeightData) #This looks at the top 6 lines of data
tail(WeightData) #Looks at the bottom 6 lines of data
#You can specify the number of lines by typing Head(Dataname, #)
summary(WeightData)
