library(help="datasets")
?airquality

#modelo de regresion logistica
#install.packages("mlbench")

library(mlbench)
data("PimaIndiansDiabetes2")
PimaIndiansDiabetes2=na.omit(PimaIndiansDiabetes2)

# crear modelo logistico
modelo=glm(diabetes~.,data=PimaIndiansDiabetes2,family=binomial())
summary(modelo)


head(PimaIndiansDiabetes2,1)
data=data.frame(pregnant=1, glucose=89, pressure=66,
                triceps=23, insulin=94, mass=28.1,
                pedigree=0.167, age=21)
# resultado sale 0.02711452<0.5 -------> es igual 0 pertenece a neg
(predict(modelo,data,type="response"))



# test and train
set.seed(100)
particion<-sample(nrow(PimaIndiansDiabetes2),0.8*nrow(PimaIndiansDiabetes2),
                  replace=FALSE)
train=PimaIndiansDiabetes2[particion,]
test=PimaIndiansDiabetes2[-particion,]
modelo<-glm(diabetes~.,data=train,family = binomial())

(predecir<-predict(modelo,test,type="response"))
# transformar resultados a datos de clasificacion
(predecir<-ifelse(predecir>0.5,"pos","neg"))
#tabla de resultados
table(test$diabetes,predecir)

library(caret)
confusionMatrix(table(test$diabetes,predecir))


# ejemplo2 : logístico

#install.packages("caret")
#install.packages("curl")
#install.packages("data.table")
#install.packages("readxl")

library(caret)
library(data.table)
data=fread("https://raw.githubusercontent.com/JoaquinAmatRodrigo/Estadistica-machine-learning-python/master/data/spam.csv")

data$type=as.factor(data$type)
class(data$type)
table(data$type)

particion<-createDataPartition(data$type,p=0.75,list=FALSE)

train<-data[particion,]
test<-data[-particion,]

modelo<-glm(type~.,data=train,family=binomial())

(predecir<-predict(modelo,test,type="response"))
(predecir<-ifelse(predecir>0.5,"spam","nonspam"))
table(test$type,predecir)

confusionMatrix(table(test$type,predecir),positive="spam")


# ejemplo 3
datos<-as.data.frame(UCBAdmissions)
modelo<-glm(Admit~.,data=datos,family=binomial())

(predecir<-predict(modelo,datos,type="response"))
(predecir<-ifelse(predecir>0.5,"Admitted","Rejected"))
table(datos$Admit,predecir)
confusionMatrix(table(datos$Admit,predecir),positive="Admitted")



# Ejemplo 4: Puromycin
datos<-as.data.frame(Puromycin)
modelo<-glm(state~.,data=datos,family=binomial())

(predecir<-predict(modelo,datos,type="response"))
(predecir<-ifelse(predecir>0.5,"treated","untreated"))
table(datos$state,predecir)
confusionMatrix(table(datos$state,predecir),positive="treated")

# Ejemplo 5: 
#choose.files()
setwd("G:\\Mi unidad\\IPEN\\IPEN 2022\\Curso Análisis Estadístico con R Studio\\09\\DATA\\")
getwd()
library(readxl)
#----------------- arbol decision ------------------------
library(rpart)
#install.packages("rpart")
library(rattle)
library(rpart.plot)

datos<-read_excel("datalineal.xlsx",sheet="salud")
particion<-createDataPartition(datos$DEATH_EVENT,p=0.7,list=FALSE)

train<-datos[particion,]
test<-datos[-particion,]

# modelo arbol clasificacion
modelo<-rpart(DEATH_EVENT~.,data=train,method="class")
modelo

# ver las reglas
asRules(modelo)

# grafico
rpart.plot(modelo)
rpart.plot(modelo, type=2)
rpart.plot(modelo, type=2, extra=2, nn=TRUE)

fancyRpartPlot(modelo)


# predecir modelo
(predecir<-predict(modelo,test,type = "class"))
table(test$DEATH_EVENT,predecir)

confusionMatrix(table(test$DEATH_EVENT,predecir),
                positive="1")


#ejemplo 2: clasificacion
datos<-read_excel("datalineal.xlsx",sheet="vino")
datos<-data.frame(datos)
str(datos)
datos$quality<-as.factor(datos$quality)

particion<-sample(nrow(datos),0.8*nrow(datos),
                  replace=FALSE)
train<-datos[particion,]
test<-datos[-particion,]

table(train$quality)
modelo<-rpart(quality~.,data=train,method="class")

rpart.plot(modelo, type=2, extra=2, nn=TRUE)

#predecir modelo
(predecir<-predict(modelo,test,type="class"))
table(test$quality, predecir)

confusionMatrix(table(test$quality, predecir))



# modelo arbol regresion

data=fread("https://raw.githubusercontent.com/aurea-soriano/ML-Datasets/master/USA_Housing.csv")
data=data[,1:6]
glimpse(data)

particion<-createDataPartition(data$Price,p=0.75,list=FALSE)
train<-data[particion,]
test<-data[-particion,]

modelo<-rpart(Price~.,data=train,method = "anova")

printcp(modelo)
plotcp(modelo)
rpart.plot(modelo,type=2,nn=TRUE)

(predecir<-predict(modelo,test))

# medir R2
(cor(test$Price,predecir))^2


# -------------------------- MODELO RANDOM FOREST ------------------------------
#install.packages("randomForest")
library(randomForest)

particion<-createDataPartition(iris$Species,p=0.8,list=FALSE)
train<-iris[particion,]
test<-iris[-particion,]

modelo<-randomForest(Species~.,data=train,importance=TRUE)
# ver el error como va disminuyendo por cantidad de arboles
plot(modelo)

(predecir<-predict(modelo,test))
table(test$Species,predecir)

confusionMatrix(test$Species,predecir)

# enviar nueva data
head(test,1)
df<-data.frame(Sepal.Length=5.1, Sepal.Width=3.5, 
               Petal.Length=1.4, Petal.Width=0.2)

(predecir<-predict(modelo,df))





# Random Forest de regresion
datos=airquality
datos=na.omit(datos)
# Ozone~. depende de los demás
modelo<-randomForest(Ozone~.,data=datos,
                     importance=TRUE,na.action=na.omit) 

round(importance(modelo),2)
(predecir<-predict(modelo,datos))
# medir R2
(cor(datos$Ozone,predecir))^2



#ver resultados en 3 modelos
data=fread("https://raw.githubusercontent.com/JoaquinAmatRodrigo/Estadistica-machine-learning-python/master/data/spam.csv")
data$type=as.factor(data$type)
class(data$type)
table(data$type)

particion<-createDataPartition(data$type,p=0.75,list=FALSE)

train<-data[particion,]
test<-data[-particion,]

modelo<-glm(type~.,data=train,family=binomial())

(predecir<-predict(modelo,test,type="response"))

(predecir<-ifelse(predecir>0.5,"spam","nonspam"))

table(test$type,predecir)

confusionMatrix(table(test$type,predecir),positive="spam")



#arbol
modelo<-rpart(type~.,data=train,method="class")
#predecir modelo
(predecir<-predict(modelo,test,type="class"))
confusionMatrix(table(test$type, predecir))



#random forest
modelo<-randomForest(type~.,data=train,importance=TRUE)
(predecir<-predict(modelo,test))
confusionMatrix(table(test$type, predecir))







