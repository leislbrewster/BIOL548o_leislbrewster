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
write_csv(shrub_data_w_vols, path = file.path("data", "Shrub_volume.csv"))

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
#filter by species ID
survey_weight_SH<-filter(survey_weight, species_id=="SH")
#Getting abundance by grouping by ID and year
survey_ID<-group_by(surveys, species_id)
survey_ID<-summarise(survey_ID, abundance = n())

survey_ID_year<-group_by(surveys, species_id, year)
survey_ID_year<-summarise(survey_ID_year, abundance = n())

#DO species specific abundance
DO_survey<-filter(surveys, species_id=="DO")
DO_survey<-group_by(DO_survey, year)
DO_survey<-summarise(DO_survey,
                     mean_mass = mean(weight, na.rm = TRUE))
DO_survey<-na.omit(DO_survey)
write_csv(DO_survey, path = file.path("data", "DO_survey.csv"))

#pipes
x = c(1, 2, 3, NA)
mean(x, na.rm = TRUE)
x %>% mean(na.rm = TRUE)

surveys %>%
  filter(species_id == "DS", !is.na(weight))

ds_weight_by_year <- surveys %>%
  filter(species_id == "DS") %>%
  group_by(year) %>%
  summarize(avg_weight = mean(weight, na.rm = TRUE))

#Exercise 3

survey_ex3 <- surveys %>%
  mutate(weight_kg = weight/1000)%>%
  select(year, weight_kg, species_id)%>%
  na.omit()

survey_ex3_2<- surveys %>%
  filter(species_id == "SH") %>%
  select(year, month, day, species_id)

survey_ex3_3<- surveys %>%
  group_by(species_id)%>%
  summarise(abundance = n())

survey_ex3_4<- surveys %>%
  group_by(year, species_id)%>%
  summarise(abundance = n())

survey_ex3_5<- surveys %>%
  filter(species_id == "DO") %>%
  group_by(species_id, year) %>%
  summarise(abundance = n())

#Filtering under multiple condition
filter(surveys, species_id == "DS", year > 1995)
filter(surveys, species_id == "DS" & year > 1995)
filter(surveys, species_id == "DS" | species_id == "DM" | species_id == "DO")

#Filtering by aggregated value 
species_weights <- surveys %>%
  group_by(species) %>%
  filter(n() > 100) %>%
  summarize(avg_weight = mean(weight, na.rm = TRUE))