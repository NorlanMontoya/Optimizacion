#install.packages("lpSolve")
library(lpSolve)

#Coeficientes de la función  objetivo 
problem.coef.obj <- c(200,100,100)

# Matriz de coeficientes de las restricciones
problem.coef.restr <- matrix (c(1,0,0,0,1,0,0,0,1,500,400,500), nrow = 4, byrow = TRUE)
problem.coef.restr

# vector de las direcciones
problem.coef.dir.restr <- c("<=","<=","<=","<=")
problem.coef.dir.restr

# Vector de constantes de las restricciones
problem.term.restr <- c(36,60,480,2000)

# Función lp() que sirve para encontrar valor de la función objetivo
lp("max", problem.coef.obj, problem.coef.restr, problem.coef.dir.restr, 
   problem.term.restr)

# Valor de las variables de decisión
vd <- lp("max", problem.coef.obj,problem.coef.restr,problem.coef.dir.restr,
         problem.term.restr)
vd$solution

# Valor de las variables de decisión convertida a enteros 
vde <- lp("max", problem.coef.obj,problem.coef.restr,problem.coef.dir.restr,
          problem.term.restr, compute.sens = TRUE, int.vec = c(1:3))
vde$solution

#______________________________________________________________________________
#                          Solución óptima regulada
#_______________________________________________________________________________

# Tiempo de durabilidad de cada producto
TD <- cbind(3,4,2)
TD

#Regulador de compra para cada producto
RC <-cbind(1-1/TD[1],1-1/TD[2],1-1/TD[3])
RC

# Valor de las variables de decisión reguladas
VDR <- cbind(vde$solution[1]*RC[1],vde$solution[2]*RC[2],vde$solution[3]*RC[3])
VDR

#Valor de las variables de decisión reguladas convertida a enteros
VDRE <- as.integer(VDR)
VDRE

#Valor de la función objetivo regulada
VFOR <- problem.coef.obj%*%VDRE
VFOR
