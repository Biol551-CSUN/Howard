

# Load libraries
library(tidyverse)
library(here)

print(paste("The year is", 2000))

years <- c(1999:2021)

for ( i in years){ # The i can be anything
  print(paste("the year is", i))
}


# Here is how you can tell R where it is going to be saved

#Pre-allocate space for the for loop
# empty matrix
year_data<-data.frame(matrix(ncol = 2, nrow = length(years)))
# add column names
colnames(year_data)<-c("year", "year_name")
year_data

# One line at a time
# First add the column that us

for ( i in 1:length(years)){
  year_data$year_name[i] <- paste("The year is", years[i])
}

year_data

for (i in 1:length(years)){ # set up the for loop where i is the index
  year_data$year_name[i]<-paste("The year is", years[i]) # loop over year name
  year_data$year[i]<-years[i] # loop over year
}
year_data

# Read in data to practice a for loop
testdata<-read_csv(here("Week_12", "Data", "cond_data","011521_CT316_1pcal.csv"))
glimpse(testdata)

CondPath <- here("Week_12", "Data", "cond_data") # point to location on computer of folder

files <- dir(path = CondPath, pattern = ".csv") # dir stands for directory
files

cond_data <- data.frame(matrix(nrow = length(files), ncol = 3))

# Give the dataframe column names
colnames(cond_data) <- c("filename","mean_temp","mean_sal")
cond_data


#Write out basic code to calculate a mean and build out

# take out the slash, # go to the first file and it is a vector
raw_data<-read_csv(paste0(CondPath,"/",files[1])) # test by reading in the first file and see if it works
head(raw_data)

mean_temp<-mean(raw_data$Temperature, na.rm = TRUE) # cal
mean_temp

mean_sal<-mean(raw_data$Salinity, na.rm = TRUE) # cal
mean_sal


for (i in 1:length(files)){ # loop over 1:3 the number of files
  raw_data <- read_csv(paste0(CondPath,"/",files[i]))
}

for (i in 1:length(files)){ # loop over 1:3 the number of files 
  raw_data<-read_csv(paste0(CondPath,"/",files[i]))
  glimpse(raw_data)
}

1:10

1:10 %>% # a vector from 1 to 10 (we are going to do this 10 times) %>% # the vector to iterate over
  map(rnorm, n = 15) %>% # calculate 15 random numbers based on a normal distribution in a list
  map_dbl(mean) # calculate the mean. It is now a vector which is type "double"

1:10 %>% # list 1:10
  map(function(x) rnorm(15, x)) %>% # make your own function
  map_dbl(mean)

1:10 %>%
  map(~ rnorm(15, .x)) %>% # changes the arguments inside the function
  map_dbl(mean)


# point to the location on the computer of the folder
CondPath<-here("Week_12", "data", "cond_data")
files <- dir(path = CondPath,pattern = ".csv")
files

files <- dir(path = CondPath,pattern = ".csv", full.names = TRUE)
#save the entire path name
files


data<-files %>%
  set_names()%>% # set's the id of each list to the file name
  map_df(read_csv,.id = "filename") # map everything to a dataframe and put the id in a column called filename
data


data<-files %>%
  set_names()%>% # set's the id of each list to the file name
  map_df(read_csv,.id = "filename") %>% # map everything to a dataframe and put the id in a column called filename
  group_by(filename) %>%
  summarise(mean_temp = mean(Temperature, na.rm = TRUE),
            mean_sal = mean(Salinity,na.rm = TRUE))
data
