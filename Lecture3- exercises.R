library(tidyverse)
#Exercise 1
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
lotr_untidy

#Exercise 
female<-read_csv((file.path("data", "Female.csv")))
male<-read_csv((file.path("data", "Male.csv")))
FM_untidy<- bind_rows(female,male)
str(FM_untidy)
#Writing the new tabe to data
write_csv(FM_untidy, path = file.path("data", "FM_untidy.csv"))

FM_tidy <-
  gather(FM_untidy, key = 'Race', value = 'Words', Elf, Hobbit, Man)
FM_tidy
#writing the tidy dataset
write_csv(FM_tidy, path = file.path("data", "FM_tidy.csv"))
FM_tidy

#Total number of words spoken

#Sums the number of words spoken across the different races 
#FM_untidy
colSums(FM_untidy[,c("Elf", "Hobbit", "Man")])
#lotr_untidy 

z <- summarize(group_by(lotr_untidy, Race), 
               Sum1 = sum(Female, na.rm = TRUE),
               Sum2 = sum(Male, na.rm = TRUE),
               )
#lotr_tidy
lotr_tidy %>% 
  count( Race, wt = Words)

#Part2 - Spreading the data
#Spread across race
lotr_tidy %>% 
  spread(key = Race, value = Words)
#Spread across gender
lotr_tidy %>% 
  spread(key = Gender, value = Words)
# practicing with spread ... and unite: let's get one variable per combo of Race and Gender
lotr_tidy %>% 
  unite(Race_Gender, Race, Gender) %>% 
  spread(key = Race_Gender, value = Words)
#Exercise 3

lotr_untidy_pivot<-lotr_tidy %>%
pivot_wider(names_from = c(Race, Gender), values_from = Words)

write_csv(lotr_untidy_pivot, path = file.path("data", "lotr_untidy_pivot.csv"))
