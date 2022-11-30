# ver ruta de directorio 
getwd()
choose.files()
# defino nueva ruta G:\Mi unidad\IPEN\IPEN 2022\Curso Análisis Estadístico con R Studio\DATA
setwd("C:\\Users\\RCHAN\\Documents\\RStudio\\05\\DATA\\")
getwd()

library(readxl)
(datos<-read_excel("VENTAS_NH2020.xlsx"))

library(dplyr)
# visualizar columnas de la data
names(datos)

# cantidad filas
nrow(datos)

# clase o tipo de datos
class(datos)
class(datos$Segmento)
class(datos$PrecioFabricacion)
class(datos$BandaDescuento)

attach(datos)
# consultas
(consultas<-select(datos,Segmento,Empleado,Departamento,VentasBrutas))

# consultas columnas a no mostrar
(consultas<-select(datos,-Segmento,-Departamento,-TipoBicicleta))

# realizar consultas por el número de columnas
(select(datos,2,5,6,9))

# Consultas por rango de columnas
(select(datos,c(1:4)))

# Consultas por rango de columnas
(select(datos,c(1:4,7,9:12)))

# consulta por numero de columnas que no deseo mostrar
(consultas<-select(datos,-c(1,4,5,6,7,8,9,10)))
(consultas<-select(datos,-c(1:4,7,9:12)))

(consultas<-select(datos,c(Segmento,Empleado,Departamento,VentasBrutas)))
(consultas<-select(datos,-c(Segmento,Empleado,Departamento,VentasBrutas)))

# cambiar nombre a las columnas en la consulta
(consultas<-select(datos,c(TipoCliente=Segmento,
                           Trabajador=Empleado,
                           Ubicacion=Departamento,
                           VentaTotal=VentasBrutas)))

# primeras y ultimas filas
(consultas<-head(datos))
(consulta<-tail(datos))
(consulta<-head(datos,10))
(consulta<-tail(datos,15))