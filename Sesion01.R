# asignación de variables
a<-5.3
4.6->b
c=5

# ver valores de variables
a
b
c

nombre = "Renzo"
respuesta = FALSE

# Ver lo que hay almacenado en memoria
ls.str()

mode(a)
mode(nombre)
mode(respuesta)

suma=a+b

# imprimir
paste("La suma es:",suma)
print("La suma es %4.2f",suma)
sprintf("la suma es: %s",suma)
cat("La suma es", suma)

a=2;b=3;c=4;d=5
total=a+b+c # aquí no muestra el resultado
total # para ello se debe llamar a la variable

# Si deseo realizar la operación y ejecutar a la vez, se debe agregar 
# paréntesis al inicio y final
(total=a+b+c)

# Operaciones básicas
8/5 # retorna división decimal
8%/%5 # retorna división entera
2^4 # potencia
8%%5 # retorna residio de la división

# Operadores Lógicos
5>12
5<12
5==12 # es igual a 12?
5!=12 # es distinto a 12?

# funciones numéricas importantes
sqrt(64)
round(sqrt(65))
log(10)
log10(10)
log(10,base=2)
sin(pi)
cos(pi)
tan(pi)
sin(180)
abs(-34)
factorial(5)
exp(1)
round(4.4656856,2) # redondeo 2 decimales
ceiling(4.45687) # redondeo hacia arriba
floor(4.45687) # redondeo hacia abajo
trunc(4.45356)


# funciones cadena
cadena = "Renzo José Chan Rios"
substr(cadena,start=7,stop=15)
substr(cadena,7,15)
substring(cadena,7)
toupper(cadena) # Pasar a Mayúsculas
cadena_2 = "RENZO JOSE"
tolower(cadena_2)

# para ayuda de un comando anteponer ? 
?substr

nchar(cadena) # cantidad de caracteres


# Generar datos
(x<-1:30) # almacena números del 1 al 30
(y<-2:8)
(z<-10:-10)
pi:6
6:pi
seq(1,5,0.5) # del 1 al 5, con incremento de 0.5
seq(1,9,2)
seq(1,9,pi)

# pide ingresar directamente los datos por teclado
z<-scan() # doble enter para terminar


# Crear repeticiones
rep(x=1:4,times=2) # del 1 al 4 va a repetir 2 veces la secuencia
rep(x=1:4,times=c(2,3,2,4)) # de 1 a 4 indico según orden cuantas veces
rep(x=1:4,each=2) # de 1 a 4 cada número repite 2 vces
rep(x=1:4,each=2,len=10) # de 1 a 4 cada número repite 2 veces solo 

# Crear funcion
# la suma de dos números
suma<-function(num1,num2){
  return(num1+num2)
}

suma(15,8)


# Hallar promedio de notas ingresando 3 números
promedio<-function(nota1,nota2,nota3){
  return((nota1+nota2+nota3)/3)
}

promedio(18,15,16)

# 1) Ingresar Datos de empleado horas trabajo, pago hora y calcular
# sueldo básico, descuento 12% y mostrar sueldo neto
sueldo_neto<-function(horas,pago){
  basico<-horas*pago
  descuento<-basico*0.12
  return(basico-descuento)
}

cat("Sueldo Neto es S/", neto(80,35))
cat("Sueldo Neto es S/", neto(90,25))


# 2) Ingresar el precio producción e interés a ganar y mostrar
# el precio de venta

precio_venta<-function(precio,interes){
  return(precio*(1+interes/100))
}

cat("Precio venta es S/", precio_venta(3500,15))

cat("Nombre: Renzo José \nApellidos: Chan Rios \nProfesioón=Ingeniero")

# Calcular detalle de liquidación de empleado. Según los datos ingresados
# empleado, sueldo básico, años de servicio y número de hijos. Calcular:
# a. Liquidación: 65% de sueldo por años de servicio
# b. CTS: 30% de liquidación
# c. Asignación familiar: por hijos el 5% de sueldo por años de servicio
# d. Neto: Liquidación + CTS + Asignación Familiar
# Mostrar Liquidación neta

liquidacion_neta<-function(sueldoBasico,añosServicio,numeroHijos){
  liquidacion = 0.65*sueldoBasico*añosServicio
  cts<-0.3*liquidacion
  asignacionFamiliar<-0.5*sueldoBasico*añosServicio
  neto=liquidacion + cts + asignacionFamiliar
  return(cat("Liquidación es S/", liquidacion,"\nCTS es S/",cts,
             "\nAsignación Familiar es S/", asignacionFamiliar,
             "\nLiquidación Neta es S/",neto))
}

liquidacion_neta(5500,10,2)
liquidacion_neta(3500,8,0)

# 5) Una empresa paga a sus vendedores un sueldo básico mensual de S/.300. 
# El sueldo bruto es igual al sueldo básico más una comisión, que es igual al 9% 
# del monto total vendido. Por ley, todo vendedor se somete a un descuento 
# del 11%. Diseñe un programa que calcule la comisión, el sueldo bruto, el 
# descuento y el sueldo neto de un vendedor de la empresa.


PAGOS_DSCTOS_VENDEDOR<-function(montoVentas){
  comision<-montoVentas*0.09
  sueldoBruto<-300 + comision
  descuento<-sueldoBruto*0.89
  sueldoNeto = sueldoBruto-descuento
  return(cat("Comision S/",comision,"\nSueldo bruto S/",sueldoBruto,
             "\nDescuento S/",descuento,"\nSueldo Neto S/", sueldoNeto))
  
}

PAGOS_DSCTOS_VENDEDOR(45000)
PAGOS_DSCTOS_VENDEDOR(29000)

# 6) Ingresar el monto de préstamo, interés a cobrar y cantidad de cuotas a pagar. 
# Mostrar el monto neto a pagar y monto de cuotas.

PROGRAMA_BANCO<-function(prestamo,interes,cuotas){
  neto<-prestamo*(1+interes/100)
  montocuota<-neto/cuotas
  return(cat("Monto a pagar s/", round(neto,1),"\nMonto Cuota es S/",
             round(montocuota,1)))
}

PROGRAMA_BANCO(60000,5,30)
PROGRAMA_BANCO(90000,8,25)


