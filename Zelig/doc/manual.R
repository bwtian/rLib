### R code from vignette source 'manual.Rnw'

###################################################
### code chunk number 1: loadLibrary
###################################################
library(Zelig)


###################################################
### code chunk number 2: Example.data
###################################################
 data(coalition)


###################################################
### code chunk number 3: Example.zelig
###################################################
 z.out <- zelig(duration ~ fract + numst2, model = "gamma", data = coalition)


###################################################
### code chunk number 4: Example.summary
###################################################
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


###################################################
### code chunk number 7: Example.summary
###################################################
summary(s.out)


###################################################
### code chunk number 8: gamma-ExamplePlot
###################################################
 plot(s.out)


###################################################
### code chunk number 9: Example.data
###################################################
 data(turnout)


###################################################
### code chunk number 10: Example.zelig
###################################################

 z.out1 <- zelig(vote ~ age + race,  model = "logit", data = turnout) 



###################################################
### code chunk number 11: Example.setx
###################################################
 x.out1 <- setx(z.out1, age = 36, race = "white")


###################################################
### code chunk number 12: Example.sim
###################################################
 s.out1 <- sim(z.out1, x = x.out1)


###################################################
### code chunk number 13: Example.summary
###################################################
 summary(s.out1)


###################################################
### code chunk number 14: logit-ExamplePlot
###################################################
 plot(s.out1)


###################################################
### code chunk number 15: FirstDifferences.setx
###################################################
 z.out2 <- zelig(vote ~ race + educate, model = "logit", data = turnout)
 x.high <- setx(z.out2, educate = quantile(turnout$educate, prob = 0.75))
 x.low <- setx(z.out2, educate = quantile(turnout$educate, prob = 0.25))


###################################################
### code chunk number 16: FirstDifferences.sim
###################################################
 s.out2 <- sim(z.out2, x = x.high, x1 = x.low)


###################################################
### code chunk number 17: FirstDifferences.summary
###################################################
 summary(s.out2)


###################################################
### code chunk number 18: logit-FirstDifferencesPlot
###################################################
 plot(s.out2)


###################################################
### code chunk number 19: ROC.zelig
###################################################
 z.out1 <- zelig(vote ~ race + educate + age, model = "logit", 
                  data = turnout)
 z.out2 <- zelig(vote ~ race + educate, model = "logit", data = turnout)


###################################################
### code chunk number 20: logit-ROCPlot
###################################################

rocplot(z.out1$y, z.out2$y, fitted(z.out1), fitted(z.out2))


###################################################
### code chunk number 21: Examples.data
###################################################
 data(macro)


###################################################
### code chunk number 22: Examples.zelig
###################################################
 z.out1 <- zelig(unem ~ gdp + capmob + trade, model = "ls", data = macro)


###################################################
### code chunk number 23: Examples.summary
###################################################
 summary(z.out1)


###################################################
### code chunk number 24: Examples.setx
###################################################
 x.high <- setx(z.out1, trade = quantile(macro$trade, 0.8))
 x.low <- setx(z.out1, trade = quantile(macro$trade, 0.2))


###################################################
### code chunk number 25: Examples.sim
###################################################
 s.out1 <- sim(z.out1, x = x.high, x1 = x.low)


###################################################
### code chunk number 26: Examples.summary.sim
###################################################
summary(s.out1)


###################################################
### code chunk number 27: Dummy.zelig
###################################################
 z.out2 <- zelig(unem ~ gdp + trade + capmob + as.factor(country), 
                  model = "ls", data = macro)


###################################################
### code chunk number 28: Dummy.setx
###################################################
 x.US <- setx(z.out2, country = "United States")
 x.Japan <- setx(z.out2, country = "Japan")


###################################################
### code chunk number 29: Dummy.sim
###################################################
 s.out2 <- sim(z.out2, x = x.US, x1 = x.Japan)


###################################################
### code chunk number 30: Example.data
###################################################
 data(sanction)


###################################################
### code chunk number 31: Example.zelig
###################################################
 z.out <- zelig(num ~ target + coop, model = "negbinom", data = sanction)


###################################################
### code chunk number 32: Example.summary
###################################################
summary(z.out)


###################################################
### code chunk number 33: Example.setx
###################################################
 x.out <- setx(z.out)


###################################################
### code chunk number 34: Example.sim
###################################################
 s.out <- sim(z.out, x = x.out)


###################################################
### code chunk number 35: Example.summary.sim
###################################################
summary(s.out)


###################################################
### code chunk number 36: negbinom-Example1Plot
###################################################
 plot(s.out)


###################################################
### code chunk number 37: Examples.data
###################################################
 data(macro)


###################################################
### code chunk number 38: Examples.zelig
###################################################
 z.out1 <- zelig(unem ~ gdp + capmob + trade, model = "normal", 
                  data = macro)


###################################################
### code chunk number 39: Examples.summary
###################################################
 summary(z.out1)


###################################################
### code chunk number 40: Examples.setx
###################################################
 x.high <- setx(z.out1, trade = quantile(macro$trade, 0.8))
 x.low <- setx(z.out1, trade = quantile(macro$trade, 0.2))


###################################################
### code chunk number 41: Examples.sim
###################################################
 s.out1 <- sim(z.out1, x = x.high, x1 = x.low)


###################################################
### code chunk number 42: Examples.summary.sim
###################################################
 summary(s.out1)


###################################################
### code chunk number 43: normal-ExamplesPlot
###################################################
 plot(s.out1)


###################################################
### code chunk number 44: Dummy.zelig
###################################################
 z.out2 <- zelig(unem ~ gdp + trade + capmob + as.factor(year) 
                  + as.factor(country), model = "normal", data = macro)


###################################################
### code chunk number 45: Dummy.setx
###################################################
### x.US <- try(setx(z.out2, country = "United States"),silent=T)
### x.Japan <- try(setx(z.out2, country = "Japan"),silent=T)


###################################################
### code chunk number 46: Dummy.sim
###################################################
### s.out2 <- try(sim(z.out2, x = x.US, x1 = x.Japan), silent=T)


###################################################
### code chunk number 47: Dummy.summary
###################################################
###try(summary(s.out2))


###################################################
### code chunk number 48: Example.data
###################################################
 data(sanction)


###################################################
### code chunk number 49: Example.zelig
###################################################
 z.out <- zelig(num ~ target + coop, model = "poisson", data = sanction)


###################################################
### code chunk number 50: Example.summary
###################################################
summary(z.out)


###################################################
### code chunk number 51: Example.setx
###################################################
 x.out <- setx(z.out)


###################################################
### code chunk number 52: Example.sim
###################################################
 s.out <- sim(z.out, x = x.out)


###################################################
### code chunk number 53: Example.summary.sim
###################################################
summary(s.out)


###################################################
### code chunk number 54: poisson-ExamplePlot
###################################################
 plot(s.out)


###################################################
### code chunk number 55: Examples.data
###################################################
 data(turnout)


###################################################
### code chunk number 56: Examples.zelig
###################################################
 z.out <- zelig(vote ~ race + educate,  model = "probit", data = turnout) 


###################################################
### code chunk number 57: Examples.summary
###################################################
 summary(z.out)


###################################################
### code chunk number 58: Examples.setx
###################################################
 x.out <- setx(z.out)


###################################################
### code chunk number 59: Examples.sim
###################################################
s.out <- sim(z.out, x = x.out)


###################################################
### code chunk number 60: Examples.summary.sim
###################################################
summary(s.out)


