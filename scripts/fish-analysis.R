
fish_data = read.csv("data/Gaeta_etal_CLC_data_1.csv")

library(dplyr)

# this code adds a column called length_cat, and if length is greater than 300, big is added in column, if not small is

fish_data_cat = fish_data %>%
  mutate(length_cat = ifelse(length > 300, "big", "small"))

fich_data_cat_clean <- filter(fish_data_cat, scalelength > 1)
