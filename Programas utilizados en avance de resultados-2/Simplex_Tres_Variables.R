#install.packages("lpSolve")
library(lpSolve)

#Coeficientes de la funci�n  objetivo 
problem.coef.obj <- c(200,100,100)

# Matriz de coeficientes de las restricciones
problem.coef.restr <- matrix (c(1,0,0,0,1,0,0,0,1,500,400,500), nrow = 4, byrow = TRUE)
problem.coef.restr

# vector de las direcciones
problem.coef.dir.restr <- c("<=","<=","<=","<=")
problem.coef.dir.restr

# Vector de constantes de las restricciones
problem.term.restr <- c(90,150,1200,100000)

# Funci�n lp() que sirve para encontrar valor de la funci�n objetivo
lp("max", problem.coef.obj, problem.coef.restr, problem.coef.dir.restr, 
   problem.term.restr)

# Valor de las variables de decisi�n
vd <- lp("max", problem.coef.obj,problem.coef.restr,problem.coef.dir.restr,
         problem.term.restr)
vd$solution

# Valor de las variables de decisi�n en n�meros enteros  
vde <- lp("max", problem.coef.obj,problem.coef.restr,problem.coef.dir.restr,
          problem.term.restr, compute.sens = TRUE, int.vec = c(1:3))

vde$solution
