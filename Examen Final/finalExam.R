#*************** EXAMEN FINAL ***************
#*Alumno: Renzo J. Chan R.
#*Profesor: Juan J. Romero A.
#********************************************
#*Descripción:
#*
# 

# Llamamos a las bibliotecas que usaremos
library(caret)
library(dplyr)
library(data.table)
library(mlbench)
library(readxl)
library(rpart)
library(rattle)
library(rpart.plot)
library(randomForest)

# Elegimos nuestra data para clasificación
#choose.files()
setwd("C:\\Users\\RCHAN\\Documents\\RStudio\\Examen Final\\DATA\\")
getwd()

myData<-read.csv('heart.csv')
myData<-data.frame(myData)

# Creando particiones para el entrenamiento y test
particion<-createDataPartition(myData$output,p=0.75,list=FALSE)

train<-myData[particion,]
test<-myData[-particion,]

# convertimos la variable de respuesta (output) en factor
# para poder realizar una correcta clasificación
train$output<-as.factor(train$output)


# ------------------------- MODELO ARBOL DE DECISIÓN ---------------------------
# creación y entrenamiento del modelo
modelo1<-rpart(output~.,data=train,
               method="class",
               maxdepth = 4, 
               minsplit = 2, 
               minbucket = 1)
# viendo las reglas de forma gráfica
fancyRpartPlot(modelo1)
# predecir modelo
predecir<-predict(modelo1,test,type = "class")
table(test$output,predecir)
confusionMatrix(table(test$output,predecir),positive="1")

# Ingresamos un nuevo dato
#myData[187,]
#head(test,1)
df<-data.frame(age=93, sex=1, cp=3, trtbps=145, chol=230, fbs=1, restecg=0, 
               thalachh=150, exng=0, oldpeak=2.3, slp=0, caa=0, thall=1)
(predecir<-predict(modelo1,df))

# -------------------------- MODELO RANDOM FOREST ------------------------------
# creación y entrenamiento del modelo
modelo2<-randomForest(output~.,data=train,importance = TRUE)

# graficamos el error vs # de árboles
plot(modelo2)
# predecir modelo
predecir<-predict(modelo2,test)
confusionMatrix(table(test$output, predecir),positive="1")

# Ingresamos un nuevo dato
df<-data.frame(age=93, sex=1, cp=3, trtbps=145, chol=230, fbs=1, restecg=0, 
               thalachh=150, exng=0, oldpeak=2.3, slp=0, caa=0, thall=1)

(predecir<-predict(modelo2,df))


# -------------------------- PRUEBA ADICIONAL ------------------------------
df2<-data.frame(age=60, sex=1, cp=0, trtbps=130, chol=144, fbs=1, restecg=0, 
               thalachh=150, exng=0, oldpeak=1.4, slp=2, caa=0, thall=3)


(predecir<-predict(modelo1,df2))
(predecir<-predict(modelo2,df2))

