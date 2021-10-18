#install.packages("ggplot2")
library(ggplot2)

p <- ggplot(data = data.frame(x = 0), aes(x = x)) + # contrucción del gráfico
  
geom_vline(xintercept = 90, colour = "green") + # agregar eje x 
geom_hline(yintercept = 150,colour = "blue") + # agregar eje y

scale_x_continuous(breaks = seq(0, 200, 30), lim = c(0, 200)) + # especificar incrementos y límites del eje x
scale_y_continuous(breaks = seq(0, 200, 30), lim = c(0, 200)) +# especificar incrementos y límites del eje y
  
labs(title = "Problema de Optimización",subtitle = "Método Gráfico",
       x = "Mango Verde",
       y = "Ciruelas") + # definir etiquetas
  
theme_bw() #agregar tema en blanco y negro

print(p) # imprimir gráfica

feasible_region = data.frame(x = c(0, 90,90,0), y = c(0, 0, 150, 150)) # definir región de solución factible

p <- p + geom_polygon(data = feasible_region, mapping = aes(x = x, y = y), fill = "#dddddd") +
  geom_point(data = feasible_region, aes(x = x, y = y), color = "Black") # agregar región de solución factible a la gráfica

print(p) # imprimir gráfica

p <- p + geom_point(aes(x = 90, y = 150), color = "red", size = 2) # solución óptima

print(p) # imprimir gráfica

