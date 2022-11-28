#datos
x<-c(1,2,3,4,5)
y<-c(200,300,600,700,500)

#ver grafico como vector
plot(x,y,type="l",col="red")

#data frame
plot(data.frame(x,y),type="l",col="green")

#formula
plot(y~x,type="l",col="blue",lwd=5)

?plot
#mostrar 3 graficos en 1
par(mfrow=c(1,3))
plot(x,y,type="s", main="Tipo S")
plot(x,y,type="b",main="Tipo b")
plot(x,y,type="o",main="Tipo o")

#regresar modo 1 grafico en 1 area
par(mfrow=c(1,1))
plot(x,y,type="l",col="red")
points(x,y,
       pch=21,#simbolo
       cex=2,#tamaño punto
       bg="green",#color fondo simbolo
       lwd=3)#ancho borde simbolo




etiquetas<-c("Text1","Text2","Text3","Text4","Text5")
plot(x,y,type="l",
     xlim=c(0,6),
     ylim=c(0,750))
text(x=x,y=y,etiquetas,col="blue")



x<-c(rep("Facebook",40),rep("Instagram",35),
     rep("Youtube",60),rep("Twiter",45))
plot(x)#no acepta al vector

datos<-as.factor(x)

plot(datos)


plot(datos,
     main="Tendencias Internet 2022",
     xlab="Aplicaciones",
     ylab="Encuestados",
    # col=rainbow(4),#ingles, hexadecimales
    #col=c(1,4,3,2),
    col=c("yellow","green","orange","blue"),
      ylim=c(0,65))

#colores en r
head(colors(),20)


datos<-iris 
install.packages("dplyr")
library(dplyr)
plot(iris$Sepal.Length,iris$Sepal.Width,
     main="Relacion entre Longitud y Ancho de Sepalo",
     xlab="Longitud Sepalo",
     ylab="ancho Sepalo",
     col=iris$Species,
     pch=20,
     cex=1.5,
     panel.first=grid(15,6) )
     
legend("topright",legend=c("Setosa","Versicolor",
      "Virginica"),pch=20,col=c(1,2,3))     



#dividir grafico en 4
par(mfrow=c(2,2))
plot(iris$Sepal.Length,
     main="Longitud Sepalo",type="l")
plot(iris$Sepal.Width,
     main="Ancho Sepalo",type="b")
plot(iris$Petal.Length,
     main="Longitud Petalo",type="c")
plot(iris$Petal.Width,
     main="Ancho Petalo",type="h")



par(mfrow=c(1,1))
datos<-InsectSprays
plot(datos$spray,datos$count)

#cambiar direccion de caja de bigotes
plot(datos$spray,datos$count, horizontal=T)

#grafico correlacion
plot(select(iris,1:4),col=iris$Species)


datos<-chickwts
table(chickwts$feed)

b<-barplot(table(chickwts$feed),
           main="Resultado de Alimento Pollo",
           col=rainbow(10),
           #xlab="Tipo Comida",
           ylab="Cantidad",
           ylim=c(0,16),
           las=2, #orientacion de nombre x
           font.axis=2)
text(b,2,table(chickwts$feed),pos=3)#2 altura de lo valores
#pos=3 centrado

?barplot
barplot(GNP ~ Year, data = longley)
barplot(cbind(Employed, Unemployed) ~ Year, data = longley)





url<-"http://bit.ly/Database-tsv1"
datos<-read.delim(url)
table(datos$Sexo,datos$Fuma)

#grafico barras apilados
barplot(table(datos$Sexo,datos$Fuma),
        ylim=c(0,250),
        main="Cantidad Fumadores x Sexo",
        col=c("red","blue"),
        legend=row.names(table(datos$Sexo)))



barplot(table(datos$Fuma,datos$Sexo),
        ylim=c(0,250),
        main="Cantidad Fumadores x Sexo",
        col=c("red","blue"),
        legend=row.names(table(datos$Fuma)))


