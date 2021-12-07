#install.packages("lpSolve")
library(lpSolve)

#Coeficientes de la función  objetivo 
problem.coef.obj <- c(200,100)

# Matriz de coeficientes de las restricciones
problem.coef.restr <- matrix (c(1,0,0,1,500,400), nrow = 3, byrow = TRUE)
problem.coef.restr

# vector de las direcciones
problem.coef.dir.restr <- c("<=","<=","<=")
problem.coef.dir.restr

# Vector de constantes de las restricciones
problem.term.restr <- c(90,150,52500)

# Función lp() que sirve para encontrar valor de la función objetivo
lp("max", problem.coef.obj, problem.coef.restr, problem.coef.dir.restr, 
   problem.term.restr)

# Valor de las variables de decisión
vd <- lp("max", problem.coef.obj,problem.coef.restr,problem.coef.dir.restr,
         problem.term.restr)
vd$solution