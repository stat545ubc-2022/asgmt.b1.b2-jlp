library(palmerpenguins)
library(dplyr)
library(ggplot2)
library(gapminder)

penguins %>%
  group_by(species) %>% 
  summarise(across(where(is.numeric), mean, na.rm = TRUE)) 