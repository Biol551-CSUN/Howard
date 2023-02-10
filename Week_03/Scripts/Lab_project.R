######################
## Penguin - Investigating the relationship between three bird species 
## and their body mass (g) over ti
##
## Kristen Howard
## Created on: Feburary 9th, 2023
## Updated on:

#################################


#### packages ####
library(ggplot2)
library(ggplot)
library(tidyverse)
library(palmerpenguins)
library(lme4)
library(emmeans)
library(gg)

ggplot(data=penguins,                  
       mapping = aes(x =  sex,    
                     y =  body_mass_g,
                     species = Adelie
                     color = species
                     )) +
geom_point()  





ggplot(data=penguins,
       mapping = aes(x = year,
                     y = body_mass_g,
                     group = species
                      )) +
  geom_line()+
  geom_smooth(method = glm)
  labs(x = "Time"
       y = "Body Mass (g)"
       ) +
    theme_bw +
    
    
    
    
    
    
    
  ###########  
    
  ggplot(data=penguins,
         mapping = aes(x = time,
                       y = body_mass_g,
                       group = sex)) +
        geom_line() + labs( x = "sex",
                             y = "body_mass_g")
  
  
  
  ggplot(data=penguins,
         mapping = aes(x = time,
                       y = body_mass_g,
                       species = Adelie)) +
    geom_abline() + labs( x = "sex",
                        y = "body_mass_g") 
  
  
  ggplot(penguins, aes(x= year, y=body_mass_g, group=factor(body_mass_g))) +
    theme_bw()+
    theme(legend.title=element_text(colour="black", size=14), axis.text.x=element_text(face="bold", color="black", size=16), axis.text.y=element_text(face="bold", color="black", size=13), axis.title.x = element_text(color="black", size=18, face="bold"), axis.title.y = element_text(color="black", size=18, face="bold"),panel.grid.major=element_blank(), panel.grid.minor=element_blank())+ 
    geom_line(aes(linetype=species, color=species)) +
    geom_point(aes(color=species))+
    labs(x="year", y="Body Mass (g)") 

  
  
  
library(beyonce)
ggplot(data=penguins,
       mapping = aes(x= sex,
                     y = body_mass_g,
                     group = species) +
      geom_col() +
      labs(x = "Sex"
           y = "Body Mass (g)",
           title = "Bird Body Mass") + facet_wrap(species))
  
  
ggplot(data=penguins, 
       mapping = aes(x = sex,
                     y = body_mass_g,
                     group = species, color = sex)) +
  geom_col()+
  labs(x = "sex", 
       y = "body_mass_g",
       title = "Birds rock"
  ) + facet_wrap(~species) + 
  scale_color_manual(values = beyonce_palette((7)) + theme_stata()+
       theme(axis.title = element_text (size = 15)), panel.background = element_rect(fill = "white"))                                 
  
  
    