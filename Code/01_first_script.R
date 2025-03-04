2+3

anna <- 2+3 #assign an operation to an object
chiara <- 4+6

anna+chiara

filippo <- c(0.2, 0.4, 0.6, 0.8, 0.9) #array
luca <- c(100,80,60,50,10) 

plot(luca,filippo)
plot(luca,filippo,pch=19) #metto il puntino pieno con pch=19
plot(luca,filippo,pch=19,col="blue") #rendo blu i puntini con col=blue
plot(luca,filippo,pch=19,col="blue",cex=2) #li faccio più grandi con cex=2
plot(luca,filippo,pch=19,col="blue",cex=2,xlab="rubbish",ylab="biomass") #rinomino la x con xlab e la y con ylab

#installo i pacchetti
#CRAN
install.packages("terra")
library(terra)

install.packages("devtools")
library(devtools)

install_github("ducciorocchini/imageRy") #posso usarla solo se ho installato devtools #installo il pacchetto imageRy da ducciorocchini
#fai invio non aggiornare
library(imageRy)




