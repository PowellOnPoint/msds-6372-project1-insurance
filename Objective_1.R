wd <- getwd()
setwd(wd)
insurance <- read.csv("./data/insurance.csv")


insurance$sex <- as.factor(insurance$sex)
insurance$smoker <- as.factor(insurance$smoker)
insurance$region <- as.factor(insurance$region)
summary(insurance)


slr <- lm(log(charges) ~ smoker, data=insurance)
summary(slr)


fit1 <- lm(log(charges) ~ age + sex + bmi + children + smoker + region, data = insurance)
summary(fit1)
fit1
par(mfrow = c(2, 2))
plot(fit1)
#Residual vs Fitted plot  has a very obvious curved pattern and 2 bands. Additive model is probably missing complexity. Also showing constant variance issues
#Q-Q Plot Residuals show substantial departure from normality in the upper tail, with several large positive residuals.
#Residuals vs Leverage plot. Most observations have relatively low leverage

fit2 <- lm(log(charges) ~ age + sex + children + bmi * smoker + region * smoker, data = insurance)
summary(fit2)
#R2 slightly increase from fit1 to fit2(0.7679 -> 0.7849)
#Adjusted R2 also increase (0.7666 -> 0.7830)
anova(fit1, fit2)
# Adding BMI x Smoker and Region x Smoker interactions significantly improves the model compared with the additive model
par(mfrow = c(2, 2))
plot(fit2)
# Adding BMI x Smoker and Region x Smoker improved model fit, but residual diagnostics still issues with assumptions

fit_no_region<- lm(log(charges) ~ age + sex + children + bmi * smoker + region, data = insurance)#removing smoker region interaction
summary(fit_no_region)
#R2 minute decrease from 0.7849 -> 0.7835
#Adjusted R2 decrease from 0.7830 -> 0.7821
#This and EDA confirms that removing interaction from region x smoker is the step in the wrong direction
anova(fit_no_region, fit2)
#There is evidence that the relationship between smoking status and insurance charges differs by region.

fit_no_region2<- lm(log(charges) ~ age + sex + children + bmi + region* smoker, data = insurance) #removing bmi smoker interaction
summary(fit_no_region2)
#R2 minute decrease from 0.7849 -> 0.7721
#Adjusted R2 decrease from 0.7830 -> 0.7702
#This and EDA confirms that removing interaction from bmi x smoker is the step in the wrong direction
anova(fit_no_region2, fit2)
#There is strong evidence that the relationship between BMI and insurance charges differs by smoking status.

mlr <- lm(log(charges) ~ age + sex + children + bmi * smoker + region * smoker, data = insurance)
summary(mlr)
