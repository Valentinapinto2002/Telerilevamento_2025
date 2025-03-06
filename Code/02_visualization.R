# R code for visualizing satellite data
install.packages("devtools")
library(devtools)

#installing viridis package
install.packages("viridis")
library(viridis)

install_github("ducciorocchini/imageRy") #posso usarla solo se ho installato devtools #installo il pacchetto imageRy da ducciorocchini
#fai invio non aggiornare

library(terra)
library(imageRy)

# Listing data inside imageRy
im.list()

# Sentinel-2 bands
# https://gisgeography.com/sentinel-2-bands-combinations/

# importing the data
# from now on we will use "=" instead of "<-"

#importing band b2 (blue)
b2 = im.import("sentinel.dolomites.b2.tif")

cl = colorRampPalette(c("black", "grey", "light grey")) (100) #estende una palette ai colori, li decidiamo noi
plot(b2, col=cl)

# Exercise:make your own color palette !!! mai fare sia con verde che rosso che blu, i daltonici non la vedono
c2= colorRampPalette(c("red", "orange", "yellow")) (100)
plot(b2, col=c2)

#importing b3 band (green)
b3 = im.import("sentinel.dolomites.b3.tif")

# Importing the red band
b4 = im.import("sentinel.dolomites.b4.tif")

# Importing the NIR band (near infra red)
b8 = im.import("sentinel.dolomites.b8.tif") 

# Multiframe (graph with more images inside) with different color palette
#if i want 1 row and 4 coloumn
par(mfrow=c(1,4))
plot(b2)
plot(b3)
plot(b4)
plot(b8)

#exercise: plot the bands using 1m.multiframe() one on top of the other
par(mfrow=c(4,1))
plot(b2)
plot(b3)
plot(b4)
plot(b8)

#creating a color palette and plotting the four images
cl=colorRampPalette(c("black","light grey"))(100)
plot(b2, col=cl)
plot(b3, col=cl)
plot(b4, col=cl)
plot(b8, col=cl)

# stack (a data package)
#now i have the 4 bands with their name on the image
sent = c(b2, b3, b4, b8)
plot(sent, col=cl)

# to change the names
names(sent)=c("b2_blue", "b3_green", "b4_red", "b8_NIR")
sent
plot(sent, col=cl) #now the images are black and white
plot(sent) #now the images are colored

# if i want to plot only the b8 band, i use $
plot(sent$b8_NIR)
# or i use [4] cause i know it is the fourth image
plot(sent[4])

#importing several bands altogether. I put the part of the name of the file that is common between all the images i want to import
sentdol=im.import("sentinel.dolomites")
#importing several sets altogether
pairs(sentdol)

#da qui serve aver richiamato il pacchetto viridis
#viridis colours https://cran.r-project.org/web/packages/viridis/vignettes/intro-to-viridis.html
plot(sentdol, col=viridis(100))
plot(sentdol, col=mako(100)) #mako è un'altra palette di colori
plot(sentdol, col=magma(100)) #magma è un'altra palette di colori



# Plotting one layer
dev.off()
plot(sentstack[[1]], col=cl)
plot(sentstack[[4]], col=cl)

# Multiframe with different color palette
par(mfrow=c(2,2))

clb = colorRampPalette(c("dark blue", "blue", "light blue")) (100)
plot(b2, col=clb)

# Exercise: apply the same concept to the green band (b3)
clg = colorRampPalette(c("dark green", "green", "light green")) (100)
plot(b3, col=clg)

# Plotting red band (b4)
clr = colorRampPalette(c("dark red", "red", "pink")) (100)
plot(b4, col=clr)

# Plotting the NIR band (b8)
cln = colorRampPalette(c("brown", "orange", "yellow")) (100)
plot(b8, col=cln)

# RGB plotting
# sentstack[[1]] blue
# sentstack[[2]] green
# sentstack[[3]] red
# sentstack[[4]] NIR
  
dev.off()
im.plotRGB(sentstack, r=3, g=2, b=1) # natural color image
im.plotRGB(sentstack, r=4, g=3, b=2) # false color image
im.plotRGB(sentstack, r=3, g=4, b=2) # false color image
im.plotRGB(sentstack, r=3, g=2, b=4) # false color image
