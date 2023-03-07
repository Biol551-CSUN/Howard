# Introduction to Visualizing Maps with Ggplot
# Created by: Kristen Howard
# Created on: March, 7th, 2023

#####################################
#### Load Packages
library(here)
library(tidyverse)
library(ggplot2)
library(maps)
library(mapdata)
library(mapproj)
library(tmap) #for static & interactive maps
library(leaflet) # interactive html maps
library(ggmap) # Uses google maps API 
library(sf) # Great for actual spatial analysis

#### Load Data
popdata <- read_csv(here("Week_07","Data","CApopdata.csv"))
stars <- read_csv(here("Week_07","Data","stars.csv"))
head(popdata)
head(stars)
view(popdata)
view(stars)

world <- map_data("world") #Get data for entire world
head(world)
usa <- map_data("usa") # Get data for USA
head(usa)
italy <- map_data("italy")
head(italy)
states<-map_data("state")
head(states)
counties<-map_data("county")
head(counties)
h <- map_data("france")
head(h)
?map_data

# You need to filter the world data for the united kingdom
# Make a plot
#create a plot of the world
ggplot()+
  geom_polygon(data= world, #Change this with another country from map_data function
               aes(x=long,
                    y=lat,
                    group=group),
               color="grey")

#Now lets add a fill to the same graph
ggplot()+
  geom_polygon(data= world, #Change this with another country from map_data function
               aes(x=long,
                   y=lat,
                   group=group,
                   fill=region),
               color="purple") +
  guides(fill=FALSE) +
  theme_minimal() +
  theme(panel.background = element_rect(fill = "lightblue")) #This creates blue background
# Now lets add more
ggplot()+
  geom_polygon(data = world, 
               aes(x = long, 
                   y = lat, 
                   group = group,
                   fill = region),
               color = "purple")+
  theme_minimal()+
  guides(fill = FALSE)+
  theme(panel.background = element_rect(fill = "lightblue"))+
  coord_map(projection = "sinusoidal",
            xlim = c(-180,180))

#Now let's make a map of california
CA_data<-states %>%
  filter(region == "california")
head(CA_data)
view(CA_data)
ggplot() +
  geom_polygon(data=CA_data,
               aes(x=long,
                   y=lat,
                   group=group),
 fill = "lightblue", #To change the fill and color, it needs to be outside of the aes
 color="darkblue")+
  theme_void() + #This gets rid of grid and x and y axis.
  guides(fill=FALSE)

#Now lets add multiple layers and plot the counties in CA
# Look at the county data
head(counties)[1:3,] # only showing the first 3 rows for space
head(popdata)

CApop_county<-popdata %>%
  select("subregion" = County, Population)  %>% # rename the county col
  inner_join(counties) %>%
  filter(region == "california") # some counties have same names in other states
head(CApop_county)

# Map of CA population by county
ggplot()+
  geom_polygon(data = CApop_county, 
               aes(x = long, 
                   y = lat, 
                   group = group,
                   fill = Population),
               color = "lightblue")+
  coord_map()+
  theme_void()+
  scale_fill_gradient(trans = "log10")
# Look at the stars dataset. This has the number of seastars per/m2 at 
# different sites in California.
ggplot()+
  geom_polygon(data = CApop_county, 
               aes(x = long, 
                   y = lat, 
                   group = group,
                   fill = Population),  
               color = "black")+
  geom_point(data = stars, # add a point at all my sites 
             aes(x = location_long, 
                 y = ocation_lat,
                 color=""))+ 
  coord_map()+
  theme_void() +
  scale_fill_gradient(trans = "log10")+
  labs(size = "# stars/m2") 
ggsave(here("Week_07","output","CApop.pdf"))


k <- cats_uk %>%
  distinct(tag_id)
view(k)