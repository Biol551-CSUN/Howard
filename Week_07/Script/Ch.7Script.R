#########
#Visualizing Maps Reading

###########

### Load Packages
library(maps)
library(ggplot2)

#### Load Data
us_states <- map("state")
head(us_states)
election$region <- tolower(election$state)
us_states_elec <- left_join(us_states, election)

### Visual Data
##Graph 1
p <- ggplot(data= us_states, #select the data
            mapping= aes(x = long,
                         y = lat,
                         group = group))
p + geom_polygon(fill="white",color=black) #use function

## Graph 2

p <- ggplot(data = us_states,
            aes(x = long, y = lat,
                group = group, fill = region))
p + geom_polygon(color = "gray90", size = 0.1)

## Graph 3
p <- ggplot(data = us_states,
            mapping = aes(x = long, 
                          y = lat,
                          group = group, 
                          fill = r
                          p + geom_polygon(color = "gray90", 
                                           size = 0.1) +
                            coord_map(projection = "albers", lat0 = 39, l
                                      guides(fill = FALSE)
                                      ## Graph 4
                                      p0 <- ggplot(data = us_states_elec,
                                                   mapping = aes(x = long, y = lat, gro
                                                                 p1 <- p0 + geom_polygon(color = "gray90", size =
                                                                                           coord_map(projection = "albers", lat0 = 39, l
                                                                                                     p1 + labs(title = "Trump vote") + theme_map() + l
                                                                                                     p2 <- p1 + scale_fill_gradient(low = "white", hig
                                                                                                                                    