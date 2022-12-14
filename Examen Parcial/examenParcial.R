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


# SOLUCION 1: solución rápida sin usar funciones

# usando ifelse
papeletas$IMPUESTO<-ifelse(papeletas$"ESTADO PAPELETA"=="NO",
                           papeletas$"MONTO"*0.13,0.0)
# usando mutate
(papeletas<-mutate(papeletas,IMPUESTO=case_when(
  `ESTADO PAPELETA`== "NO"~ MONTO*0.13,
  TRUE~0.0
)))

# SOLUCION 1: Solucion usando una función
impuesto<-function(dataFrame,estadoPapeleta){
  ifelse(dataFrame$"ESTADO PAPELETA"==estadoPapeleta,
         papeletas$"MONTO"*0.13,0.0)
}

papeletas$IMPUESTO<-impuesto(papeletas,"NO")

# 
# 2.- Realizar los siguientes gráficos:
#   
#   Cantidad de papeletas por departamento

# SOLUCION 2:
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

# SOLUCION 3:
# Unimos tabla propietarios con tabla vehículos por # de DNI
resultado<-full_join(propietarios,vehiculos,by="DNIPRO")
# Unimos tabla resultado con tabla papeletas por # de placa
resultado<-inner_join(resultado,papeletas,by="NROPLA")
# Ordenamos por DNIPRO, Propietario, sexo, categoría
consulta<-distinct(propietarios,PROPIETARIO,SEXO,CATEGORIA)
# calculamos el total de papeletas
totalPapeletas<-resultado %>% group_by(PROPIETARIO) %>% summarise("TOTAL PAPELETAS" = n())
# Unimos la tabla consulta con la tabla del total de papeletas
resultadoFinal<-full_join(consulta,totalPapeletas,by="PROPIETARIO")
# Reemplazamos los valores na por 0
resultadoFinal<-resultadoFinal %>% replace(is.na(.), 0)
# Ordenamos de forma ascendente por el # de papeletas
resultadoFinal<-arrange(resultadoFinal,`TOTAL PAPELETAS`)
# Convertimos el resultado final en un DataFrame
data.frame(resultadoFinal)


# 4.-Mostrar la cantidad de papeletas por tipo de vehículo solo mostrar 
#    motocicleta, camioneta y microbús
# Unimos la hoja de datos vehículos con papeletas por # de placa
# usando intersscción para así solo contar con los vehiculos que tienen papeleta

# SOLUCION 4:
df<-inner_join(vehiculos,papeletas,by="NROPLA")
# filtramos por tipo de vehículo MOTOCICLETA, CAMIONETA o MICROBUS
df1<-filter(df,`TIPO VEHICULO` == "MOTOCICLETA" | 
              `TIPO VEHICULO` == "CAMIONETA" |
              `TIPO VEHICULO` == "MICROBUS")
# Agrupamos por Tipo de vehículo y mostramos el total de papeletas
(totalPapeletas<-df1 %>% group_by(`TIPO VEHICULO`) %>% 
    summarise("TOTAL PAPELETAS" = n()))

# 5.-Mostrar el monto de papeletas y cantidad de papeletas por policía 
#    considerar solo las papeletas donde se registró fallecidos y lesionados

# SOLUCION 5:
# Filtramos Papeletas considerando solo donde hubo FALLECIDOS Y LESIONADOS
df<-filter(papeletas,FALLECIDOS>0 & LESIONADOS>0)
# Mostramos el resultado final de la tabla con la cantidad de papeletas
# y el monto total
(resultado<-df %>% group_by(POLICIA) %>% 
  summarise("MONTO PAPELETAS"=sum(MONTO),"CANT. PAPELETAS" = n()))


# Filtramos Papeletas considerando solo donde hubo FALLECIDOS O LESIONADOS
df<-filter(papeletas,FALLECIDOS>0 | LESIONADOS>0)
# Mostramos el resultado final de la tabla con la cantidad de papeletas
# y el monto total
(resultado<-df %>% group_by(POLICIA) %>% 
    summarise("MONTO PAPELETAS"=sum(MONTO),"CANT. PAPELETAS" = n()))
