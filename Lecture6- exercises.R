library(stringr)
install.packages("gapminder")
gDat <- gapminder::gapminder
str(gDat)

#Exercise 1
grep( "ee", levels(gDat$country), value = TRUE)

#Exercise 2
my_flies<-dir()
grep( ".R$", my_flies, value = TRUE)


#Exercise 3
#my way
grep("[it]land$", levels(gDat$country), value = TRUE)

vec<-grep("[it]land$", levels(gDat$country), value = TRUE)



#Polina's way
grep("LAND", gsub("(.*[it].*)land$", "\\1LAND", levels(gDat$country), ignore.case = T), value = TRUE)
#Rachel's way
countries <- gsub("(.*[it].*)land$", "\\1LAND", levels(gDat$country), ignore.case = T)
grep("LAND", countries, value = TRUE)

#Exercise 4
gDat$continent

grep("o", levels(gDat$continent), value = TRUE, ignore.case = TRUE)
