
#Question 2 to 4 - Data and Git Setup 

fish_data = read.csv("data/Gaeta_etal_CLC_data_1.csv")

library(dplyr)

# this code adds a column called length_cat, and if length is greater than 300, big is added in column, if not small is
fish_data_cat = fish_data %>%
  mutate(length_cat = ifelse(length > 300, "big", "small"))

#Filter out scalelengths less than 1
fish_data_cat_clean <- filter(fish_data_cat, scalelength > 1)

#Question 5 - Graph 
library(ggplot2)

#The color = lakeid argument is within the aes() because it is related to the data, not just a change in color aesthetically
ggplot(fish_data_cat_clean, aes(x = length, y = scalelength, color = lakeid)) +
  geom_point(size = 3)

#Bins changes how wide the columns are in the histogram 
ggplot(fish_data_cat, aes(x = scalelength, fill = length_cat)) +
  geom_histogram(bins=80)

ggsave("figures/scale_hist_by_length.jpg")
