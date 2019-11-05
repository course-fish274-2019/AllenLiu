
#Question 2 to 4 - Data and Git Setup 

fish_data = read.csv("data/Gaeta_etal_CLC_data_1.csv")

library(dplyr)

# this code adds a column called length_cat, and if length is greater than 300, big is added in column, if not small is

fish_data_cat = fish_data %>%
  mutate(length_cat = ifelse(length > 300, "big", "small"))

fish_data_cat_clean <- filter(fish_data_cat, scalelength > 1)

#Question 5 - Graph 
library(ggplot2)

ggplot(fish_data_cat_clean, aes(x = length, y = scalelength, color = lakeid)) +
  geom_point(size = 3)


ggplot(fish_data_cat, aes(x = scalelength, fill = length_cat)) +
  geom_histogram()
