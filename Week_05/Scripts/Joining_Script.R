#########################
# Introduction
#
#########################

##### Load Packages #### 
library(tidyverse)
library(here)

##### Read data ####
# Environmental data from each site
EnviroData<-read_csv(here("Week_05","data", 
                          "site.characteristics.data.csv"))
#Thermal performance data
TPCData<-read_csv(here("Week_05","data","Topt_data.csv"))

#Data Dictionary
DataDictionary <- read_csv(here("Week_05","data","data_dictionary.csv"))

View(EnviroData)
View(TPCData)
View(DataDictionary)
glimpse(EnviroData)
glimpse(TPCData)

#################
#Convert the data to wide format. TPCData is in wide and
# EnviroData is in long format

EnviroData_wide <- EnviroData %>% #Converting to wide format
  pivot_wider(names_from = parameter.measured,
              values_from = values) %>%
  arrange(site.letter) #This sorts data in order by this column
View(EnviroData_wide) #Check the data. Looks good

# left_join(x, y) brings two data frames together in one single 
# data frame

FullData_left <- left_join(TPCData, EnviroData_wide)
# For this to work, you have to have a key that is identical in both data frames
head(FullData_left)

FullData_left<- left_join(TPCData, EnviroData_wide) %>%
  relocate(where(is.numeric), .after = where(is.character)) # relocate all the numeric data after the character da
##################################################
# Calculate mean and variance of all collected (TPC and environmental data by site)
# EnviroData is already long. Convert TPC data to long

# ###THIS IS ALL WRONG!!!!!!!
# TPCData_Long <- TPCData %>%
#               pivot_longer(cols = E:Topt,
#                            names_to  = "Variables",
#                            values_to = "Values") %>%
#               arrange(site.letter)
# View(TPCData_Long)
# #Mean and variance of TPC
# TPCData_Long %>%
#     group_by(Variables, site.letter) %>% #Group by variables and site letter
#     summarise(Param_means = mean(Values, na.rm = TRUE),# Get mean
#               Param_vars = mean(Values, na.rm = TRUE)) #get variance
# #Mean and variance of EnviroData
# EnviroData %>%
#   group_by(parameter.measured, site.letter) %>% #Group by variables and site letter
#   summarise(Param_means = mean(values),# Get mean
#             Param_vars = mean(values)) #get variance

####################################
# Here is how you create tibble
T1 <- tibble(Site.ID = c("A","B","C","D"),
            Temperature = c(14.1, 16.7, 15.3, 12.8))
T1

T2 <-tibble(Site.ID = c("A", "B", "D", "E"), 
            pH = c(7.3, 7.8, 8.1, 7.9))
T2
###################################
#left_join v.s right_join
left_join(T1, T2)  #This has T1 site.ID in it
right_join(T1, T2) #This has T2 site.ID in it, the E is NA because T1 does not have that site

#inner_join vs full_join
inner_join(T1,T2) # Only keeps data that is complete 
full_join(T1,T2) #Keeps everything and NAs. This retains ALL the information. 
                 #This is similar to merge

#semi_join vs anti_join
semi_join(T1, T2) #keeps all frows from first data set
anti_join(T1, T2) #keeps just columns from first set. Keeps coluns that are missing

library(cowsay)
say("hey sexy baby", by = "cat")
###############################################
# Lab practice
# Practice Joining
#We have a scientist that collected protozoan area and numercial counts 
#from different pitcher plants found at different sites. 
#Practice your joining functions and create a tibble

T3 <- tibble(Site.ID = c("A", "B", "C", "D"),
             Protozoa.area = c(0.003, 0.523 ,23.0 ,0.0003))

T4 <- tibble(Site.ID = c("A", "B", "C", "K") ,   
            Protozoa.counts = c(34444, 22223, 3333, 32344)) 
T3 #View the data you just created
T4 #View the data you just created

left_join(T3, T4) #See how there is an NA under P.counts? There is no Site D in T4
right_join(T3, T4) #See how there is an NA under P.area. There is no Site K in T3
inner_join(T3, T4) #Only keeps data that is complete from T3 and T4
full_join(T3, T4) #Keeps all data including NAs in T3 & T4
anti_join(T3,T4) #Dpes the opposite of semi join, keeps columns that are missing in T4
anti_join(T4,T3) #See, now it keeps K
semi_join(T3, T4) #Keeps the information from T3 that has a matching value at site in T4



T5 <- tibble(Site.ID = c("A", "B", "C", "D"),
             Pitcher.Plant.ID = c(23,67,23,45),
             Protozoa.area = c(0.003, 0.523 ,23.0 ,0.0003))
T5
T6 <- tibble(Site.ID = c("A", "B", "C", "K") , 
             Pitcher.Plant.ID = c(23,67,23,45),
             Protozoa.counts = c(34444, 22223, 3333, 32344)) 
T6

left_join(T5,T6)
right_join(T5,T6)
full_join(T5,T6)
