### R code from vignette source 'manual-gee.Rnw'

###################################################
### code chunk number 1: loadLibrary
###################################################
library(Zelig)
library(MCMCpack)


###################################################
### code chunk number 2: Example.data
###################################################
data(coalition)


###################################################
### code chunk number 3: Example.cluster
###################################################
coalition$cluster <- c(rep(c(1:62),5),rep(c(63),4))
sorted.coalition <- coalition[order(coalition$cluster),]


###################################################
### code chunk number 4: Example.zelig
###################################################
z.out <- zelig(duration ~ fract + numst2, model = "gamma.gee", id = "cluster", data = sorted.coalition, robust=TRUE, corstr="exchangeable")
summary(z.out)


###################################################
### code chunk number 5: Example.setx
###################################################
x.low <- setx(z.out, numst2 = 0)
x.high <- setx(z.out, numst2 = 1)


###################################################
### code chunk number 6: Example.sim
###################################################
s.out <- sim(z.out, x = x.low, x1 = x.high)
summary(s.out)


###################################################
### code chunk number 7: ExamplePlot
###################################################
plot(s.out)


###################################################
### code chunk number 8: Example.data
###################################################
data(turnout)


###################################################
### code chunk number 9: Example.cluster
###################################################
turnout$cluster <- rep(c(1:200),10)


###################################################
### code chunk number 10: Example.sort
###################################################
sorted.turnout <- turnout[order(turnout$cluster),]


###################################################
### code chunk number 11: Example.zelig
###################################################
z.out1 <- zelig(vote ~ race + educate, model = "logit.gee", id = "cluster", data = sorted.turnout, robust = TRUE, corstr = "stat_M_dep", Mv=3)


###################################################
### code chunk number 12: Example.setx
###################################################
x.out1 <- setx(z.out1)


###################################################
### code chunk number 13: Example.sim
###################################################
s.out1 <- sim(z.out1, x = x.out1)


###################################################
### code chunk number 14: Example.summary.sim
###################################################
summary(s.out1)


###################################################
### code chunk number 15: ExamplePlot
###################################################
plot(s.out1)


###################################################
### code chunk number 16: FirstDifference.setx
###################################################
x.high <- setx(z.out1, educate = quantile(turnout$educate, prob = 0.75))
x.low <- setx(z.out1, educate = quantile(turnout$educate, prob = 0.25))


###################################################
### code chunk number 17: FirstDifference.sim
###################################################
s.out2 <- sim(z.out1, x = x.high, x1 = x.low)


###################################################
### code chunk number 18: FirstDifference.summary.sim
###################################################
summary(s.out2)


###################################################
### code chunk number 19: FirstDifferencePlot
###################################################
plot(s.out2)


###################################################
### code chunk number 20: Example2.corr
###################################################
corr.mat <- matrix(rep(0.5,100), nrow=10, ncol=10)
diag(corr.mat) <- 1


###################################################
### code chunk number 21: Example2.zelig
###################################################
z.out2 <- zelig(vote ~ race + educate, model = "logit.gee", id = "cluster", data = sorted.turnout, robust = TRUE, corstr = "fixed", R=corr.mat)


###################################################
### code chunk number 22: Example2.summary
###################################################
summary(z.out2)


###################################################
### code chunk number 23: Example.data
###################################################
data(macro)


###################################################
### code chunk number 24: Example.zelig
###################################################
z.out <- zelig(unem ~ gdp + capmob + trade, model = "normal.gee", id = "country", data = macro, robust=TRUE, corstr="AR-M", Mv=1)
summary(z.out)


###################################################
### code chunk number 25: Example.setx
###################################################
x.high <- setx(z.out, trade = quantile(macro$trade, 0.8))
x.low <- setx(z.out, trade = quantile(macro$trade, 0.2))


###################################################
### code chunk number 26: Example.sim
###################################################
s.out <- sim(z.out, x = x.high, x1 = x.low)


###################################################
### code chunk number 27: Example.summary.sim
###################################################
summary(s.out)


###################################################
### code chunk number 28: ExamplePlot
###################################################
plot(s.out)


###################################################
### code chunk number 29: Example.data
###################################################
data(sanction)


###################################################
### code chunk number 30: Example.cluster
###################################################
sanction$cluster <- c(rep(c(1:15),5),rep(c(16),3))


###################################################
### code chunk number 31: Example.sort
###################################################
sorted.sanction <- sanction[order(sanction$cluster),]


###################################################
### code chunk number 32: Example.zelig
###################################################
z.out <- zelig(num ~ target + coop, model = "poisson.gee", id = "cluster", data = sorted.sanction, robust=TRUE, corstr="exchangeable")
summary(z.out)


###################################################
### code chunk number 33: Example.setx
###################################################
x.out <- setx(z.out)


###################################################
### code chunk number 34: Example.sim
###################################################
s.out <- sim(z.out, x = x.out)
summary(s.out)


###################################################
### code chunk number 35: ExamplePlot
###################################################
plot(s.out)


###################################################
### code chunk number 36: Example.data
###################################################
data(turnout)


###################################################
### code chunk number 37: Example.cluster
###################################################
turnout$cluster <- rep(c(1:200),10)


###################################################
### code chunk number 38: Example.sort
###################################################
sorted.turnout <- turnout[order(turnout$cluster),]


###################################################
### code chunk number 39: Example.zelig
###################################################
z.out1 <- zelig(vote ~ race + educate, model = "probit.gee", id = "cluster", data = sorted.turnout, robust = TRUE, corstr = "stat_M_dep", Mv=3)


###################################################
### code chunk number 40: Example.setx
###################################################
x.out1 <- setx(z.out1)


###################################################
### code chunk number 41: Example.sim
###################################################
s.out1 <- sim(z.out1, x = x.out1)


###################################################
### code chunk number 42: Example.summary.sim
###################################################
summary(s.out1)


###################################################
### code chunk number 43: ExamplePlot
###################################################
plot(s.out1)


###################################################
### code chunk number 44: manual-gee.Rnw:1346-1347
###################################################
options(width=80)


###################################################
### code chunk number 45: FirstDifference.setx
###################################################
x.high <- setx(z.out1, educate = quantile(turnout$educate, prob = 0.75))
x.low <- setx(z.out1, educate = quantile(turnout$educate, prob = 0.25))


###################################################
### code chunk number 46: FirstDifference.sim
###################################################
s.out2 <- sim(z.out1, x = x.high, x1 = x.low)


###################################################
### code chunk number 47: FirstDifference.summary.sim
###################################################
summary(s.out2)


###################################################
### code chunk number 48: FirstDifferencePlot
###################################################
plot(s.out2)


###################################################
### code chunk number 49: manual-gee.Rnw:1373-1374
###################################################
options(width=75)


###################################################
### code chunk number 50: Example2.corr
###################################################
corr.mat <- matrix(rep(0.5,100), nrow=10, ncol=10)
diag(corr.mat) <- 1


###################################################
### code chunk number 51: Example2.zelig
###################################################
z.out2 <- zelig(vote ~ race + educate, model = "probit.gee", id = "cluster", data = sorted.turnout, robust = TRUE, corstr = "fixed", R=corr.mat)


###################################################
### code chunk number 52: Example2.summary
###################################################
summary(z.out2)


