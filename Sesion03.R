#********* PROGRAMACION ************
#*condificional 
#*condicional simple
#*bicondicional 
#*anidado

# ingresar sueldo basico si es mayor a 2500 descontar 12%

basico<-1800
if (basico>1800){
  basico<-basico*0.88
}
basico



basico<-2800
if (basico>1800){
  basico<-basico*0.88
}
basico


# ingresar horas de trabajo donde la tarifa es 45xhora, recibe sueldo extra
# si las horas son mayor a 80, pago hora extra es 15% mas lo normal

horas=70
if(horas<80){
  basico<-45*horas
}else{
  basico<-80*45+(horas-80)*45*1.15}
basico

