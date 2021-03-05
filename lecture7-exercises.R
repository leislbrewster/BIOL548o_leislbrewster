#pounds to grams
lb_g_convert<-function(pounds){
  grams<- pounds*453.592
  return(grams)
}
lb_g_convert(8000)

#Exercise 2

#This code calculates the mass based on allometry in Seebacher 2001
get_mass_from_length_theropoda <- function(length){
  mass <- 0.73 * length ^ 3.63
  return(mass)
}
#mass of a Spinosaurus that is 16 m long based on its reassembled skeleton
get_mass_from_length_theropoda(16)


get_mass_from_length <- function(length, a, b){
  mass <- a * length ^ b
  return(mass)
}

get_mass_from_length(22, 214.44, 1.46)

#Exercise 2


get_mass_from_length_2 <- function(length, a = 39.9, b = 2.6){
  mass <- a * length ^ b
  return(mass)
}

get_mass_from_length_2(22)




#Exercise 4
get_mass_from_length_in_lb <- function(length, a, b){
  mass <- a * length ^ b
  mass_in_pounds<-mass*2.205
  return(mass_in_pounds)
}
get_mass_from_length_in_lb(12, 10.95, 2.64)
