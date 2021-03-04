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

get_mass_from_length(26, 214.44, 1.46)
