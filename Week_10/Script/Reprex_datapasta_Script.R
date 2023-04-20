#######
# Group 1
# April 11th, 2023

library(tidyverse)
library(here)

data <- tibble::tribble(
  ~SampleID, ~Treatment, ~Weight,
         1L,     "High",     1.3,
         2L,      "Low",     5.4,
         3L,     "High",     2.6,
         4L,      "Low",     7.2,
         5L,     "High",     4.6,
         6L,      "Low",     9.5,
         7L,     "High",     2.2,
         8L,      "Low",     5.1,
         9L,     "High",     4.6,
        10L,      "Low",     8.7
  )

low_data <-  data %>% 
              filter(Treatment == low) %>%
              mutate('Weight_avg' = sum(Weight))
low_data