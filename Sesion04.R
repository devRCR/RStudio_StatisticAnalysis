#********** GRAFICOS EN R *************
#* session 04: 28/11/2022

# datos
x<-c(1,2,3,4,5)
y<-c(200,300,600,700,500)

# ver gráficos como vector
# ?plot
plot(x,y,type = "l")

# data frame
plot(data.frame(x,y),type = "l",col="green")

# formula
plot(y~x,type="l",col="blue",lwd=5)


# mostrar 3 graficos en 1
par(mfrow=c(1,3))
plot(x,y,type="s", main="Tipo S")
plot(x,y,type="b", main="Tipo b")
plot(x,y,type="o", main="Tipo o")

par(mfrow=c(1,1)) # regresar modo 1 gráfico en 1 área
plot(x,y,type="l",col="red")

points(x,y,
       pch=21,      # símbolo
       cex=2,       # tamaño punto
       bg="green",  # color fondo símbolo
       lwd=3)       # ancho borde símbolo

etiquetas<-c("Text1","Text2","Text3","Text4","Text5")
plot(x,y,type="l",
     xlim=c(0,6),
     ylim=c(0,750))
text(x=x,y=y,etiquetas,col="blue")

x<-c(rep("Facebook",40),rep("Instagram",35),
     rep("Youtube",60),rep("Twitter",45))
#plot(x) # no acepta al vector

datos<-as.factor(x)

plot(datos,
     main="Tendencias Internet 2022",
     xlab="Aplicaciones",
     ylab="Encuestados",
     #col=rainbow(4), # inglés, hexadecimales
     col=c("azure","green","bisque1","blue"),
     ylim=c(0,65))

# colores en R
head(colors(),20)

datos<-iris # Dataset de botánica
install.packages("dplyr")
library(dplyr)
plot(select(iris,1:2),
     main="Relación entre Longitud y Ancho de Sépalo",
     xlab="Longitud Sépalo",
     ylab="Ancho Sépalo",
     col=iris$Species,
     pch=20,
     cex=1.5,
     panel.first=grid(15,6))

legend("topright",legend=c("setosa","versicolor","virginica"),
       pch=20,col=c(1,2,3))

# Dividir gráfico en 4
par(mfrow=c(2,2))
plot(iris$Sepal.Length,
     main="Longitud Sépalo",type="l")
plot(iris$Sepal.Width,
     main="Ancho Sépalo",type="b")
plot(iris$Petal.Length,
     main="Longitud Pépalo",type="c")
plot(iris$Petal.Width,
     main="Ancho Pépalo",type="h")

par(mfrow=c(1,1)) # regresar modo 1 gráfico en 1 área


datos<-InsectSprays
plot(datos$spray,datos$count)

# Cambiar Dirección de caja de bigotes
plot(datos$spray,datos$count, horizontal=T)

# Gráfico correlacion
plot(select(iris,1:4),col=iris$Species)

datos<-chickwts
table(chickwts$feed)

b<-barplot(table(chickwts$feed),
           main="")


barplot(GNP ~ Year, data= longley)
barplot(cbind(Employed, Unemployed) ~ Year, data=longley)

url<-"http://bit.ly/Database-tsv1"
datos<-read.delim(url)
table(datos$Sexo,datos$Fuma)

# Gráfico barras apiladas
barplot(table(datos$Fuma,datos$Sexo),
        ylim=c(0,250),
        main="Cantidad Fumadores x Sexo",
        col=c("red","blue"),
        legend=row.names(table(datos$Fuma)))

barplot(table(datos$Sexo,datos$Fuma),
        ylim=c(0,250),
        main="Cantidad Fumadores x Sexo",
        col=c("red","blue"),
        legend=row.names(table(datos$Sexo)))

# Gráfico barras agrupadas
barplot(table(datos$Fuma,datos$Sexo),
        ylim=c(0,120),
        main="Cantidad Fumadores x Sexo",
        col=c("red","blue"),
        legend=row.names(table(datos$Fuma)),
        beside=T)


data(mtcars)
attach(mtcars)

(tabla<-table(cyl))

par(mfrow=c(1,2))
# frecuencia absoluta
barplot(tabla, main="Frecuencia Absoluta", col=rainbow(3))
# frecuencia relativa
barplot(prop.table(tabla)*100, main="Frecuencia Relativa",
        col=rainbow(3))

par(mfrow=c(1,1))
b<-barplot(tabla,main="Frecuencia Absoluta", col=rainbow(3),
           ylim=c(0,16))
text(b,tabla+0.5,labels=tabla)


b<-barplot(tabla,main="Frecuencia Absoluta", 
           col=c("aquamarine2","bisque1","antiquewhite"),
           ylim=c(0,16))
text(b,tabla+0.5,labels=tabla)


datos<-women
boxplot(datos$weight,
        main="Peso Mujeres",
        col="yellow",
        border="blue",
        ylab="cantidad",
        xlab="peso")

boxplot()



install.packages("plotrix")
library(plotrix)

datos<-c(65,35)
pie3D(datos)

pie3D(datos,labels=datos,explode = 0.25)
pie3D(datos,labels=datos,col=2:3, labelcol = "red",
      border="white")


url<-"http://bit.ly/Database-tsv1"
datos<-read.delim(url)

par(mfrow=c(1,2))

#frecuencia absoluta
hist(datos$Puntaje,breaks=5, col=rainbow(10))

#frecuencia relativa
hist(datos$Puntaje,freq=F,breaks=5, col=rainbow(10))

par(mfrow=c(1,1))


install.packages("ggplot2")
library(ggplot2)
# gráfico de barras
ggplot(datos,aes(x=Sexo))+geom_bar()

barra<-ggplot(datos, aes(x=Sexo))

ggplot(iris,aes(x=iris$Sepal.Length,fill=iris$Species))+geom_histogram()

ggplot(data=mtcars)+geom_boxplot(aes(x=factor(am),y=mpg))
ggplot(data=mtcars)+geom_boxplot(aes(x=factor(am),y=mpg))+coord_flip()
ggplot(data=mtcars)+geom_point(aes(mpg,qsec,colour=factor(am)))+
  facet_grid(~vs)+theme_light()