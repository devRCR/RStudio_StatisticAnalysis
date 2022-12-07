#choose.files()

setwd("C:\\Users\\RCHAN\\Documents\\RStudio\\08\\DATA\\")
getwd()

library(readxl)
datos<-read_excel("sesion8.xlsx",sheet="ELEMENTO")

# medir la resistencia a la tension de madera dura
plot(datos)

# metodo particion
#install.packages("caret")
library(caret)
set.seed(123)
particion<-createDataPartition(datos$RESISTENCIA,p=0.7,list=FALSE)
train<-datos[particion,]
test<-datos[-particion,]

# evaluar un modelo lineal 
modeloLineal<-lm(RESISTENCIA~CONCENTRACION,data=train)
summary(modeloLineal)

plot(train)
abline(modeloLineal,col="red")

# modelo polinomial al cuadrado
modelo2<-lm(RESISTENCIA~poly(CONCENTRACION,2),data=train)
summary(modelo2)

# modelo polinomial al cubo
modelo3<-lm(RESISTENCIA~poly(CONCENTRACION,3),data=train)
summary(modelo3)

# ver en forma de gráfico modelo lineal, poly a 2, poly a 3
library(ggplot2)
ggplot(train,
       aes(x=CONCENTRACION,y=RESISTENCIA))+
         geom_point()+ #mostrar data real
         geom_smooth(method="lm",formula=y~x,se=FALSE,
                     col="brown")+
         geom_smooth(method="lm",formula=y~poly(x,2),se=FALSE,
                     col="green")+
         geom_smooth(method="lm",formula=y~poly(x,3),se=FALSE,
                     col="red")+
         theme_light()

# predecir
(y_pred<-predict(modelo3,test))


# nueva data
# CONCENTRACION  --> 14,15
predict(modelo3,list(CONCENTRACION=c(14,15)))


library(rsample)
#install.packages("rsample")
datos<-read_excel("sesion8.xlsx",sheet="DENTAL")
plot(datos)

particion<-initial_split(datos,prop = 0.7)
train<-training(particion)
test<-testing(particion)

for(x in 2:10){
  modelo<-lm(FlouridePPM~poly(DMFper100,x),data=train)
  cat("\nGrado : ",x," =======> R2 es", summary(modelo)$r.squared)
}

modelo<-lm(FlouridePPM~poly(DMFper100,9),data=train)
summary(modelo)

test
(y_pred<-predict(modelo,test))
(matriz<-data.frame(DMFper100=test,Predecir=y_pred))