#grafico barras agrupads
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
#frecuencia absoluta
barplot(tabla,main="Frecuencia Absoluta", col=rainbow(3))
#frecuencia relativa
barplot(prop.table(tabla)*100,main="Frecuencia Relativa",
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


boxplot(datos$weight,
        main="Peso Mujeres",
        col="yellow",
        border="blue",
        ylab="cantidad",
        xlab="peso",horizontal=T)

boxplot(chickwts$weight ~ chickwts$feed)

boxplot(chickwts$weight ~ chickwts$feed,
        col=rainbow(6))



medianas<-reorder(chickwts$feed,chickwts$weight,median)
boxplot(chickwts$weight~medianas,
        las=2, border=rainbow(6))


tabla<-prop.table(table(iris$Species))
pie(tabla,
    main="Distribucion de Tipo de Flor",
    labels=paste(names(tabla),round(tabla*100,2),"%"))


install.packages("lessR")
library(lessR)
genero<-factor(c(rep("Masculino",10),
                 rep("Femenino",24)))
genero

genero<-data.frame(gen=genero)
PieChart(gen,hole=0,values="%",data=genero,
         fill=c("blue","red"),main="Genero")

PieChart(gen,hole=0.3,values="%",data=genero,
         fill=c("blue","red"),main="Genero")

PieChart(gen,hole=0.5,values="%",data=genero,
         fill=c("blue","red"),main="Genero")


install.packages("plotrix")
library(plotrix)
datos<-c(65,35)
pie3D(datos)

pie3D(datos,labels=datos,explode=0.25)

pie3D(datos,labels=datos,col=2:3, labelcol="red",
      border="white")



url<-"http://bit.ly/Database-tsv1"
datos<-read.delim(url)


par(mfrow=c(1,2))
#frecuencia absoluta
hist(datos$Puntaje,breaks=5,col=rainbow(10))

#frecuencia relativa
hist(datos$Puntaje,freq=F,breaks=5,col=rainbow(10))


par(mfrow=c(1,1))




library(ggplot2)
#grafico de barras
ggplot(datos,aes(x=Sexo))+geom_bar()


barra<-ggplot(datos,aes(x=Sexo))+
  geom_bar(width=0.7,colour="yellow",fill="brown")
barra+xlab("Genero")+ylab("Numero Casos")+
  ggtitle("Numero de Encuestados por Genero")


barra<-ggplot(datos,aes(y=Sexo))+
  geom_bar(width=0.7,colour="yellow",fill="brown")
barra+xlab("Genero")+ylab("Numero Casos")+
  ggtitle("Numero de Encuestados por Genero")


barra<-ggplot(datos,aes(x=Sexo,y=Gastos))+
  geom_bar(stat="identity",colour="yellow",fill="brown")
barra+xlab("Genero")+ylab("Gastos")+
  ggtitle("Total Gastos por Genero")


barra<-ggplot(datos,aes(x=Sexo,y=Gastos,fill=Sexo))+
  geom_bar(stat="identity")
barra+xlab("Genero")+ylab("Gastos")+
  ggtitle("Total Gastos por Genero")


ggplot(iris,aes(iris$Petal.Length,iris$Petal.Width,
                colour=iris$Species))+
  geom_point()


ggplot(iris,aes(iris$Petal.Length,iris$Petal.Width,
                colour=iris$Species))+
  geom_line()

ggplot(iris,aes(x=iris$Sepal.Length,fill=iris$Species))+
  geom_histogram()

ggplot(data=mtcars)+
  geom_point(aes(mpg,qsec,colour=factor(am)))+
  facet_grid(~vs)

ggplot(data=mtcars)+
  geom_boxplot(aes(x=factor(am),y=mpg))

ggplot(data=mtcars)+
  geom_boxplot(aes(x=factor(am),y=mpg))+
  coord_flip()#forma horizontal


ggplot(data=mtcars)+
  geom_point(aes(mpg,qsec,colour=factor(am)))+
  facet_grid(~vs) +theme_light()



