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

length(vector3)


  
  

