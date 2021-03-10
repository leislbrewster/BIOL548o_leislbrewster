#This function reads the file into R
fish_data<- read.csv("Gaeta_etal_CLC_data_1.csv")
library(dplyr)
fish_data_cat = fish_data %>% 
  mutate(length_cat = ifelse(length > 200, "big", "small"))
fish_data_cat = fish_data %>% 
  mutate(length_cat = ifelse(length > 300, "big", "small"))

fish_data = read.csv("data/Gaeta_etal_CLC_data.csv")
