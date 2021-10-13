#install.packages("boot")
library(boot)
coefFuncionZ <- c(200,100)
matrizRestriccionesMenorOIgual <- matrix(c(1,0,0,1),2,2,byrow=TRUE)
vectorTermIndep <- c(90,150)
mySimplex <- simplex(coefFuncionZ, A1 = matrizRestriccionesMenorOIgual, b1= vectorTermIndep, 
                     maxi=TRUE )
mySimplex