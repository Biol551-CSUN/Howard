# Introduction into strings 
# April 20th, 2023

# Load Packages
library(here)
library(tidyverse)
library(tidytext)
library(wordcloud2)
library(janeaustenr)

# What is a string
words <-  "This is a string"
words

# A string can be a vector as well
words_vector <- c("Apples", "Bananas", "Strawberries")
words_vector

# There are 4 basic functions of a string

## Manipulation: allow you to manipulate individual characters within strings in
# character vectors

## Whitespace tools: to add, remove, and manipulate whitespace

## Locale sensitive operations: whose operations will vary from locale to locale

## Pattern matching functions: these recognoze 4 engines of pattern description. The most common is regular expressions but there are 3 other tools


#### Manipulation #####
# You can paste words together
paste("High temp", "Low ph")

# add a dash in between the words
paste("High temp", "Low ph", sep = "-")

# remove space in between the words
paste0("High temp", "Low pH")

# Working with vectors
shapes <- c("Square", "Circle", "Triangle")
paste("My favorite shape is a", shapes)

two_cities <- c("best", "worst")
paste("It was the", two_cities, "of times.")

# Here is how to manipulate individual characters
# Here is how you would know how long a string is
shapes
str_length(shapes) # how many letters are in each word?

# You can also modify strings
seq_data<-c("ATCCCGTC")
str_sub(seq_data, start = 2, end = 4) # extract the 2nd to 4th AA
str_sub(seq_data, start = 3, end 3) <- "A" # add an A in the 3rd positoin
seq_data
str_dup(seq_data, times = c(2, 3)) # times is the number of times to duplicate each string

##### Whitespace Tools ####
badtreatments <- c("High", "High", "High", "Low", "Low")
badtreatments

str_trim(badtreatments) # This removes the whitespace
str_trim(badtreatments, side = "left") # this removes left
str_pad(badtreatments, 5, side = "right") # add a white space to the right side after the 5th character
str_pad(badtreatments, 5, side = "right", pad = "1") # add a 1 to the right side after the 5th character

x <- "I love R"
str_to_upper(x) # make everything upper case
str_to_lower(x) # make everything lower case
str_to_title(x) # Capitilize first letter of each word

##### Pattern Matching Functions ####
# {stringr - has functions to view, detect, locate, extract, match, replace, and split strigs based on speceific patterns}
# View a speceific pattern in a vector of strings
data<-c("AAA", "TATA", "CTAG", "GCTT")

str_view(data, pattern = "A") # Here is how to view which have "A:
str_detect(data, pattern = "A") # detect a specefic pattern
str_detect(data, pattern = "AT") # detect a specefic pattern

str_locate(data, pattern = "AT")

####### regex: regular expressions ######
vals<-c("a$b", "b$c","c$d")

## Metacharacters
# Here is how to replace all the "." with a space
str_replace(vals, "\\$", "")
## Sequences 
## Quantifiers
## Character class



