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
#Basic aggregation
group_by(surveys, species_id)
surveys_by_species <- group_by(surveys, species_id)

summarize(surveys_by_species, abundance = n())

surveys_by_species_plot <- group_by(surveys, species_id, plot_id)
summarize(surveys_by_species, abundance = n())
species_weight <- summarize(surveys_by_species_plot, avg_weight = mean(weight))
#removes NAs
species_weight <- summarize(surveys_by_species,
                            avg_weight = mean(weight, na.rm = TRUE))

species_weignt_na_omit<-na.omit(species_weight)

#
ds_data <- filter(surveys, species_id == "DS")
ds_data_by_year <- group_by(ds_data, year)
ds_weight_by_year <- summarize(ds_data_by_year,
                               avg_weight = mean(weight, na.rm = TRUE))


#Excercise 2
survey_new<-select(surveys, year, month, day, species_id)
#creating a new data frame with the year, species_id, and weight in kilograms of each individual, with no null weights
survey_weight<-select(surveys, year, species_id, weight)
survey_weight<-mutate(survey_weight,
                      weight(kg)= weight/1000)
survey_weight<-na.omit(survey_weight)

survey_weight_SH<-filter()

#Help from Gaurav
surveys_kg <- mutate(surveys, weight_kg = weight/1000)
surveys_kg <- na.omit(surveys_kg)
surveys_kg <- select(surveys_kg, year, species_id, weight_kg)

surveys_speciesID_year <- group_by(surveys, species_id, year)
surveys_speciesID_year <- summarize(surveys_speciesID_year, abundance = n())
