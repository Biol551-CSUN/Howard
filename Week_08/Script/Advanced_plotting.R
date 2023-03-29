# Advanced Plotting
# March 28th, 2023

# Load Packages
library(patchwork)
library(ggrepel)
library(gganimate)
library(magick)
library(palmerpenguins)
library(tidyverse)

# Discuss Patchwork
 p1 <- penguins %>%
       ggplot(aes(x= body_mass_g,
                  y = bill_length_mm,
                  color = species)) +
      geom_point()
 p1
 
 
 p2 <- penguins %>%
   ggplot(aes(x= sex,
              y = body_mass_g,
              color = species)) +
   geom_jitter(width = 0.2)
p2 

p1 + p2 +
  plot_layout(guides = 'collect') + # This removes  one of the guides or 'legends)
  plot_annotation(tag_levels = 'I') # You can now add labels

# ggrepel This is how you can create easy and clear labels for plots
view(mtcars)

ggplot(mtcars, aes(x = wt, 
                   y = mpg, 
                   label = rownames(mtcars))) +
  geom_text() + # creates a text label
  geom_point(color = 'red')


ggplot(mtcars, aes(x = wt, 
                   y = mpg, 
                   label = rownames(mtcars))) + #This is how you select the row names of the data set
  geom_text_repel() + # repel them
  geom_point(color = 'purple', shape = 'square')

ggplot(mtcars, aes(x = wt, 
                   y = mpg, 
                   label = rownames(mtcars))) + #This is how you select the row names of the data set
  geom_label_repel() + # The label adds a background and the color can be changed
  geom_point(color = 'purple', shape = 'square')

penguins %>%
  ggplot(aes(x = body_mass_g, 
             y = bill_depth_mm, 
             color = species)) +
  geom_point()


penguins %>%
  ggplot(aes(x = body_mass_g, 
             y = bill_depth_mm, 
             color = species)) +
  geom_point() +
  transition_states(
    year, # what are we animating by
    transition_length = 2, #The relative length of the transition. in seconds
    state_length = 1 # The length of the pause between transitions
  ) +
   + #This controls how it moves in
  ease_aes("sine-in-out") +
  ggtitle('Year: {closest_state}') +
  anim_save(here("Week_08","output",))

#  Magick

penguin<-image_read("https://pngimg.com/uploads/penguin/pinguin_PNG9.png")
penguin

penguins %>%
  ggplot(aes(x = body_mass_g, 
             y = bill_depth_mm, 
             color = species)) +
  geom_point()

penplot<-image_read(here("Week_08","output","penguinplot.png")) #This is how to do it when it is in your folder
out <- image_composite(penplot, penguin, offset = "+70+30")
out

pengif<-image_read("https://media3.giphy.com/media/H4uE6w9G1uK4M/giphy.gif")
outgif <- image_composite(penplot, pengif, gravity = "center")
animation <- image_animate(outgif, fps = 10, optimize = TRUE)
animation