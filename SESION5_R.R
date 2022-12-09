#ver ruta de directorio
getwd()
choose.files()
#defino nueva ruta  C:\Users\ING-J\Downloads\MIERCOLES
setwd("C:\\Users\\ING-J\\Downloads\\MIERCOLES\\")
getwd()


library(readxl)
(datos<-read_excel("VENTAS_NH2020.xlsx"))

library(dplyr)
#visualizar columnas de la data
names(datos)

#cantidad filas
nrow(datos)

#clase o tipo de datos
class(datos)
class(datos$Segmento)
class(datos$PrecioFabricacion)
class(datos$BandaDescuento)

attach(datos)
#consultas columnas a mostrar
(consultas<-select(datos,Segmento,Empleado,Departamento,VentasBrutas))

(consultas<-select(datos,TipoBicicleta,PrecioFabricacion,PrecioVentas))

#consultas columnas a no mostrar
(consultas<-select(datos,-Segmento,-Departamento,-TipoBicicleta))

(consultas<-select(datos,-TipoBicicleta,-PrecioFabricacion,-PrecioVentas))

#que muestra el siguiente codigo????????
(consultas<-select(datos,-Segmento,Empleado,-Departamento,VentasBrutas))
names(consultas)
(consultas<-select(datos,-Segmento,-Departamento))

#realizar consultas por numero de columnas
(select(datos,2,5,6,9))

#consultas por rango de columnas
(consultas<-select(datos,c(1:4)))

(consultas<-select(datos,c(1:4,7,9:12)))

#consulta por numero columnas que no deseo mostrar
(consultas<-select(datos,-c(1,4,5,6,8,9,10)))
(consultas<-select(datos,-c(1:4,7,9:12)))

(consultas<-select(datos,c(Segmento,Empleado,Departamento,VentasBrutas)))

(consultas<-select(datos,-c(Segmento,Empleado,Departamento,VentasBrutas)))

#cambiar nombre a las columnas en la consulta
(consultas<-select(datos,c(TipoCliente=Segmento,
                           Trabajador=Empleado,
                           Ubicacion=Departamento,
                           VentaTotal=VentasBrutas)))

#primeras y ultimas filas
(consultas<-head(datos))
(consultas<-tail(datos))
(consultas<-head(datos,10))
(consultas<-tail(datos,15))

(consultas<-head(select(datos,c(Segmento,Empleado,Departamento,VentasBrutas)),
                 6))

(consultas<-tail(select(datos,c(5:12)),10))

#distinct: cuantos valores distintos existen
distinct(datos,Segmento)
distinct(datos,Departamento)
distinct(datos,Empleado)

(consulta<-distinct(datos,Departamento,Distrito))

#filtar   ==, !=, >, <, >=, <=
(consulta<-filter(datos,Departamento=="Lima"))

(consulta<-filter(datos,Departamento!="Lima"))

(consulta<-filter(datos,UnidadesVendidas>2000))

#y  --->  &        o ---->|
(consulta<-filter(datos,Departamento=="Lima" & UnidadesVendidas>2000 ))

(consulta<-filter(datos,Departamento=="Lima" | UnidadesVendidas>2000 ))



(consulta<-filter(datos,Departamento=="Lima" | Departamento=="Arequipa" |
      (UnidadesVendidas>=2000 & UnidadesVendidas=<3000)))

# %in%  ----> sirve para agregar lista de las filas de una columna
(consulta<-filter(datos,Departamento %in% c("Lima","Arequipa") |
                    (UnidadesVendidas>=2000 & UnidadesVendidas=<3000)))

#between ---->  retorna rango de numero
(consulta<-filter(datos,Departamento %in% c("Lima","Arequipa") |
                    between(UnidadesVendidas,2000,3000)))

# de la consulta anterior negar los departamentos
(consulta<-filter(datos,!Departamento %in% c("Lima","Arequipa") |
                    between(UnidadesVendidas,2000,3000)))


#agregar columna
(consulta<-mutate(datos,Impuesto=VentasBrutas*0.18))

(consulta<-mutate(datos,Zona=case_when(
  Departamento=="Lima"~"Centro",
  Departamento=="La Libertad"~"Norte",
  Departamento=="Arequipa"~"Sur",
  TRUE~"Ninguno"
)))



(consulta<-mutate(datos,Zona=case_when(
  Departamento=="Lima" & UnidadesVendidas>3000~"Centro",
  Departamento=="La Libertad"& UnidadesVendidas>2000~"Norte",
  Departamento=="Arequipa"& UnidadesVendidas>1000~"Sur",
  TRUE~"Ninguno"
)))


#ordenar columnas
(consulta<-arrange(datos,Segmento))
(consulta<-arrange(datos,Departamento))
(consulta<-arrange(datos,desc(Departamento)))

(consulta<-arrange(datos,desc(Departamento),desc(Distrito)))
(consulta<-arrange(datos,Departamento,desc(Distrito)))

#ctrl + shift + m       %>%
(consulta<-select(datos,Segmento,Empleado,Departamento,UnidadesVendidas) %>% 
  filter(Departamento %in% c("Arequipa","Lima")))


(consulta<-select(datos,Segmento,Empleado,Departamento,UnidadesVendidas) %>% 
    filter(Departamento %in% c("Arequipa","Lima")) %>% 
    arrange(desc(UnidadesVendidas)))


(consulta<-select(datos,Departamento,Empleado,TipoBicicleta,Ventas,UnidadesVendidas) %>% 
    mutate(IGV=Ventas*0.18) %>% 
    filter(Departamento=="Lima" & between(UnidadesVendidas,1000,2000)) %>% 
    arrange(TipoBicicleta,desc(Empleado))
  )


#mostrar filas
(consulta<-select(datos,Departamento,Empleado,TipoBicicleta,Ventas,UnidadesVendidas) %>%
    slice(10:20))

(consulta<-select(datos,Departamento,Empleado,TipoBicicleta,Ventas,UnidadesVendidas) %>%
    slice(10:20,50:60))


#top N
# 5 ventas mayores
(consulta<-select(datos,Departamento,Empleado,TipoBicicleta,Ventas) %>%
    top_n(5,Ventas) %>% arrange(desc(Ventas)))

# 5 ventas menores
(consulta<-select(datos,Departamento,Empleado,TipoBicicleta,Ventas) %>%
    top_n(-5,Ventas) %>% arrange(desc(Ventas)))

#funciones agrupadas min(),max(),mean(),median(),sum()
(consulta<-select(datos,Departamento,Ventas) %>%
    group_by(Departamento) %>% 
    summarise(Total=sum(Ventas)))


(consulta<-select(datos,Empleado,Ventas) %>%
    group_by(Empleado) %>% 
    summarise(Promedio=mean(Ventas)))

(consulta<-select(datos,Departamento,Distrito,Ventas) %>%
    group_by(Departamento,Distrito) %>% 
    summarise(MaximaVentas=max(Ventas)))



#nombras los nombres de las hojas de un archivo excel
excel_sheets("Datos.xlsx")
clientes<-read_excel("Datos.xlsx",sheet="Cliente")
ventas<-read_excel("Datos.xlsx",sheet="Ventas")


    
    
    