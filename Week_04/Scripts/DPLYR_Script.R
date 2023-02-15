######################
# Kristen Howard
# DYPLR
library(palmerpenguins)
library(tidyverse)
library(here)
library(devtools)
library(dadjoke)
### Read ###
head(penguins)
glimpse(penguins)


### Filter data ###
### ==  asks question and matches for all of those female data
filter(.data = penguins, sex == "female")

filter(.data = penguins, year == "2008")

filter(.data = penguins, body_mass_g > "5000")

### There are 2 ways to seperate this or Boolean operators
filter(.data = penguins, sex == "female", body_mass_g > "5000") #OR (both give the same output)
filter(.data = penguins, sex == "female"& body_mass_g > "5000")

######### Filter - Thinking Exercise ###############################
# Penguins that were collected in either 2008 or 2009
filter(.data = penguins, year == "2008" | year == "2009")
filter(.data = penguins, year %in% c("2008", "2009"))

#Penguins that are not from the Island Dream
filter(.data = penguins, island!= "Dream")

#Penguins in the species Adelie and Gentoo
filter(.data = penguins, species == "Adelie" | species == "Gentoo")
filter(.data = penguins, species %in% c("Adelie", "Gentoo"))


########## Mutate is how you add columns

data2 <- mutate(.data = penguins,
                body_mass_kg = body_mass_g/1000)
view(data2)

data2<- mutate(.data = penguins,
               after_2008 = ifelse(year>2008,
                                   "After 2008"
                                   ,
                                   "Before 2008"))
View(data2)
# or you can use case_when

#############Mutate Thinking 
# Create a new column to add flipper length and body mass together
data_flipperlength_bodymass_combined <- mutate(.data = penguins,
                                        FLength_BMass = flipper_length_mm + body_mass_g) #adding flipper length
view(data_flipperlength_bodymass_combined)
# it worked

# 2. use mutate and ifelse to create a new column where body mass greater than 
    # 4000 is labeled as big and everything is small.
data3 <- mutate(.data = penguins, 
                body_mass_greater_than_4000 = ifelse(body_mass_g > 4000, "Greater than 4000", "Less than 4000"))
view(data3)
############################ %>% 
penguins %>% # use penguin dataframe
  filter(sex == "female") %>% #select females
  mutate(log_mass = log(body_mass_g)) %>%
  select(species, island, sex, log_mass) #select can be used to select columns to remain in data frame

####################### summarize - not adding a new colmn, taking data and squishing it
penguins %>%
  summarise(mean_flipper = mean(flipper_length_mm, na.rm=TRUE))

#######################group by
data <- penguins %>%
           group_by(island) %>%
         summarise(mean_flipper = mean(flipper_length_mm, na.rm=TRUE))

penguins %>%
  group_by(island, species) %>%
  summarise(mean_flipper = mean(flipper_length_mm, na.rm=TRUE))

####################### REMOVE NAs
penguins %>%
    drop_na(sex)
penguins %>%
  drop_na(flipper_length_mm)

penguins %>%
  drop_na(sex) %>%
  ggplot(aes(x = sex, y = flipper_length_mm)) +
  geom_boxplot()

#########################
# calculates the mean and variance of body mass by species, island, and sex without
# any NAs

penguins %>%
    drop_na(species, island, sex)
    summarise(mean_species)

    #Box plot of logged body mass of female populations grouped by islands.
    penguins %>%
      drop_na(sex) %>%
      ggplot(aes(x = island, #Assign the x and y values
                 y = log(body_mass_g))) +
      geom_boxplot() + #this will create box plot
      labs(x= "Island", y="Logged Body Mass (g)", title = "Body Mass of Female Penguins Amoung Islands") +
      theme_bw() +
      theme(axis.title = element_text (size = 10), panel.background = element_rect(fill = "lightgray"))
    