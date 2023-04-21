#### Load libraries
library(tidyverse)
library(here)

#### Load data
income_mean <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-02-09/income_mean.csv')

#To make something a factor you put the vector in the function factor()
# the values that a factor takes are called levels

fruits <- factor(c("Apple", "Grape", "Banana"))
fruits


test<-c("A", "1", "2")
as.numeric(test)

# This is a big problem below
test <- factor(test)
as.numeric(test) # This is bad. . . YIKES

# This is why we use read_csv, because read.csv brings it in as a factor
# and this can cause issues

#### {forcats}
# Is a family of functions for categorictal data

glimpse(starwars)


starwars %>%
  filter(!is.na(species)) %>% # remove the NAs
  count(species, sort = TRUE)

star_counts <- starwars %>%
                  filter(!is.na(species)) %>% # remove the NAs
                  mutate(species = fct_lump(species, n = 3)) %>%
                  count(species)
star_counts # Now it is in alphabetical order

# You should make a count data for the protozoa

star_counts %>%
  ggplot(aes(x = fct_reorder(species, n), y = n)) +
  geom_col()

glimpse(income_mean) # Here is how we factor 2 variables and not just 1

total_income<-income_mean %>%
  group_by(year, income_quintile)%>%
  summarise(income_dollars_sum = sum(income_dollars))%>%
  mutate(income_quintile = factor(income_quintile)) # make it a factor
# YOU ALWAYS HAVE TO USE MUTATE IF YOU WANT TO CHANGE A COLUMN

total_income%>%
  ggplot(aes(x = year, y = income_dollars_sum, color = income_quintile))+
  geom_line() # The legend needs to be sorted

# We will use fct_reorder2, which reorders by two variables
total_income%>%
  ggplot(aes(x = year, y = income_dollars_sum, 
             color = fct_reorder2(income_quintile,year,income_dollars_sum)))+
  geom_line()+
  labs(color = "income quantile")

x1 <- factor(c("Jan", "Mar", "Apr", "Dec"))
x1

This order is probably not what we want... You can set the specific order of the levels

x2 <- factor(c("Jan", "Mar", "Apr", "Dec"), levels = c("Jan", "Mar", "Apr", "Dec"))
x2


# You can set the specific order of the levels

starwars_clean<-starwars %>% 
  filter(!is.na(species)) %>% # remove the NAs
  count(species, sort = TRUE) %>%
  mutate(species = factor(species)) %>% # make species a factor
  filter(n>3) # only keep species that have more than 3
starwars_clean

levels(starwars_clean$species)
# check the levels of the factors

starwars_clean<-starwars %>% 
  filter(!is.na(species)) %>% # remove the NAs
  count(species, sort = TRUE) %>%
  mutate(species = factor(species)) %>% # make species a factor 
  filter(n>3)  %>% # only keep species that have more than 3 
  droplevels() # drop extra levels

levels(starwars_clean$species)
# Here is how to rename/recode
starwars_clean<-starwars %>% 
  filter(!is.na(species)) %>% # remove the NAs
  count(species, sort = TRUE) %>%
  mutate(species = factor(species)) %>% # make species a factor 
  filter(n>3)  %>% # only keep species that have more than 3 
  droplevels() %>% # drop extra levels 
  mutate(species = fct_recode(species, "Humanoid" = "Human"))
starwars_clean

# Fun package
library(gm)
library(gm)

m <- 
  # initialize a Music object
  Music() +
  # add a 4/4 time signature
  Meter(4, 4) +
  # add a musical line of four quarter notes
  Line(list("C5", "D5", "E5", "F5"), list(1, 1, 1, 1))

show(m, to = c("score", "audio"))