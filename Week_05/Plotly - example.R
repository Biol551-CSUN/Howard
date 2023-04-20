
# Load libraaries
library(tidyverse)
library(here)
library(plotly)
library(rjson)
library(readr)

data <- fromJSON(file="https://raw.githubusercontent.com/plotly/datasets/master/geojson-counties-fips.json")
data$features[[1]]


df <- read_csv("C:/Users/kdh19230/Downloads/dataset-47806.csv")
View(df)