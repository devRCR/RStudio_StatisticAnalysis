#*********** VECTOR *********
#* Sesión 23/11/22
#* Renzo Chan
#* 

c(1,2,3,4,5,6,7,8,9,10)
c("renzo","José", "Akira", "Alvaro")
c(TRUE,FALSE,TRUE,FALSE,FALSE)

(vector<-c(1,2,3,4,5,6,7,8,9,10))

(vector<-c(vector,11)) # agregar elemento

vector1<-c(1,2,3)
vector2<-c(6,6,6)

(vector3<-c(vector1,vector2))

class(vector3) # ver el tipo de variable del vector

# operaciones a realizar con vector
vector3+5
vector3*3
vector3%%2 # residuo


vector3>3
vector3==3 # igual
vector3!=3 # diferente

vector3<-c(10,20,30,40,50,60,70)
vector3[1:2] # extraer elemento del 1 al 2
vector3[c(2,4,6)] # muestra los elementos de posición 2,4,6
vector3[-2] # muestra todos los elementos excepto de posicion 2
vector3[-c(2,4,6)] # muesta elemento excepto de posicion 2,4,6

(vector3[vector3>40]) # retorna los valores mayor a 40
(vector3[vector3!=40]) # retorna los valores diferentes a 40

head(vector3) # muestra por defecto los 6 primeros datos
head(vector3,3) # muestra los 3 primeros datos

tail(vector3) # muestra por defecto los 6 últimos datos
tail(vector3,2) # muestra los 3 últimos datos

length(vector3) # número de elementos
sum(vector)
mean(vector3)
max(vector3)
min(vector3)

sort(vector3) # ordenar
sort(vector3,decreasing=TRUE)
rev(vector3)  # invertir orden de elementos


# ************** MATRIZ ***********
(x=matrix(nrow=3,ncol=3,c(1,2,3,4,5,6,7,8,9),byrow=TRUE))

(x=matrix(nrow=3,ncol=3,c(1,2,3,4,5,6,7,8,9),byrow=FALSE))

vector1<-c(1,2,3)
vector2<-c(5,6,7)
vector3<-c(9,10,11)

(matriz=cbind(vector1,vector2,vector3)) # ingrese por columnas
(matriz=rbind(vector1,vector2,vector3)) # ingrese por filas

matriz[2,3] # fila 2 columna 3
matriz[1,]  # fila 1

diag(matriz) # elementos de la diagonal

# crear matriz diagonal
diag(c(4,5,6,7))

# Operaciones con matriz
(matriz+5)

(matriz+matriz)
(matriz-matriz)
(matriz%*%matriz) # error por no cumplir con la regrla de producto de matrices
(matriz*matriz)

install.packages("expm")
library(expm)

matriz%^%3
det(matriz)
solve(matriz)

length(matriz) # número de elementos
mode(matriz) # tipo de elementos
dim(matriz) # dimensión matriz

# asignar nombre filas y columnas de matriz
datos<-matrix(c(30,70,165,25,65,180,34,78,178),nrow=3,byrow=T)
colnames(datos)<-c("Edad","Peso","Altura")
datos
rownames(datos)<-c("Juan","Ana","Pedro")
datos

datos[,"Edad"]
datos["Juan",]
datos[,c("Edad","Altura")]
datos[c("Ana","Pedro"),c("Edad","Altura")]

apply(datos,1,mean)

#**************** Factor ***************
genero<-c("M","F","M","F","M","F","M","M","M")
genero

genero<-factor(genero) # transforma a factor
genero

(genero<-factor(genero,levels=c("M","F"),labels=c("Masculino","Femenino")))

table(genero) # ver distribución
plot(genero) # ver fráfico
levels(genero) # ver niveles
attributes(genero) # ver nivel y clase

genero[4]
genero[-4]
genero[c(1,3,6,8)]
genero[-c(1,3,6,8)]

genero[genero=="Femenino"]
class(genero) # que tipo de data es 


ruedas<-c(16,18,20,16,18,20,20,20,18,18,16,16,16,16,16,20,20,20)
class(ruedas)

ruedas<-factor(ruedas)
class(ruedas)
table(ruedas)
plot(ruedas)

as.numeric(ruedas) # retorna el nivel no valor
as.numeric(as.character(ruedas)) # ahí retorna valor

ruedas[ruedas==16 | ruedas==20]

attributes(ruedas)


talla<-c("alto","bajo","medio","alto","medio","bajo","bajo","alto",
         "bajo","medio","alto","medio","bajo","bajo")
talla<-factor(talla)

