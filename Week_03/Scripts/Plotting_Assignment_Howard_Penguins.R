### Plotting ###
### Kristen Howard ###
### Created on: February 9th, 2023 ###
### Update on: February 13th, 2023 ###
### Investigating the relationship body weight and sex amoung three different bird species

### Packages ###
library(palmerpenguins)
library(ggplot2)
library(tidyverse)
library(here)
library(praise)
library(beyonce)

### Load/Read data ###
glimpse(penguins) # This gives a view of the number of columns, rows, and data info
View(penguins)    # Always remember to view the data 

## Data Analysis ###
## Note: aes stands for aesthetic.
ggplot(data=penguins,                   # This is were you bring in the data
       mapping = aes(x = sex,           # #Next tell it what your x & y will be
                     y = body_mass_g,
                     fill = sex)) +
  geom_boxplot() +                      #geom means geometry
  labs(x = "Sex", y = "Body Mass (g)", title = "Quantifying Total Mass Per Sex of Penguins") +
  facet_wrap(~species) +
  scale_fill_manual(values = beyonce_palette(11)) +
  theme_bw() + #Explore the different themes
  theme(axis.title = element_text (size = 15), panel.background = element_rect(fill = "lightgray"))


