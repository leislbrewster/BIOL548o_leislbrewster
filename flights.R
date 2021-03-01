install.packages("nycflights13")
library(nycflights13)
library(tidyverse)
library(RColorBrewer)
library(visreg)
airports
airlines
flights
weather
planes

flights2 <- flights %>% 
  select(year:day, hour, origin, dest, tailnum, carrier)

flights <- flights
#drawing the map
#average delays
flights_delay<- flights %>%
  group_by(dest) %>%
  summarise(average_delay = mean (arr_delay,na.rm = TRUE))

flight_delays_airports<-airports %>% 
  right_join(flights_delay, c("faa" = "dest")) %>%
ggplot(aes(lon, lat)) +
  borders("state") +
  geom_point(aes(color = average_delay)) +
  scale_colour_gradient(low = "steelblue", high = "yellow")+
  coord_quickmap()
  



flight_delays_airports



#Number 2




#group by  destination and then summarise to get the mean
  
#flights2 <- flights %>% select(year:day, hour, origin, dest, tailnum, carrier)


flights2 <- flights %>% 
  select(year:day, hour, origin, dest, tailnum, carrier)


flights3<-airports %>% 
  select(faa, lat, lon ) %>%
  left_join(flights2, c("faa" = "dest"))


flights3<-flights3 %>%
  rename(c(dest = faa, dest_lat = lat, dest_lon = lon))%>%
  na.omit()


flights4<-airports %>% 
  select(faa, lat, lon ) %>%
  left_join(flights3, c("faa" = "origin"))

flights4<-flights4 %>%
  rename(c(origin = faa, or_lat = lat, or_lon = lon))%>%
  na.omit()
#number3

flight_age<-flights %>%
  left_join(planes, by = "tailnum")%>%
  rename(plane_year = year.y)



mod1<-lm(arr_delay~plane_year, data = flight_age)
summary(mod1)

flight_age %>%
  ggplot(aes(plane_year, arr_delay))+
  geom_point(aes(colour = "red"))+
  geom_abline(intercept = -241.14561, slope = 0.12400)+
  labs(x = "Plane Year", y = "Arival Delay")

visreg(mod1)

