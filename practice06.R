#########################################################
#### PRACTICE 06 LINEAR REGRESSION ######################
#########################################################

# the same data frame as in class06.R
# choose independent variables and look at
# correlations

indep <- flats %>% 
  select(livesp, kitsp, dist, metrdist)
cor(indep)

# fit and describe the model
model1 <- lm(data = flats, 
             price ~ livesp + kitsp + dist + metrdist)
summary(model1)

# get diagnostic plots
# press Enter to list plots in Plots window
plot(model1)

# get residuals and predicted values
# create plots via ggplot2
# checks for heteroskedasticity

flats$res <- model1$residuals
flats$predicted <- model1$fitted.values 

ggplot(data = flats, aes(x = metrdist, y = res)) + 
  geom_point() + 
  geom_hline(yintercept = 0, color = "red") + 
  theme_bw()

ggplot(data = flats, aes(x = predicted, y = res)) + 
  geom_point() +
  geom_hline(yintercept = 0, color = "red") + 
  theme_bw()

# checks for heteroskedasticity
# Breush-Pagan test
# H0: no heteroskedasticity (homoskedasticity)

library(lmtest)
bptest(model1)

# if heteroskedasticity is detected,
# use corrected standard errors of coeffs
# coeftest() from lmtest
# vcov() from sandwich

library(sandwich)
coeftest(model1, 
         vcov = vcov(model1, type = "HC1"))

# checks for normality
hist(flats$res)
shapiro.test(flats$res)

# diagnostic plots via ggfortify
# extended version of plot(), 
# with ggplot2 styles

library(ggfortify)
autoplot(model1, which = 4:5)
autoplot(model1, which = 1:2)

# by default first two
autoplot(model1)
