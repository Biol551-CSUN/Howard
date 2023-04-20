# Kristen Howard
# April 11th, 2023
# Introduction into reprex

library(reprex)
library(datapasta)
library(styler)
library(tidyverse)
library(palmerpenguins)

# I want to create a subsetted dataframe of penguins that 
# only have the Adelie species. . . I will use the wrong 
# capitolization and get the "object" not found error
Adelie_penguins <- penguins %>%
                   filter(species == adelie)
