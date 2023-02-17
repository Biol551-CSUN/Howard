#############################
###Lab Assignment: Using the chemistry data
### Created by: Kristen Howard
### Created on: February, 16th 2023
##############################
#### Load Packages ######
library(tidyverse)
library(here)
library(ggplot2)
library(plotly)
library(plyr)

##### Load Data ######
ChemData <- read_csv(here("Week_04","Data","chemicaldata_maunalua.csv"))
View(ChemData)
glimpse(ChemData)
head(ChemData)

####### Data Analysis ###############
#Remember to View dataframe after each line of code
ChemData_clean <- ChemData %>%
  drop_na() %>% #Remove the NAs
  separate(col = Tide_time, #separate the Tide_time column
           into = c("Tide","Time"), #This lists outs the name of the new columns
           sep = "_", #This is what it is seperated by
           remove = FALSE)
  filter(.data = ChemData,Season == "SPRING") %>% #we want to filter by spring
  pivot_longer(cols = Temp_in:percent_sgd, # 
               names_to = "Variables", # the names of the new cols
               values_to = "Values") %>% # names of the new column with all the values
  group_by(Variables, Site) %>% #Group by site
  summarise(mean_vals = mean(Values, na.rm = TRUE))%>% #Here we have calculated the means in each site with each variable
  pivot_wider(names_from = Variables, #Now make it wide for the calculations. Looks good!
              values_from = mean_vals) %>%
  write_csv(here("Week_04","output","summary.csv")) #Save to output folder
  View(ChemData_clean)
  
######## Graph ###################

Chem_Graph <- ChemData_clean %>% #Choosing this data set
                filter(Season == "SPRING") %>% # Filtering by season
                ggplot( aes(pH, Zone, size = percent_sgd, color= Site)) + #this sets the x and y axises, correlates point size, and colored by site.
                geom_point(alpha = .5) +   #set alpha to .5, this allows us to see overlaying points
                theme_bw() +
                ggtitle("Spring Season Sites at Different Zones")

ggplotly(Chem_Graph) #Interactive graph. This is not working. Cannot find solution on legends.
  
