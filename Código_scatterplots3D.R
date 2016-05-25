##Carga de datos
setwd("C:/Users/nacho/Desktop/Estadística/R/R studio")
Datalab = read.table("Test data aumentado.txt", header=TRUE, row.names=1)

## Densidad con las variables originales
library(ggplot2)
ggplot(Datalab,
       aes(y = MSLD, x = ND)) +
 geom_point(position = "jitter")

##Creación de scatterplot 3d

library(scatterplot3d)

attach(Datalab)
Datalab$pcolor[Datalab$D==1] <- "blue"  ## Color asociaciado a predicción 
Datalab$pcolor[Datalab$D==0] <- "red"

scatterplot3d(MSLD,ND,LA,color=pcolor,main="3D Scatterplot",
              pch=19 ## Símbolo del dato 
              )

##Creación de scatterplot 3d girable

library(rgl)

## Solo se puede dar diferentes colores dividiendo los datos y añadiendo los puntos en dos pasos

Datalab0 <- Datalab$D > 0.5 ## Lista  de casos si donan
Datalab1 <- Datalab[!Datalab0,] ## Tabla con los casos en que no se dona
Datalab2 <- Datalab[Datalab0,] ## Tabla con los casos en que si se dona

attach(Datalab1)
plot3d(MSLD,ND,LA,
       col="red", ## Color del dato
       size=5, ## Tamaño
       type="p", ## Símbolo del dato
       add=FALSE ## Añadir los puntos al anterior gráfico
       )

attach(Datalab2)
plot3d(MSLD,ND,LA,
       col="blue", ## Color del dato
       size=5, ## Tamaño
       type="p", ## Símbolo del dato
       add=TRUE ## Añadir los puntos al anterior gráfico
)


## 

