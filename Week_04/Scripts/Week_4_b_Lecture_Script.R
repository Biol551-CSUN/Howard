############################
# Introduction
# Created on Feburary 16th, 2023
##
################################

#### Load libraries
library(tidyverse)
library(here)

#### Load in Data ####
ChemData <- read_csv(here("Week_04","Data","chemicaldata_maunalua.csv"))
View(ChemData)
glimpse(ChemData)
head(ChemData)

ChemData_clean <- ChemData %>%# This is another way to remove all NAs   
              filter(complete.cases(.))
View(ChemData_clean)
#### We need to separate the Tide_Time data

#This separates one column into multiple columns
?separate #Get more information about this function

#This is how we did it
separate(data = ChemData_clean, col = Tide_time, 
                                into = c("Tide", "Time"), 
                                sep = "_")
#This is how it is in lecture
ChemData_clean2<-ChemData %>%
  drop_na() %>% #filters out everything that is not a complete row
  separate(col = Tide_time, # choose the tide time col
           into = c("Tide"
                    ,
                    "Time"), # separate it into two columns Tide and tim
           sep = "_" ) # separate by _
head(ChemData_clean2)

#This is how you keep the orinal column, you add remove = FALSE
ChemData_clean3<-ChemData %>%
  drop_na() %>% #filters out everything that is not a complete row
  separate(col = Tide_time, # choose the tide time col
           into = c("Tide"
                    ,
                    "Time"), # separate it into two columns Tide and time
           sep = "_", # separate by _
           remove = FALSE)
View(ChemData_clean3)
############This is how you UNITE and you take 2 columns into 1
ChemData_clean4 <- ChemData %>%
  unite(col = "Site_Zone"
      , # the name of the NEW col
      c(Site,Zone), # the columns to unite. You can use any puncuation to unite the columns together
      sep = "."
      , # lets put a . in the middle
      remove = FALSE) # keep the original
View(ChemData_clean4)

##################Now here is how you pivot between long and wide datasets
pivot_longer()# wide to long
pivot_wider() # long to wide

#Our current data is wide
ChemData_long <-ChemData_clean %>%
  pivot_longer(cols = Temp_in:percent_sgd, # the cols you want to pivot. This s
               names_to = "Variables"
               , # the names of the new cols with all the
               values_to = "Values") # names of the new column with all the val
View(ChemData_long)
#It is better to summarize with long datasets
ChemData_long %>%
  group_by(Variables, Site) %>% # group by everything we want
  summarise(Param_means = mean(Values, na.rm = TRUE), # get mean
            Param_vars = var(Values, na.rm = TRUE)) # get variance

##########################################
# Calculate mean, variance, and standard deviation for all variables
# by site, zone, and tide

ChemData_long %>%
  group_by(Variables, Site, Zone, Tide) %>%
  summarise(Param_means = mean(Values, na.rm = TRUE,
            Param_vars = var(Values, na.rm = TRUE,
            Param_sd = sd(Values, na.rm = TRUE))))

###############################
ChemData_long %>%
  ggplot(aes(x = Site, y = Values))+
  geom_boxplot()+
  facet_wrap(~Variables, scales = "free") #The scales make each individual graph have a proper scale


#Now we want to go long - wide
ChemData_wide<-ChemData_long %>%
  pivot_wider(names_from = Variables, # column with the names for the new colum
              values_from = Values) # column with the values
View(ChemData_wide)
###################### Starting from beginning
ChemData_clean <- ChemData %>%
  drop_na() %>%
  seperate(col = Tide_time,
           into = c("Tide","Time"),
           sep = "_",
           remove = FALSE) %>%
    pivot_longer(cols = Temp_in:percent_sgd, # the cols you want to pivot. This s
                 names_to = "Variables", # the names of the new cols with all the
                 values_to = "Values") %>% # names of the new column with all the values
  group_by(Variables, Site, Time) %>%
    summarise(mean_vals = mean(Values, na.rm = TRUE))
              
ChemData_clean<-ChemData %>%
   drop_na() %>% #filters out everything that is not a complete row
   separate(col = Tide_time, # choose the tide time col
            into = c("Tide", "Time"), # separate it into two columns Tide and tim
            sep = "_", # separate by _
            remove = FALSE) %>%
   pivot_longer(cols = Temp_in:percent_sgd, # the cols you want to pivot. This s
                names_to = "Variables", # the names of the new cols with all the
                values_to = "Values") %>% # names of the new column with all the
   group_by(Variables, Site, Time) %>%
   summarise(mean_vals = mean(Values, na.rm = TRUE)) %>%
   pivot_wider(names_from = Variables,
                alues_from = mean_vals) %>% # notice it is now mean_vals as the
  write_csv(here("Week_04","output","summary.csv"))
  
    
View(ChemData_clean)