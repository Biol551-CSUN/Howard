#########################
# Introduction to Visuals in R
# Created on: Feburary 7th, 2023
# Updated on: 
#############################
#gg = grammar of graphics
#aes = aesthetics

#### packages ####
library(ggplot2)
library(tidyverse)
library(palmerpenguins)

##### View data ####
View(penguins)
glimpse(penguins)

# We are going to investigate bill collected in the

ggplot(data=penguins,                  #This is were you bring in the data
  mapping = aes(x =  bill_depth_mm,    #Next tell it what your x will be
                y = bill_length_mm)) + #Now do y. remember to add plus to add layer
  geom_point()                       #Now geom will help us figure out if we use a point
--------------------------------------------------------------------------
ggplot(data=penguins,                 
       mapping = aes(x =  bill_depth_mm,  
                     y = bill_length_mm,  # Now lets add some color. go to aes
                     color = species)) +  # Remember plus
                         # Remember plus#Now lets make a title! Use labs
ggplot(data=penguins, 
         mapping = aes(x = bill_depth_mm,
                       y = bill_length_mm,
                       color = species)) +
geom_point()+
  labs(title = "Bill depth and length",
       subtitle = "Dimensions for Adelie, Chinstrap, and Gentoo Penguins",
       x = "Bill depth (mm)", y = "Bill length (mm)")   



ggplot(data=penguins, 
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm,
                     color = species,
                     shape = island
       )) +
  geom_point()+
  labs(title = "Bill depth and length",
       subtitle = "Dimensions for Adelie, Chinstrap, and Gentoo Penguins",
       x = "Bill depth (mm)", y = "Bill length (mm)",
       color = "Species") +
  scale_color_viridis_d()

ggplot(data=penguins, 
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm,
                     size = sex,
                     alpha = flipper_length_mm
       )) +
  geom_point()


ggplot(penguins, 
       aes(x = bill_depth_mm,
           y = bill_length_mm))+
  geom_point()+
  facet_grid(sex~species)
