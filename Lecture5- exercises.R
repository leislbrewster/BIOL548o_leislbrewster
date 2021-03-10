install.packages("nycflights13")
library(nycflights13)
library(tidyverse)
library(RColorBrewer)
library(visreg)
airports
airlines
flights
weather
planes <- planes

flights2 <- flights %>% 
  select(year:day, hour, origin, dest, tailnum, carrier)

flights <- flights
#Number1


#average delays
flights_delay<- flights %>%
  group_by(dest) %>%
  summarise(average_delay = mean (arr_delay,na.rm = TRUE))

#drawing the map of average delays
flight_delays_airports<-airports %>% 
  right_join(flights_delay, c("faa" = "dest")) %>%
ggplot(aes(lon, lat)) +
  borders("state") +
  geom_point(aes(color = average_delay)) +
  scale_colour_gradient(low = "steelblue", high = "yellow")+
  coord_quickmap()
  

flight_delays_airports



#Number 2


#reducing the number of variables in flights to make th dataset more managable
flights2 <- flights %>% 
  select(year:day, hour, origin, dest, tailnum, carrier)


#adding the destination lat and lon
flights3<-airports %>% 
  select(faa, lat, lon ) %>%
  left_join(flights2, c("faa" = "dest"))

#removing obervations with NAs
flights3<-flights3 %>%
  rename(c(dest = faa, dest_lat = lat, dest_lon = lon))%>%
  na.omit()

#adding the origin lat and long 
flights4<-airports %>% 
  select(faa, lat, lon ) %>%
  left_join(flights3, c("faa" = "origin"))

#removing the obeservations with NAs
flights4<-flights4 %>%
  rename(c(origin = faa, or_lat = lat, or_lon = lon))%>%
  na.omit()
#number3

#joining planes to flights to get the manufacture year of each plane
flight_age<-flights %>%
  left_join(planes, by = "tailnum")%>%
  rename(plane_year = year.y)


#simple linear model to determine whether there is a relationship between plane age and the arival delays 
mod1<-lm(arr_delay~plane_year, data = flight_age)
summary(mod1)

#Scatter plot of the 2 variable 
flight_age %>%
  ggplot(aes(plane_year, arr_delay))+
  geom_point(aes(colour = "red"))+
  geom_abline(intercept = -241.14561, slope = 0.12400)+
  labs(x = "Plane Year", y = "Arival Delay")

#Determining model fit
visreg(mod1)

#Exercise 3
#filtering flights 

flights_100<- flights %>%
  filter(flight > 100)

#code given in the question 
flight_anti_join1<-anti_join(flights, airports, by = c("dest" = "faa"))

flight_anti_join2<-anti_join(airports, flights, by = c("faa" = "dest"))

airports %>% 
  anti_join( flights, by = c("faa" = "dest"))%>%
  count(faa, sort = TRUE)


#
flights %>%
mutate(tot_delay = arr_delay + dep_delay) %>%
  group_by(tailnum) %>%
  summarize(avg_delay = mean(tot_delay, na.rm = TRUE)) %>%
  left_join(select(planes, tailnum, year), by = "tailnum") %>%
  mutate(year = 2013 - year) %>%
  ggplot(aes(avg_delay, year)) +
  geom_point() +
  geom_smooth()

