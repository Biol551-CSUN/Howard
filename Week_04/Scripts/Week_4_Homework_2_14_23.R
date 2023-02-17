##########################################
### Week 4 Homework ##############
### Kristen Howard
###You will only have a scripts and output because there is no data
#################################################################
### Packages
library(palmerpenguins)
library(tidyverse)
library(here)
library(devtools)
library(dadjoke)
library(ggeasy)

### read data ###
head(penguins)
glimpse(penguins)
view(penguins)

### Part 1 Question 1
### calculates the mean and variance of body mass by species, island, and sex without
### any NAs
view(penguins)
mean_data <- penguins %>%    #naming dataframe and choosing data
          drop_na(sex) %>%   #This is how you drop the NAs seen in sex
          group_by(species,island,sex) %>%   #here we group by species, island, and sex
          summarise(mean_body_mass_g = mean(body_mass_g, na.rm = TRUE)) #This is how you calculate the mean
view(mean_data)

var_data <- penguins %>% # Naming data and choosing data
  drop_na(sex) %>%  #drops the NAs in found in sex
  group_by(species,island,sex) %>% #groups by categories
  summarise(var_body_mass_g = var(body_mass_g, na.rm = TRUE)) #this is how you calculate the variance
view(var_data)
        
### Question 2

filtered_data <- penguins %>% #choose and name the data
                 filter(sex != "male") %>% # this selects the makes to be filtered. We want to exclude male
                mutate(log_mass = log(body_mass_g)) %>% #calculate log biomass
                select(species, island, sex, log_mass) %>% #Select for species, island, sex, log_mass

view(filtered_data)

#######Graphs############

penguins %>%
  drop_na(sex) %>%
  ggplot(aes(x = island, #Assign the x and y values
             y = log(body_mass_g))) +
  geom_boxplot() + #this will create box plot
  labs(x= "Island", y="Logged Body Mass (g)", size = 20) +
  ggtitle(wrapper(my_title2, width = 20)) + #using wrapper function for long title
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))

# Create wrapper function for long text
wrapper <- function(x, ...) 
{paste(strwrap(x, ...), collapse = "\n")}
my_title2 <- "Body Mass of Female Penguins Amoung Islands"
