#################################################################
###Path Analysis Examples: Example 2 Baseball fan
#Software Versions Environment of this script
###R4.2.2(64bit version)
###Package lavaan0.6-17
###Package semPlot 1.1.6
#################################################################

#getwd()
#setwd("~")
#setwd("C:\\Users\\Owner\\EDRE6664_SEM_w_lavaan_Gana_and_Broc")

#Read in Packages
library(lavaan)
library(semPlot)

###Path Analysis ####
# Example 2: Baseball Fan: Non-recursive model example ####
#Read in data
# x1: Husband's Father; X2: Wife's father; x3: Husband; x4: Wife

data2 <- read.csv("dat/fan.csv")
model2 <- ' x3 ~ x1 + x4
            x4 ~ x2 + x3'

fit2 <- sem(model2, data=data2)
summary(fit2, standardized=T, fit.measures=T, rsq=T)


#Draw Path Diagram
## In order to see the bi-directional arrows, we need layout="spring"
semPaths(fit2, whatLabels="stand", 
style= "lisrel",layout="spring",
sizeMan=12,edge.label.cex=1.0,
nCharNodes=0,curve=1.5,mar=c(7,7,7,3),
manifest=c("x1","x3","x2","x4"),
nodeLabels=c("Husband_Father","Husband","Wife_Father","Wife"))

## Model 3
model3 <- ' x3 ~ x1 + x2+ x4
            x4 ~ x2 + x3'

fit3 <- sem(model3, data=data2)
summary(fit3, standardized=T, fit.measures=T, rsq=T)

semPaths(fit3, whatLabels="stand", 
         style= "lisrel",layout="spring",
         sizeMan=12,edge.label.cex=1.0,
         nCharNodes=0,curve=1.5,mar=c(7,7,7,3),
         manifest=c("x1","x3","x2","x4"),
         nodeLabels=c("Husband_Father","Husband","Wife_Father","Wife"))

## Model 4
model4 <- ' x3 ~ x1 + x4
            x4 ~ x1+ x2 + x3'

fit4 <- sem(model4, data=data2)
summary(fit4, standardized=T, fit.measures=T, rsq=T)

semPaths(fit4, whatLabels="stand", 
         style= "lisrel",layout="spring",
         sizeMan=12,edge.label.cex=1.0,
         nCharNodes=0,curve=1.5,mar=c(7,7,7,3),
         manifest=c("x1","x3","x2","x4"),
         nodeLabels=c("Husband_Father","Husband","Wife_Father","Wife"))

## Model 5
model5 <- ' x3 ~ x1 + x2 + x4
            x4 ~ x1+ x2 + x3'

fit5 <- sem(model5, data=data2)
summary(fit5, standardized=T, fit.measures=T, rsq=T)

semPaths(fit5, whatLabels="stand", 
         style= "lisrel",layout="spring",
         sizeMan=12,edge.label.cex=1.0,
         nCharNodes=0,curve=1.5,mar=c(7,7,7,3),
         manifest=c("x1","x3","x2","x4"),
         nodeLabels=c("Husband_Father","Husband","Wife_Father","Wife"))
