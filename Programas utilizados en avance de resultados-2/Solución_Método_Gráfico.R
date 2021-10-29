#install.packages("ggplot2")
library(ggplot2)

# Restricción respecto a la inversión de dinero
RI <- function(x) 131.25-1.25*x 

# Creación de la gráfica
p <- ggplot(data = data.frame(x = 0), aes(x = x)) +
  
  # Agregar ejes x e y
  geom_vline(xintercept = 0, colour = "black") +  
  geom_hline(yintercept = 0,colour = "black") + 
  
  # Agregar restricción respecto a la inversión de dinero
  stat_function(colour = "red", fun = RI, linetype = "solid") +
    
  # Agregar restricción respecto a la demanda del producto
  geom_vline(xintercept = 90, colour = "green") + 
  geom_hline(yintercept = 150,colour = "blue") +
  
  # especificar incrementos y límites del eje x e y 
  scale_x_continuous(breaks = seq(0, 200, 30), lim = c(0, 200)) + 
  scale_y_continuous(breaks = seq(0, 200, 30), lim = c(0, 200)) +
    
  # definir etiquetas
  labs(title = "Problema de Optimización",subtitle = "Método Gráfico",
       x = "Mango Verde",
       y = "Ciruela") + 
  
  theme_bw() # Agregar tema en blanco y negro

print(p) # Imprimir gráfica

# Definir región de solución factible
feasible_region = data.frame(x = c(0, 90,90,0), y = c(0, 0, 18.75, 131.25)) 

# Agregar región de solución factible a la gráfica
p <- p + geom_polygon(data = feasible_region, mapping = aes(x = x, y = y), fill = "#dddddd") +
  geom_point(data = feasible_region, aes(x = x, y = y), color = "Black") 

print(p) # Imprimir gráfica

# Solución óptima
p <- p + geom_point(aes(x = 90, y = 18.75), color = "red", size = 2.5) 

print(p) # Imprimir gráfica
