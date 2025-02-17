#install.packages("ggplot2")
library(ggplot2)

p <- ggplot(data = data.frame(x = 0), aes(x = x)) + # contrucci�n del gr�fico
  
geom_vline(xintercept = 90, colour = "green") + # agregar eje x 
geom_hline(yintercept = 150,colour = "blue") + # agregar eje y

scale_x_continuous(breaks = seq(0, 200, 30), lim = c(0, 200)) + # especificar incrementos y l�mites del eje x
scale_y_continuous(breaks = seq(0, 200, 30), lim = c(0, 200)) +# especificar incrementos y l�mites del eje y
  
labs(title = "Problema de Optimizaci�n",subtitle = "M�todo Gr�fico",
       x = "Mango Verde",
       y = "Ciruelas") + # definir etiquetas
  
theme_bw() #agregar tema en blanco y negro

print(p) # imprimir gr�fica

feasible_region = data.frame(x = c(0, 90,90,0), y = c(0, 0, 150, 150)) # definir regi�n de soluci�n factible

p <- p + geom_polygon(data = feasible_region, mapping = aes(x = x, y = y), fill = "#dddddd") +
  geom_point(data = feasible_region, aes(x = x, y = y), color = "Black") # agregar regi�n de soluci�n factible a la gr�fica

print(p) # imprimir gr�fica

p <- p + geom_point(aes(x = 90, y = 150), color = "red", size = 2) # soluci�n �ptima

print(p) # imprimir gr�fica