table(talla)
plot(talla)

talla

# reordenar el orden de los niveles
talla<-factor(talla,levels=c("bajo","medio","alto"))
table(talla)
plot(talla)

talla
talla[talla!="bajo"]
talla[talla=="bajo"| talla=="alto"]


#***************** DATA FRAME ************************
#*
edad<-c(23,25,34,45,36,38,45,28,18,27)
genero<-c("M","F","M","M","M","F","F","M","M","F")
sueldo<-c(3500,3400,4500,5400,4800,5400,3600,4900,5100,2900)
datos<-data.frame(genero,edad,sueldo)

str(datos) # estructura de la data
names(datos) # nombre de las columnas

# visualizar los datos
datos[3:6,] # de fila 3 a 6
datos[,1] # columna
datos$genero
datos[,"genero"]
datos[["genero"]]

attach(datos)
table(genero)
table(edad)
table(sueldo)
mean(sueldo[genero=="F"])
sum(edad[genero=="M"])
detach(datos)


divisas<-data.frame(moneda=c("Libra","Euro","Dolar"),
                    cambio=c(4.25,4.6,4.1))
paises<-data.frame(pais=c("EEUU","PERU","ARGENTINA"),
                   moneda=c("DOLAR","SOLES","PESOS"))

attach(divisas)
moneda
attach(paises)
moneda # llama al último data que se hizo attach
pais
cambio
detach(paises)
moneda # retorna del primer data xl el otro data se cerró

moneda<-c(3500,2500,1500)

moneda
divisas$moneda

medidas<-data.frame(longitud=c(5,3,6),peso=c(250,260,230),
                    diametro=c(8,9,9))

# comando with permite ejecutar varias instrucciones
with(medidas,{
  volumen = longitud*pi*(diametro/2)^2
  densidad=peso/volumen
  densidad
})

# agregar campo a un data frame
medidas$densidad = with(medidas,{
  volumen = longitud*pi*(diametro/2)^2
  densidad=peso/volumen
  densidad
})

datos
head(datos)
tail(datos)
(masculino<-subset(datos,genero=="M"))
(data1<-subset(datos,genero=="M" & edad>30))
(data2<-subset(datos,edad>30&edad<40|genero!="F",
  select=c(edad,genero)))

# Fusionar dataframes
data1<-data.frame(empleado=c("juan","jose","pedro","luis"),
                    cargo=c("analista","programador","analista","diseñador"))
data2<-data.frame(empleado=c("rosa","luisa","ana","carmen","juan","jose"),
                    cargo=c("diseñador","tecnico","analista","diseñador",
                            "analista","programador"))

data1
data2

# unir 2 data frames
(trabajadores<-rbind(data1,data2))
(trabajadores<-merge(data1,data2)) # intersección de ambas data
(trabajadores<-merge(data1,data2,all=TRUE)) # valores únicos

data1<-data.frame(empleado=c("juan","jose","pedro","luis"),
                  cargo=c("analista","programador","analista","diseñador"))
data2<-data.frame(empleado=c("juan","jose","pedro","luis"),
                  sueldo=c(5600,4500,3500,6700))
(trabajadores<-merge(data1,data2))# muestra las columnas comunes


data1<-data.frame(empleado=c("juan","jose","pedro","luis","ana","rosa"),
                  cargo=c("analista","programador","analista","diseñador",
                          "abogado","secretaria"))
data2<-data.frame(empleado=c("juan","jose","pedro","luis","laura","liz"),
                  sueldo=c(5600,4500,3500,6700,6500,3500))
(trabajadores<-merge(data1,data2)) # muestra intersección
(trabajadores<-merge(data1,data2,all=TRUE)) # comunes e intersección


data1<-data.frame(empleado=c("juan","jose","pedro","luis","ana","rosa"),
                  cargo=c("analista","programador","analista","diseñador",
                          "abogado","secretaria"))
data2<-data.frame(empleado=c("juan","jose","pedro","luis","laura","liz"),
                  sueldo=c(5600,4500,3500,6700,6500,3500))
(trabajadores<-merge(data1,data2,all.x=TRUE)) # comunes e intersección


data1<-data.frame(empleado=c("juan","jose","pedro","luis","ana","rosa"),
                  cargo=c("analista","programador","analista","diseñador",
                          "abogado","secretaria"))
data2<-data.frame(empleado=c("juan","jose","pedro","luis","laura","liz"),
                  sueldo=c(5600,4500,3500,6700,6500,3500))
(trabajadores<-merge(data1,data2,all.y=TRUE)) # comunes e intersección


