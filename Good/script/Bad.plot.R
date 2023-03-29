########
# Good/Bad Plot Assignment
# Kristen Howard
# March 21st, 2023

#### Load Packages
library(here)
library(tidyverse)
library(lubridate)
library(dplyr)
library(imager)
library(jpeg)


#### Load Data
cocktails <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-05-26/cocktails.csv')
glimpse(cocktails)
view(cocktails)

#### Good Plot Code

cocktails %>%
  ggplot( aes(x = category,
              y = ingredient_number)) +
  geom_violin() +
  ggtitle(label = "Drink Category and Ingredients") +
  theme(plot.title = element_text(hjust = 0.5)) +
  labs( x = "Cocktail Category",
        y = "Number of Ingredients") +
    theme_bw() 

#### Bad Plot Code 

# Create a plot with a cocktail on it and beer. Then have data of the number of
# cocktails vs shots is some sort of geom point

# Download Picture for Graph


img <- image_read("https://images.unsplash.com/photo-1597290282695-edc43d0e7129?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=875&q=80")

img %>% 
  image_scale("200")

img %>% 
  image_blur(5, 5) %>%
  image_colorize(opacity = 20, color = "white")

cocktails_clean <- cocktails %>%
  select(drink, ingredient_number,category,drink_thumb) %>%
  filter(category == 'Beer',
         ingredient_number < 4)

view(cocktails_clean)


cocktails_clean %>%
  ggplot( aes(x = ingredient_number,
              y = drink)) +
  annotation_custom(grid::rasterGrob(img
                                     , width = unit(1, "npc")
                                     , height = unit(1, "npc"))) +
  geom_violin_pattern( fill = '#f28e13', color = 'white',
                       pattern = 'circle', pattern_density = 0.3) + 
  coord_flip() +
  labs(title = 'Beer Drinks and Number of Ingredients') +
  theme(titl = element_text(angle = -45, hjust = 0)) +
  theme(axis.text.x = element_text(colour = "#FF10F0")) +  
  theme(panel.background = element_rect(fill = 'img'))+
  theme_void()
