library(tidyverse)
fship<-read_csv(file.path("data", "The_Fellowship_Of_The_Ring.csv"))
ttow <- read_csv(file.path("data", "The_Two_Towers.csv"))
rking <- read_csv(file.path("data", "The_Return_Of_The_King.csv"))
rking
lotr_untidy <- bind_rows(fship, ttow, rking)
str(lotr_untidy)
write_csv(lotr_untidy, path = file.path("data", "lotr_untidy.csv"))
lotr_tidy <-
  gather(lotr_untidy, key = 'Gender', value = 'Words', Female, Male)
lotr_tidy
lotr_tidy <-
  pivot_longer(lotr_untidy, cols=c(Female, Male), names_to = 'Gender', values_to = 'Words')
lotr_tidy <- arrange(lotr_tidy, Gender)
#writing the tidy table to the data file
write_csv(lotr_tidy, path = file.path("data", "lotr_tidy.csv"))
lotr_tidy
