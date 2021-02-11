library(tidyverse)
fship<-read_csv(file.path("data", "The_Fellowship_Of_The_Ring.csv"))
ttow <- read_csv(file.path("data", "The_Two_Towers.csv"))
rking <- read_csv(file.path("data", "The_Return_Of_The_King.csv"))
rking
lotr_untidy <- bind_rows(fship, ttow, rking)
str(lotr_untidy)
write_csv(lotr_untidy, path = file.path("data", "lotr_untidy"))

