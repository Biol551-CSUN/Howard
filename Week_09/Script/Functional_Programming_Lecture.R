# Load Packages
library(tidyverse)
library(palmerpenguins)
library(PNWColors)
#### create a df of random numbers
df <- tibble::tibble(
  a = rnorm(10), # draws 10 random values from a normal distribution
  b = rnorm(10),
  c = rnorm(10),
  d = rnorm(10)
)
head(df)

df<-df %>%
  mutate(a = (a-min(a, na.rm = TRUE))/(max(a, na.rm = TRUE)-min(a, na.rm = TRUE)),
         b = (b-min(a, na.rm = TRUE))/(max(b, na.rm = TRUE)-min(b, na.rm = TRUE)),
         c = (c-min(c, na.rm = TRUE))/(max(c, na.rm = TRUE)-min(c, na.rm = TRUE)),
         d = (d-min(d, na.rm = TRUE))/(max(d, na.rm = TRUE)-min(d, na.rm = TRUE)))


rescale01 <- function(x) {
  value<-(x-min(x, na.rm = TRUE))/(max(x, na.rm = TRUE)-min(x, na.rm = TRUE))
  return(value)
}
df %>%
  mutate(a = rescale01(a),
         b = rescale01(b),
         c = rescale01(c),
         d = rescale01(d))

# Do not call something 'my function'



# Step 1: Name the function
FtoC <- function(temp_F) {  #This is a mediocire name, FtoC is better
temp_C <- (temp_F - 32) * 5 / 9
return(temp_C)
} 

FtoC(212) # NOW WE HAVE AFULLY FUNCTIONING FUNCTION! WOO HOO. You can have a function
 # section in the script for general stuff

CtoK <- function(temp_C) {  # This is what the argument is
  temp_K <- (temp_C + 273.15)
  return(temp_K) # What value to you want to return
}

CtoK(0)

# Making plots into a function
# What do you think the arguments should be 
myplot <- function(data, x, y){

pal<-pnw_palette("Lake",3, type = "discrete") # my color palette, 3 means 3 colors
ggplot(data, aes(x = {{x}},
                 y = {{y}}, 
                 color = island))+
  geom_point()+
  geom_smooth(method = "lm")+ # add a linear model
  scale_color_manual("Island", values=pal)+   # use pretty colors and change the legend title
  theme_bw()
}

view(penguins)
myplot(data = penguins, x = body_mass_g, y = bill_length_mm)

# IF ELSE STATEMENTS

a <- 4
b <- 5

if (a > b) { # my question
  f <- 20 # if it is true give me answer 1
} else { # else give me answer 2
  f <- 10
}

f
