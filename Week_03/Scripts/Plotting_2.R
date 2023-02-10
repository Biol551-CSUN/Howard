### 
### Kristen Howard
### 

library(palmerpenguins)
library(tidyverse)
library(here)
library(praise)
### Load data ###
glimpse(penguins)
View(penguins)

ggplot(data=penguins, 
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm,
                     group = species,
                     color = species)) +
  geom_point()+
  geom_smooth(method = "lm")+
  labs(x = "Bill depth (mm)", 
       y = "Bill length (mm)"
        ) +
  scale_color_viridis_d()+
  scale_x_continuous(breaks = c(14,17,21), ) # c stands for concatinate
                      




ggplot(data=penguins, 
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm,
                     group = species,
                     color = species)) + 
  geom_point()+ 
  geom_smooth(method = "lm")+ 
  labs(x = "Bill depth (mm)", 
       y = "Bill length (mm)"
  ) +
  #scale_color_viridis_d()
  scale_color_manual(values = c("#9033ff", "purple", "green"))

library(beyonce)

ggplot(data=penguins, 
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm,
                     group = species,
                     color = species)) + 
  geom_point()+ 
  geom_smooth(method = "lm")+ 
  labs(x = "Bill depth (mm)", 
       y = "Bill length (mm)"
  ) +
  scale_color_manual(values = beyonce_palette(90)) +
 theme_classic()

##############
ggplot(data=penguins, 
       mapping = aes(x = bill_depth_mm,
                     color = species)) + 
  geom_point()+ 
  geom_smooth(method = "lm")+ 
  labs(x = "Bill depth (mm)", 
       y = "Bill length (mm)"
  ) +
  scale_color_manual(values = beyonce_palette(19)) +
  theme_light() +
  theme(axis.title = element_text(size = 20,
                                  color = "pink"),
        panel.background = element_rect(fill = "light purple"))
                     y = bill_length_mm,
                     group = species,)

######################################
plot1 <- ggplot(data=penguins, 
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm,
                     group = species,
                     color = species)) + 
  geom_point() +
  geom_smooth(method = "lm")+ 
  labs(x = "Bill depth (mm)", 
       y = "Bill length (mm)"
  ) +
  scale_color_manual(values = beyonce_palette(20)) +
  theme(axis.title = element_text(size = 15),
        panel.background = element_rect(fill = "orchid"),
        panel.grid = element_line(color ="white"))
ggsave(here("Week_03","Output","proportionate pink penguin.jpeg"),
       width = 7, height = 5)
plot1
