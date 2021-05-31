library(spatstat)
#clear the environment
rm(list=ls())

#Import the data
mydata = read.csv("Z.csv", header = TRUE)
set.seed(001)
mydata$latitude=sample(mydata$latitude)
mydata$longitude=sample(mydata$longitude)

mydata$buildingType <- as.factor(mydata$buildingType)

# Read minimum and maximum locations
min_longitude = min(mydata$longitude)
max_longitude = max(mydata$longitude)
min_latitude = min(mydata$latitude)
max_latitude = max(mydata$latitude)

#----- Task a: Analysis for overall patterns ------

myPattern <- ppp(mydata$longitude, mydata$latitude, marks = mydata$buildingType, c(min_longitude,max_longitude), c(min_latitude,max_latitude))
summary(myPattern)
plot(myPattern, main="Random Houses as Points")
plot(Kest(myPattern), main="K function for all Random Houses",
     xlab="Distance r",
     ylab="K(r)")
plot(envelope(myPattern,Kest), main="Envelope K function for all Random Houses",
     xlab="Distance r",
     ylab="K(r)")


#----- Task b: Analysis for Primary Building Patterns ------
unique(mydata$buildingType)
plot(Kcross(myPattern, "commercial_building", "commercial_building"), main="Clustering of Random Commercial Buildings",
     xlab="Distance r",
     ylab="K(r)")

plot(Kcross(myPattern, "collective_house", "collective_house"), main="Clustering of Random Collective Houses",
     xlab="Distance r",
     ylab="K(r)")


#----- Task c: Analysis for Different Building Patterns ------
unique(mydata$buildingType)
plot(Kcross(myPattern, "commercial_building", "collective_house"), main="Colocation of Random Commercial Buildings and Collective Houses",
     xlab="Distance r",
     ylab="K(r)")

plot(Kcross(myPattern, "commercial_building", "single_house"), main="Colocation of Random Commercial Buildings and Single Houses",
     xlab="Distance r",
     ylab="K(r)")

plot(Kcross(myPattern, "commercial_building", "garage"), main="Colocation of Random Commercial Buildings and Garages",
     xlab="Distance r",
     ylab="K(r)")

plot(Kcross(myPattern, "commercial_building", "light_building"), main="Colocation of Random Commercial Buildings and Light Buildings",
     xlab="Distance r",
     ylab="K(r)")

plot(Kcross(myPattern, "commercial_building", "school"), main="Colocation of Random Commercial Buildings and Schools",
     xlab="Distance r",
     ylab="K(r)")

plot(Kcross(myPattern, "collective_house", "single_house"), main="Colocation of Random Collective Houses and Single Houses",
     xlab="Distance r",
     ylab="K(r)")

plot(Kcross(myPattern, "collective_house", "garage"), main="Colocation of Random Collective Houses and Garages",
     xlab="Distance r",
     ylab="K(r)")

plot(Kcross(myPattern, "collective_house", "light_building"), main="Colocation of Random Collective Houses and Light Buildings",
     xlab="Distance r",
     ylab="K(r)")

plot(Kcross(myPattern, "collective_house", "school"), main="Colocation of Random Collective Houses and Schools",
     xlab="Distance r",
     ylab="K(r)")

