### R code from vignette source 'manual-bayes.Rnw'

###################################################
### code chunk number 1: loadLibrary
###################################################
library(Zelig)
library(MCMCpack)


###################################################
### code chunk number 2: BasicExample.data
###################################################
 data(turnout)


###################################################
### code chunk number 3: BasicExample.zelig
###################################################
 z.out <- zelig(vote ~ race + educate, model = "logit.bayes",
                  data = turnout, verbose = FALSE)


###################################################
### code chunk number 4: BasicExample.geweke
###################################################
 geweke.diag(z.out$result$coefficients)


###################################################
### code chunk number 5: BasicExample.heidel
###################################################
 heidel.diag(z.out$result$coefficients)


###################################################
### code chunk number 6: BasicExample.raftery
###################################################
 raftery.diag(z.out$result$coefficients)


###################################################
### code chunk number 7: BasicExample.summary.zout
###################################################
summary(z.out)


###################################################
### code chunk number 8: BasicExample.setx
###################################################
 x.out <- setx(z.out)


###################################################
### code chunk number 9: BasicExample.sim
###################################################
 s.out1 <- sim(z.out, x = x.out)


###################################################
### code chunk number 10: BasicExample.summary.sim
###################################################
summary(s.out1)


###################################################
### code chunk number 11: FirstDifferences.setx.high
###################################################
 x.high <- setx(z.out, educate = quantile(turnout$educate, prob = 0.75))


###################################################
### code chunk number 12: FirstDifferences.setx.low
###################################################
x.low <- setx(z.out, educate = quantile(turnout$educate, prob = 0.25))


###################################################
### code chunk number 13: FirstDifferences.sim
###################################################
s.out2 <- sim(z.out, x = x.high, x1 = x.low)


###################################################
### code chunk number 14: FirstDifferences.summary
###################################################
summary(s.out2)


###################################################
### code chunk number 15: BasicExample.data
###################################################
 data(mexico)


###################################################
### code chunk number 16: BasicExample.zelig
###################################################
 z.out <- zelig(vote88 ~ pristr + othcok + othsocok, model = "mlogit.bayes", 
               data = mexico)


###################################################
### code chunk number 17: BasicExample.heidel
###################################################
 heidel.diag(z.out$result$coefficients)


###################################################
### code chunk number 18: BasicExample.raftery
###################################################
raftery.diag(z.out$result$coefficients)


###################################################
### code chunk number 19: BasicExample.summary
###################################################
summary(z.out)


###################################################
### code chunk number 20: BasicExample.setx
###################################################
 x.out <- setx(z.out)


###################################################
### code chunk number 21: BasicExample.sim
###################################################
 s.out1 <- sim(z.out, x = x.out)


###################################################
### code chunk number 22: BasicExample.summary.sim
###################################################
summary(s.out1)


###################################################
### code chunk number 23: FirstDifferences.setx
###################################################
 x.weak <- setx(z.out, pristr = 1)
 x.strong <- setx(z.out, pristr = 3)


###################################################
### code chunk number 24: FirstDifferences.sim
###################################################
s.out2 <- sim(z.out, x = x.strong, x1 = x.weak)


###################################################
### code chunk number 25: FirstDifferences.summary
###################################################
summary(s.out2)


###################################################
### code chunk number 26: BasicExample.data
###################################################
 data(macro)


###################################################
### code chunk number 27: BasicExample.zelig
###################################################
z.out <- zelig(unem ~ gdp + capmob + trade, model = "normal.bayes",
                  data = macro, verbose = FALSE)


###################################################
### code chunk number 28: BasicExample.geweke
###################################################
 geweke.diag(z.out$result$coefficients)


###################################################
### code chunk number 29: BasicExample.heidel
###################################################
heidel.diag(z.out$result$coefficients)


###################################################
### code chunk number 30: BasicExample.raftery
###################################################
raftery.diag(z.out$result$coefficients)


###################################################
### code chunk number 31: BasicExample.summary
###################################################
summary(z.out) 


###################################################
### code chunk number 32: BasicExample.setx
###################################################
 x.out <- setx(z.out)


###################################################
### code chunk number 33: BasicExample.sim
###################################################
 s.out1 <- sim(z.out, x = x.out)


###################################################
### code chunk number 34: BasicExample.summary.sim
###################################################
summary(s.out1)


###################################################
### code chunk number 35: FirstDifferences.setx
###################################################
 x.high <- setx(z.out, trade = quantile(macro$trade, prob = 0.8))
 x.low <- setx(z.out, trade = quantile(macro$trade, prob = 0.2))


###################################################
### code chunk number 36: FirstDifferences.sim
###################################################
 s.out2 <- sim(z.out, x = x.high, x1 = x.low)


