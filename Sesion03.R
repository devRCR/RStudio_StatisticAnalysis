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


horas=90
if(horas<80){
  basico<-45*horas
}else{
  basico<-80*45+(horas-80)*45*1.15
}
basico

sueldo<-c(3500,2500,6500,4500,2900)
descuento<-ifelse(sueldo>3500,"Realizar Descuento","Sin Descuento")


x<--5
if(x<0){
  print("Numero Negativo")
}else if(x>0){
  print("Numero Positivo")
}
  
#********** while **********
x<-0
while(x<11){
  print(x)
  x=x+1
}


lenguaje<-c("Python","R","Java","PHP")
x=1


# ingresar monto prestamo, interés, número de cuotas, mostra detalle de pago
prestamo=50000
interes=10
numcuotas=10
neto=prestamo*(1+interes/100)
montocuota=neto/numcuotas
for(x in 1:numcuotas){
  neto=neto-montocuota
  cat("\n",x,"\t s/",round(neto,1))
}

# ingresar monto a invertir sabiendo que incrementa cada año un 3%, cuanto será
# el monto en 15 años

capital=9000
interes=3
tiempo=15
for(x in 1:tiempo){
  capital=capital*(1+interes/100)
  cat("\n",x,"\t s/",round(capital,1))
}



#transformar a funcion
sueldo<-function(horas){
  if(horas<80){
    basico<-45*horas
  }
}

