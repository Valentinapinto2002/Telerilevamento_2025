# R code for multitemporal analysis

library(terra)
library(imageRy)
library(viridis)

im.list()
EN_01= im.import("EN_01.png")
#uso flip visto che è capovolta
EN_01= flip(EN_01)
plot(EN_01)
#in basso a destra si vede in che periodo dell'anno è stata scattata l'immagine

EN_13= im.import("EN_13.png")
#uso flip visto che è capovolta
EN_13= flip(EN_13)
plot(EN_13)

im.multiframe(1,2)
plot(EN_01)
plot(EN_13)

#per vedere la differenza tra le due immagini, abbiamo preso il primo livello per ognuna delle due immagini
ENdif=EN_01[[1]]-EN_13[[1]]
plot(ENdif)

#ora serve il pacchetto viridis, per cambiare il colore dell'immagine appena prodotta
plot(ENdif, col=inferno(100))


#-----altro esercizio
Greenland ice melt

#in queste 4 immagini in giallo sono le temperature maggiori, in blu quelle minori. Il blu va a diminuire con l'avanzare degli anni
#gr è un'immagine composta da 4 strati, ogni immagine è un livello di gr
gr=im.import("greenland")
#prendo i singoli strati e li sottraggo
grdif=gr[[1]]-gr[[4]] #2000-2015
plot(grdif)
#dove avevamo temperature più basse nel 2000 è giallo, dove le temerature sono più alte nel 2000 è blu

#al contrario
grdif=gr[[1]]-gr[[4]] #2015-2000
plot(grdif)
#dove avevamo temperature più basse nel 2000 è blu, dove le temerature sono più alte nel 2000 è giallo

#esportiamo le immagini da R
setwd("C:/Users/pinto/OneDrive/Immagini")
#funzione pdf per salvare file pdf, tra virgolette dico il nome che voglio dargli
pdf("output.pdf")
plot(grdif)
dev.off()
#funzione jpeg
jpeg("output.jpeg")
plot(grdif)
dev.off()