###################################################
### code chunk number 37: FirstDifferences.summary.sim
###################################################
 summary(s.out2)


###################################################
### code chunk number 38: BasicExample.data
###################################################
 data(sanction)


###################################################
### code chunk number 39: BasicExample.zelig
###################################################
 z.out <- zelig(ncost ~ mil + coop, model = "oprobit.bayes",
                  data = sanction, verbose = FALSE)


###################################################
### code chunk number 40: BasicExample.factor
###################################################
sanction$ncost <- factor(sanction$ncost, ordered = TRUE,
                         levels = c("net gain", "little effect", 
                         "modest loss", "major loss"))


###################################################
### code chunk number 41: BasicExample.heidel
###################################################
heidel.diag(z.out$result$coefficients)


###################################################
### code chunk number 42: BasicExample.raftery
###################################################
raftery.diag(z.out$result$coefficients)


###################################################
### code chunk number 43: BasicExample.summary
###################################################
summary(z.out) 


###################################################
### code chunk number 44: BasicExample.setx
###################################################
 x.out <- setx(z.out)


###################################################
### code chunk number 45: BasicExample.sim
###################################################
 s.out1 <- sim(z.out, x = x.out)
 summary(s.out1)


###################################################
### code chunk number 46: FirstDifferences.setx
###################################################
 x.high <- setx(z.out, mil=0)
 x.low <- setx(z.out, mil=1)


###################################################
### code chunk number 47: FirstDifferences.sim
###################################################
s.out2 <- sim(z.out, x = x.high, x1 = x.low)
 summary(s.out2)


###################################################
### code chunk number 48: BasicExample.data
###################################################
 data(sanction)


###################################################
### code chunk number 49: BasicExample.zelig
###################################################
 z.out <- zelig(num ~ target + coop, model = "poisson.bayes",
                  data = sanction, verbose = FALSE)


###################################################
### code chunk number 50: BasicExample.geweke
###################################################
 geweke.diag(z.out$result$coefficients)


###################################################
### code chunk number 51: BasicExample.heidel
###################################################
heidel.diag(z.out$result$coefficients)


###################################################
### code chunk number 52: BasicExample.raftery
###################################################
raftery.diag(z.out$result$coefficients)


###################################################
### code chunk number 53: BasicExample.summary
###################################################
summary(z.out)


###################################################
### code chunk number 54: BasicExample.setx
###################################################
 x.out <- setx(z.out)


###################################################
### code chunk number 55: BasicExample.sim
###################################################
 s.out1 <- sim(z.out, x = x.out)


###################################################
### code chunk number 56: BasicExample.summary.sim
###################################################
summary(s.out1)


###################################################
### code chunk number 57: FirstDifferences.setx
###################################################
 x.max <- setx(z.out, target = max(sanction$target))
 x.min <- setx(z.out, target = min(sanction$target))


###################################################
### code chunk number 58: FirstDifferences.sim
###################################################
 s.out2 <- sim(z.out, x = x.max, x1 = x.min)
 summary(s.out2)


###################################################
### code chunk number 59: BasicExample.data
###################################################
 data(turnout)


###################################################
### code chunk number 60: BasicExample.zelig
###################################################
 z.out <- zelig(vote ~ race + educate, model = "probit.bayes",
                  data = turnout, verbose = FALSE)


###################################################
### code chunk number 61: BasicExample.geweke
###################################################
 geweke.diag(z.out$result$coefficients)


###################################################
### code chunk number 62: BasicExample.heidel
###################################################
 heidel.diag(z.out$result$coefficients)


###################################################
### code chunk number 63: BasicExample.raftery
###################################################
raftery.diag(z.out$result$coefficients)


###################################################
### code chunk number 64: BasicExample.summary
###################################################
summary(z.out)


###################################################
### code chunk number 65: BasicExample.setx
###################################################
 x.out <- setx(z.out)


###################################################
### code chunk number 66: BasicExample.sim
###################################################
 s.out1 <- sim(z.out, x = x.out)


###################################################
### code chunk number 67: BasicExample.summary.sim
###################################################
summary(s.out1)


###################################################
### code chunk number 68: FirstDifferences.setx
###################################################
 x.high <- setx(z.out, educate = quantile(turnout$educate, prob = 0.75))
 x.low <- setx(z.out, educate = quantile(turnout$educate, prob = 0.25))


###################################################
### code chunk number 69: FirstDifferences.sim
###################################################
 s.out2 <- sim(z.out, x = x.high, x1 = x.low)


###################################################
### code chunk number 70: FirstDifferences.summary
###################################################
summary(s.out2)


