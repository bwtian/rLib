### R code from vignette source 'Guide.Stex'

###################################################
### code chunk number 1: Guide.Stex:6-7
###################################################
 options(continue="  ")


###################################################
### code chunk number 2: Guide.Stex:13-15
###################################################
library("GPArotation") 
 


###################################################
### code chunk number 3: Guide.Stex:32-35
###################################################
  data(ability.cov)
  z <- factanal(factors = 2, covmat = ability.cov, rotation="oblimin")
  loadings(z)


