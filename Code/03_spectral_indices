#code to calculate spectral indices from satellite images

library(imageRy)
library(terra)
library(viridis)

#per vedere le immagini che abbiamo a disposizione
im.list()

#immagine del 1992 dell'area di Mato Grosso
mato1992=im.import("matogrosso_l5_1992219_lrg.jpg")
#layers
#1 = NIR
#2 = red
#3 = green
im.plotRGB(mato1992, r=1, g=2, b=3)

#visto che l'immagine è sottosopra rispetto alla realtà uso flip
mato1992=flip(mato1992)
#rifaccio il plot, in rosso la vegetazione
im.plotRGB(mato1992, r=1, g=2, b=3) #ora è girata bene

#metto la banda NIR sulla componente verde
im.plotRGB(mato1992, r=2, g=1, b=3) #in rosa il suolo nudo
#metto la banda NIR sulla componente blu
im.plotRGB(mato1992, r=2, g=3, b=1) #in giallo il suolo nudo

#immagine del 2006 dell'area di Mato Grosso
mato2006=im.import("matogrosso_ast_2006209_lrg.jpg")

#visto che l'immagine è sottosopra rispetto alla realtà uso flip
mato2006=flip(mato2006)
#rifaccio il plot, in rosso la vegetazione
im.plotRGB(mato2006, r=1, g=2, b=3) #ora è girata bene

#metto le immagini del 1992 e del 2006 una accanto all'altra in un plot
im.multiframe(1,2)
im.plotRGB(mato1992, r=2, g=3, b=1, title="Mato Grosso 1992")
im.plotRGB(mato2006, r=2, g=3, b=1, title="Mato Grosso 2006")

#radiometruc resolution
plot(mato1992[[1]], col=inferno(100))
plot(mato2006[[1]], col=inferno(100))

#DVI (different dvegetation index) dà indice dello stato di salute delle piante
# una pianta in salute ha il massimo di riflettanza possibile nel NIR, minima nel rosso perche lo assorbe
#tree= NIR=255, red=0, DVI=NIR-red=255
# una pianta stressata, invece... riflette di meno nel NIR, assorbe meno rosso
#stressed tree= NIR=100, red=20, DVI=NIR-red= =80

# Diffrerent radiometric resolutions

# DVI 8 bit: range (0-255)
# maximum: NIR - red = 255 - 0 = 255
# minimum: NIR - red = 0 - 255 = -255

# DVI 4 bit: range (0-15)
# maximum: NIR - red = 15 - 0 = 15
# minimum: NIR - red = 0 - 15 = -15

# NDVI 8 bit: range (0-255)
# maximum: (NIR - red) / (NIR + red) = (255 - 0) / (255 + 0) = 1
# minimum: (NIR - red) / (NIR + red) = (0 - 255) / (0 + 255) = -1

# NDVI 4 bit: range (0-15)
# maximum: (NIR - red) / (NIR + red) = (15 - 0) / (15 + 0) = 1
# minimum: (NIR - red) / (NIR + red) = (0 - 15) / (0 + 15) = -1

# NDVI 3 bit: range (0-7)
# maximum: (NIR - red) / (NIR + red) = (7 - 0) / (7 + 0) = 1
# minimum: (NIR - red) / (NIR + red) = (0 - 7) / (0 + 7) = -1

ndvi1992 = (mato1992[[1]] - mato1992[[2]]) / (mato1992[[1]] + mato1992[[2]])
# ndvi1992 = dvi1992 / (mato1992[[1]] + mato1992[[2]])
plot(ndvi1992)

ndvi2006 = (mato2006[[1]] - mato2006[[2]]) / (mato2006[[1]] + mato2006[[2]])
# ndvi2006 = dvi2006 / (mato2006[[1]] + mato2006[[2]])
plot(ndvi2006)

# Functions from imageRy
dvi1992auto = im.dvi(mato1992, 1, 2)
dev.off()
plot(dvi1992auto)

dvi2006auto = im.dvi(mato2006, 1, 2)
dev.off()
plot(dvi2006auto)

ndvi1992auto = im.ndvi(mato1992, 1, 2)
dev.off()
plot(ndvi1992auto)

ndvi2006auto = im.ndvi(mato2006, 1, 2)
dev.off()
plot(ndvi2006auto)

im.multiframe(1,2)
plot(ndvi1992)
plot(ndvi1992auto)



