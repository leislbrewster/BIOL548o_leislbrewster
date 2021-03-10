w <- 10.2
x <- 1.3
y <- 2.8
z <- 17.5
colors <- c("red", "blue", "green")
masses <- c(45.2, 36.1, 27.8, 81.6, 42.4)
dna1 <- "attattaggaccaca"
dna2 <- "attattaggaacaca"

#Exercise1
w >10

"green" %in% colors

x>y

masses>40

#Exercise 2

age_class = "sapling"
if (age_class =="sapling"){
  y<-10
}
y

#Exercise 3

age_class <- "seedling"
if (age_class =="sapling"){
  y<-10
}else{
  y<-5
}
y

age_class <- "adult"
if (age_class =="sapling"){
  y<-10
}else if (age_class=="seedling"){
  y<-5
}else{
  y<-0
}
y

#Exercise 4
get_mass_from_length_by_name<- function(length, name){
  if (name =="Stegosauria"){
    a<-10.95
    b<-2.64
  }else if(name=="Theropoda"){
    a<-0.73
    b<-3.63
  }else if(name=="Sauropoda"){
    a<-214.44
    b<-1.46
  }else{
    a<-NA
    b<-NA
  }
  mass<-a * length ^ b
  print(mass)

}

get_mass_from_length_by_name(10, "Stegosauria")

get_mass_from_length_by_name(8, "Theropoda")

get_mass_from_length_by_name(12, "Sauropoda")

get_mass_from_length_by_name(13, "Ankylosauria")


#Exerccise 5
for (i in 2:16){
  print(i)
}

for (i in 1:5){
  times3<-i*3
  print(times3)
}

birds = c('robin', 'woodpecker', 'blue jay', 'sparrow')
for (i in 1:length(birds)){
  print(birds[i])
}


radius <- c(1.3, 2.1, 3.5)
areas <- vector( mode= "numeric", length = 3)
for (i in 1:length(radius)){
  areas[i] <- pi * radius[i] ^ 2
}
areas


lengths = c(1.1, 2.2, 1.6)
widths = c(3.5, 2.4, 2.8)
areas <- vector(length = 3)
for (i in 1: length(widths)) {
  areas[i] <- lengths[i] * widths[i]
}
areas
