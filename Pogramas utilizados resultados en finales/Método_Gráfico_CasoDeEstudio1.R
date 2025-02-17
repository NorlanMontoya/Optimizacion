#install.packages("ggplot2")
library(ggplot2)

# Restricci�n respecto a la inversi�n de dinero
RI <- function(x) 131.25-1.25*x 

# Creaci�n de la gr�fica
p <- ggplot(data = data.frame(x = 0), aes(x = x)) +
  
  # Agregar ejes x e y
  geom_vline(xintercept = 0, colour = "black") +  
  geom_hline(yintercept = 0,colour = "black") + 
  
  # Agregar restricci�n respecto a la inversi�n de dinero
  stat_function(colour = "red", fun = RI, linetype = "solid") +
  
  # Agregar restricci�n respecto a la demanda del producto
  geom_vline(xintercept = 90, colour = "green") + 
  geom_hline(yintercept = 150,colour = "blue") +
  
  # especificar incrementos y l�mites del eje x e y 
  scale_x_continuous(breaks = seq(0, 200, 30), lim = c(0, 200)) + 
  scale_y_continuous(breaks = seq(0, 200, 30), lim = c(0, 200)) +
  
  # definir etiquetas
  labs(title = "Problema de Optimizaci�n",subtitle = "M�todo Gr�fico",
       x = "Mango Verde",
       y = "Ciruela") + 
  
  theme_bw() # Agregar tema en blanco y negro

print(p) # Imprimir gr�fica

# Definir regi�n de soluci�n factible
feasible_region = data.frame(x = c(0, 90,90,0), y = c(0, 0, 18.75, 131.25)) 

# Agregar regi�n de soluci�n factible a la gr�fica
p <- p + geom_polygon(data = feasible_region, mapping = aes(x = x, y = y), fill = "#dddddd") +
  geom_point(data = feasible_region, aes(x = x, y = y), color = "Black") 

print(p) # Imprimir gr�fica

# Soluci�n �ptima
p <- p + geom_point(aes(x = 90, y = 18.75), color = "red", size = 2.5) 

print(p) # Imprimir gr�fica