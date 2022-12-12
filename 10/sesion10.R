install.packages("class")
library(e1071)
library(caTools)
library(class)

ChickWeight

particion<-sample(nrow(ChickWeight),0.8*nrow(ChickWeight),
                  replace=FALSE)
train<-ChickWeight[particion,]
test<-ChickWeight[-particion,]

train_scale<-scale(train[,1:3])
test_scale<-scale(test[,1:3])
#muestra erro por existir campo que no es numerico
train$Chick<-as.numeric(train$Chick)
test$Chick<-as.numeric(test$Chick)

train_scale<-scale(train[,1:3])
test_scale<-scale(test[,1:3])

#implementar modelo k=5
modelo<-knn(train_scale,test_scale,train$Diet,k=5)
modelo

(matriz<-table(test$Diet,modelo))

library(caret)
confusionMatrix(table(test$Diet,modelo))


#implementar modelo k=7
modelo<-knn(train_scale,test_scale,train$Diet,k=7)
modelo

(matriz<-table(test$Diet,modelo))

library(caret)
confusionMatrix(table(test$Diet,modelo))

#implementar modelo k=11
modelo<-knn(train_scale,test_scale,train$Diet,k=11)
modelo

(matriz<-table(test$Diet,modelo))

library(caret)
confusionMatrix(table(test$Diet,modelo))


k.optm=1
for (i in 2:20){
  modelo<-knn(train_scale,test_scale,train$Diet,k=i)
  k.optm[i]<-100*sum(test$Diet==modelo)/nrow(test)
  k=i
  cat(k ," = ",k.optm[i],'
      ')
}

#accuracy
plot(k.optm,,type="b",xlab="K Valor",ylab="Accuracy")


(confusionMatrix(modelo,test$Diet))



#knn de regresion
boston=MASS::Boston

str(boston)

particion<-createDataPartition(boston$medv,p=0.85,list=FALSE)
train<-boston[particion,]
test<-boston[-particion,]


train_x=train[,-14]
train_x=scale(train_x)[,]
train_y=train[,14]

test_x=test[,-14]
test_x=scale(test_x)[,]
test_y=test[,14]


modelo<-knnreg(train_x,train_y)
str(modelo)

pred_y=predict(modelo,data.frame(test_x))

print(data.frame(test_y,pred_y))

#metricas
library(caret)
mse<-mean((test_y-pred_y)^2)
mae<-MAE(test_y,pred_y)
rmse<-RMSE(test_y,pred_y)
r2<-R2(test_y,pred_y, form="traditional")
cat("MAE :",mae,"\n MSE :",mse,"\nRMSE :",rmse,"\nR2:",r2)



for (x in 2:20){
  modelo<-knnreg(train_x,train_y,k=x)
  pred_y=predict(modelo,data.frame(test_x))
  r2<-R2(test_y,pred_y, form="traditional")
  cat(x ," = ",r2,'
      ')
}


# modelo naive bayes 
particion<-sample.split(iris,SplitRatio = 0.7)
train<-subset(iris,particion=="TRUE")
test<-subset(iris,particion=="FALSE")

modelo<-naiveBayes(Species~.,data=train)
modelo

(predecir<-predict(modelo,test))

(cm<-table(test$Species,predecir))

confusionMatrix(cm)

#-----   svm 
#kernel: polynomial, linear, radial,sigmoid
modelo<-svm(Species~.,data=train)
modelo
(predecir<-predict(modelo,test))

(cm<-table(test$Species,predecir))

confusionMatrix(cm)




modelo<-svm(Species~.,data=train, kernel="radial")
modelo
(predecir<-predict(modelo,test))

(cm<-table(test$Species,predecir))

confusionMatrix(cm)



modelo<-svm(Species~.,data=train, kernel="linear")
modelo
(predecir<-predict(modelo,test))

(cm<-table(test$Species,predecir))

confusionMatrix(cm)




modelo<-svm(Species~.,data=train, kernel="polynomial")
modelo
(predecir<-predict(modelo,test))

(cm<-table(test$Species,predecir))

confusionMatrix(cm)



modelo<-svm(Species~.,data=train, kernel="sigmoid")
modelo
(predecir<-predict(modelo,test))

(cm<-table(test$Species,predecir))

confusionMatrix(cm)





#svm de regresion
boston=MASS::Boston

str(boston)

particion<-createDataPartition(boston$medv,p=0.85,list=FALSE)
train<-boston[particion,]
test<-boston

modelo<-svm(medv~.,data=train)
predecir<-predict(modelo,test)
modelo

mse<-mean((test$medv-predecir)^2)
mae<-MAE(test$medv,predecir)
rmse<-RMSE(test$medv,predecirpredecir)
r2<-R2(test$medv,predecir, form="traditional")
cat("MAE :",mae,"\n MSE :",mse,"\nRMSE :",rmse,"\nR2:",r2)




modelo<-svm(medv~.,data=train,kernel="linear")
predecir<-predict(modelo,test)
r2<-cat("\nR2:",r2)


modelo<-svm(medv~.,data=train,kernel="poly")
predecir<-predict(modelo,test)
r2<-cat("\nR2:",r2)

modelo<-svm(medv~.,data=train,kernel="sigmoid")
predecir<-predict(modelo,test)
r2<-cat("\nR2:",r2)
