#************* EXAMEN PARCIAL ***************
#*Alumno: Renzo J. Chan R.
#*Profesor: Juan J. Romero A.
#********************************************
#*Descripción:
#*Descargar el archivo BD_Transito del campus
# 

# Cargamos la ruta y el fichero BD_transito
setwd("C:\\Users\\RCHAN\\Documents\\RStudio\\Examen Parcial\\DATA\\")
getwd()

# Importamos bibliotecas a utilizar
library(readxl)
library(dplyr)

# Visualizamos las hojas del archivo BD_transito
excel_sheets("BD_Transito.xlsx")

# Cargamos los datos de las hojas del archivo en diferentes Datas
propietarios<-read_excel("BD_Transito.xlsx",sheet = "PROPIETARIOS")
vehiculos<-read_excel("BD_Transito.xlsx",sheet = "VEHICULOS")
papeletas<-read_excel("BD_Transito.xlsx",sheet = "PAPELETAS")

# 1.- Crear una función que agregue a la tabla papeletas un impuesto de 13% a 
#   las papeletas que no pagaron.


# PREGUNTA 1: solución rápida sin usar funciones

# usando ifelse
papeletas$IMPUESTO<-ifelse(papeletas$"ESTADO PAPELETA"=="NO",
                           papeletas$"MONTO"*0.13,0.0)
# usando mutate
(papeletas<-mutate(papeletas,IMPUESTO=case_when(
  `ESTADO PAPELETA`== "NO"~ MONTO*0.13,
  TRUE~0.0
)))

# PREGUNTA 1: Solucion usando una función
impuesto<-function(dataFrame,estadoPapeleta){
  ifelse(dataFrame$"ESTADO PAPELETA"==estadoPapeleta,
         papeletas$"MONTO"*0.13,0.0)
}

papeletas$IMPUESTO<-impuesto(papeletas,"NO")

# 
# 2.- Realizar los siguientes gráficos:
#   
#   Cantidad de papeletas por departamento

b1<-barplot(table(papeletas$DEPARTAMENTO),
           main="# de Papeletas por Departamento",
           col=rainbow(10),
           xlab="Departamento",
           ylab="# Papeletas",
           ylim=c(0,350),
           las=1, #orientacion de nombre x
           font.axis=2)
text(b1,2,table(papeletas$DEPARTAMENTO),pos=3)

 
#   Monto papeletas por zona de accidente
b2<-barplot(table(papeletas$"ZONA ACCIDENTE"),
           main="# de Papeletas por Zona de Accidente",
           col=c("royalblue", "seagreen", "purple", "grey"),
           xlab="Zona de Accidente",
           ylab="# Papeletas",
           ylim=c(0,550),
           las=1, #orientacion de nombre x
           font.axis=1)
text(b2,2,table(papeletas$"ZONA ACCIDENTE"),pos=3)


# 3.- Mostrar los propietarios, sexo, categoría y total de papeletas
# Unimos tabla propietarios con tabla vehículos por # de DNI
(resultado<-inner_join(propietarios,vehiculos,by="DNIPRO"))
# Unimos tabla resultado con tabla papeletas por # de placa
(resultado<-full_join(resultado,papeletas,by="NROPLA"))
# Ordenamos por Propietario, sexo, categoría
(consulta<-select(resultado,DNIPRO,SEXO,CATEGORIA))
# calculamos el total de papeletas
(totalPapeletas<-resultado %>% group_by(DNIPRO) %>% summarise("TOTAL PAPELETAS" = n()))
# mostramos la tabla final
(resultadoFinal<-inner_join(consulta,totalPapeletas,by="DNIPRO"))

# 4.-Mostrar la cantidad de papeletas por tipo de vehículo solo mostrar 
#    motocicleta, camioneta y microbús


# 5.-Mostrar el monto de papeletas y cantidad de papeletas por policía 
#    considerar solo las papeletas donde se registró fallecidos y lesionados


