#______________________________________________________________________________
# Solución óptima Ideal,Tomando en cuenta la unidad de compra/venta en "Unidades"
#_______________________________________________________________________________

#install.packages("lpSolve")
library(lpSolve)

#Coeficientes de la función  objetivo 
problem.coef.obj <- c(1,0.5,0.6,1.2,0.6)

# Matriz de coeficientes de las restricciones
problem.coef.restr <- matrix (c(1,0,0,0,0,
                                0,1,0,0,0,
                                0,0,1,0,0,
                                0,0,0,1,0,
                                0,0,0,0,1,
                                1,0.5,1,1.8,0.4), nrow = 6, byrow = TRUE)
problem.coef.restr

# vector de las direcciones
problem.coef.dir.restr <- c("<=","<=","<=","<=","<=","<=")
problem.coef.dir.restr

# Vector de constantes de las restricciones
problem.term.restr <- c(20000,40000,200000,100000,24000,5000)

# Función lp() que sirve para encontrar valor de la función objetivo
lp("max", problem.coef.obj, problem.coef.restr, problem.coef.dir.restr, 
   problem.term.restr)

# Valor de las variables de decisión
vd <- lp("max", problem.coef.obj,problem.coef.restr,problem.coef.dir.restr,
         problem.term.restr)
vd$solution
