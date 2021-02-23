library(tidyverse)
surveys <- read_csv("data/surveys.csv")
#selects particular colums 
select(surveys, year, month, day)
select(surveys, month, day, year)
#filters according to a particular criteria
filter(surveys, species_id == "DS")
#changes the values in the columns 
mutate(surveys, hindfoot_length_cm = hindfoot_length / 10)
surveys_plus <- mutate(surveys,
                       hindfoot_length_cm = hindfoot_length / 10)

#Excercise 1
shrub <- read_csv("data/shrub-volume-data.csv")
str(shrub)
#selecting particular columns 
select(shrub, length)
select(shrub, site, experiment)
#filter for all of the plants with heights greater than 5
filter(shrub, height > 5)
#adding new column containing the volumes
shrub_data_w_vols<- mutate (shrub,
                            volume=length*width*height)
