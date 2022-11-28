#********** GRAFICOS EN R *************
#* session 04: 28/11/2022

# datos
x<-c(1,2,3,4,5)
y<-c(200,300,600,700,500)

# ver gráficos como vector
# ?plot
plot(x,y,type = "l")

# data frame
plot(data.frame(x,y),type = "l",col="green")

# formula
plot(y~x,type="l",col="blue",lwd=5)


# mostrar 3 graficos en 1
par(mfrow=c(1,3))
plot(x,y,type="s", main="Tipo S")
plot(x,y,type="b", main="Tipo b")
plot(x,y,type="o", main="Tipo o")









