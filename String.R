library(stringr)
install.packages("gapminder")
gDat <- gapminder::gapminder
str(gDat)

#Exercise 1
grep( "ee", levels(gDat$country), value = TRUE)

#Exercise 2
my_flies<-dir()
grep( ".R", my_flies, value = TRUE)
