### R code from vignette source 'twosls.Rnw'

###################################################
### code chunk number 1: loadLibrary
###################################################
library(Zelig)


###################################################
### code chunk number 2: Inputs.list
###################################################
 fml <- list ("mu"  = Y ~ X + Z,
               "inst" = Z ~ W + X)


###################################################
### code chunk number 3: Examples.data
###################################################
 data(klein)


###################################################
### code chunk number 4: Examples.list
###################################################
 formula <- list(mu1=C~Wtot + P + P1,
               mu2=I~P + P1 + K1,
               mu3=Wp~ X + X1 + Tm,
               inst= ~ P1 + K1 + X1 + Tm + Wg + G)


###################################################
### code chunk number 5: Examples.zelig
###################################################
 z.out<-zelig(formula=formula, model="twosls",data=klein)
 summary(z.out)


###################################################
### code chunk number 6: Examples.setx
###################################################
 x.out <- setx(z.out)


###################################################
### code chunk number 7: Examples.sim
###################################################
s.out <-sim(z.out,x=x.out)
 summary(s.out)


###################################################
### code chunk number 8: Examplestwosls
###################################################
plot(s.out)


