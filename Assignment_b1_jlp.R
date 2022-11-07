library(palmerpenguins)
library(dplyr)
library(ggplot2)
library(gapminder)
library(tidyverse)
library(testthat)



islands
mean(islands) - median(islands)

mean_minus_median <- function(x, na.rm = FALSE, ...) {
  mean(x, na.rm = na.rm, ...) - median(x, na.rm = na.rm, ...)
}

mean_minus_median(islands)

penguins %>%
  group_by(species, year) %>%
  summarise(diff_mass = mean_minus_median(body_mass_g))



## my function attempt 1: DELTA.AVG ##
delta.avg <- function(x, na.rm = FALSE, ...) {
  x - mean(x, na.rm = na.rm, ...)
}


## my function attempt 2: quick_timeseries ##
quick_timeseries <- function(data, x, y) {
  ggplot(data, aes({{ x }}, {{ y }})) +
    geom_line() +
    geom_point()
}


## my function attempt 3: avg_var ##
avg_cols_group <- function(.data, y, na.rm = FALSE, ...) {
  .data %>%
    group_by({{y}}, {{...}}) %>% 
      summarise(across(where(is.numeric), mean, na.rm = TRUE))
}



avg_cols_group(.data = penguins, y = species, na.rm = TRUE)
avg_cols_group(.data = continent_ghg, y = Continent, na.rm = TRUE)



penguins %>% 
    group_by(species) %>% 
    summarise(across(where(is.numeric), mean, na.rm = TRUE)) 


#avg_var(data = penguins, y = species, na.rm = TRUE)
#avg_var(data = continent_ghg, y = Continent, na.rm = TRUE)

continent_ghg <- ghg_emissions %>%
  filter(Entity %in% c("Africa", "Asia", "Europe", "North America", "Oceania", "South America")) %>%
  mutate(Total = rowSums(across(c(-Entity, -Code, -Year)))) %>%
  rename(Continent = Entity) %>%
  select(Continent, Year, Total, everything(), -Code) 