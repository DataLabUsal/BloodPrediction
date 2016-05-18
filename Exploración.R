#Exploración de datos

#Fijamos un directorio de trabajo
setwd("~/Documents/DataLab/BloodComp")

#Subimos a nuestro entorno ambas bases. Test y Training
Test_Data <- read.csv("~/Documents/DataLab/BloodComp/Test_Data.csv")
Training_Data <- read.csv("~/Documents/DataLab/BloodComp/Training_Data.csv")

#Exploramos ambas bases de datos y cambiamos los nombres de las bases de datos
class(Training_Data)
names(Training_Data) <- c('donante','ultima_don','n','vol','primera_don','dona_Marzo2007')
class(Test_Data) 
names(Test_Data) <- c('donante','ultima_don','n','vol','primera_don')

#Datos resumidos
summary(Training_Data)

#Comparamos ambas bases de datos (Boxplot)
boxplot(Training_Data[,c(2,3,5)],boxwex = 0.28, at = 1:3 - 0.2,col = "light blue",
        main = "Blood Donation",xlab = "", ylab = "", cex.axis=0.85, bty="n", xaxt="n",
        yaxt="n")
boxplot(Test_Data[,c(2,3,5)], add = TRUE,
        boxwex = 0.28, at = 1:3 + 0.2,
        col = "bisque", cex.axis=0.85, xaxt="n")
legend(1.5, 80, c("Train", "Test"),
       fill = c("light blue", "bisque"))
axis(1,side = 1, at=c(1,2,3),labels=c('Última Don','Número Don','Primera Don'),tick=FALSE)

#Gráficos de dispersión con outliers
Outliers <- list(ultima_don=Training_Data[Training_Data$ultima_don>30,],n=Training_Data[Training_Data$n>30,])
Training <- Training_Data[Training_Data$ultima_don<=30 & Training_Data$n<=30,]

plot(Training$ultima_don,Training$n,xlab = "Última Don", ylab = "Número Don",ylim=c(0,50),xlim=c(0,70),pch=16)
points(Outliers$ultima_don,Outliers$n,col='red',pch=16)

#Medida de la correlación
M <- cor(Training[,c(2,3,5)])
colnames(M) <- c('ult_don','n','pri_don')
library(corrplot)
corrplot.mixed(M, lower="number", upper="color")
