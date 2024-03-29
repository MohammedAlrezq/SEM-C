# 02/22/2024
# Chap 2: Path models and analysis
## 2.4 Indirect Effect P.31-31, 2.4.1 Example: Indirect Effect
## Beajean (2008)
## Impacts of Cognitive ability and Years of schooling on Salary

library(lavaan)  #LAtent VAriable ANalysis

#######################################################
## Step 1: Summary Data (covariance matrix) input ####
#######################################################

lower_cov <-   '648.07
                30.05 8.64
                140.18 25.57 233.21'
                
Dat_cov <- getCov(x=lower_cov,
                   names=c("salarly", "school", "IQ"))
Dat_cov

##################################
## Step2: Specify path model #####
##################################

beaujean.model <- '
#Structural model for Y
salarly~a*IQ+c*school
school~b*IQ

#define direct effect
dir:=a
#define indirect effect
ind:=b*c
#define total effect
total:=a +b*c
'
###################################
## Step3: Conduct SEM analysis ####
###################################

beaujean.result <- sem(beaujean.model, sample.cov=Dat_cov,
                         sample.nobs =300)


##############################
## Step4: get the results ####
##############################
summary(beaujean.result)
summary(beaujean.result, stand=TRUE)
#stand=TRUE prints standardized estimates too.
summary(beaujean.result, stand=TRUE,rsq=TRUE) 
#rsq=TRUE: report R-squared

summary(beaujean.result,ci=TRUE) 
#add confidence interval for each parameer estimate
summary(beaujean.result, fit.measures=TRUE)
# add overall fit indexes typically reported in SEM analysis
summary(beaujean.result, fit.measures=TRUE, standardized=TRUE, rsq=TRUE)





########################################
## Step4b: get the detailed results ####
########################################

#Output all the parameter estimates
parameterEstimates(beaujean.result, standardized=TRUE)
#Output all the standardized parameter estimates
standardizedSolution(beaujean.result, ci=TRUE)

########################################################
#Step5: draw path diagram#draw stdout()path diagram ####
########################################################
library(semPlot)

##Path diagram with minimum arguments
semPaths(object=beaujean.result) 
semPaths(object=beaujean.result, whatLabels = "est") 
#whatLabels="est" adds unstandardized estimated parameters
semPaths(object=beaujean.result, whatLabels="std") 
#whatLasbels="std" adds standardized estimated parameters

semPaths(object=beaujean.result, whatLabels="std", layout="tree", rotation=2) 
#bring exogenous variables to the left

semPaths(object=beaujean.result, whatLabels="std", layout="tree", rotation=2,
         edge.label.cex = 2.0) 
#change the font size for parameter estimates, default edge.label.cex=0.5

semPaths(object=beaujean.result, whatLabels="std", layout="tree", rotation=2,
         edge.label.cex = 2.0, nCharNodes = 0)
# nCharNodes = 0 means do not abbrebiate variable (i.e., node) names
# edge = line

semPaths(object=beaujean.result, whatLabels="std", layout="tree", rotation=2,
         edge.label.cex = 2.0, nCharNodes = 0, sizeMan=15)
# sizeMan=15
#Change the size of the rectangles of observed variables, default is 5.

semPaths(object=beaujean.result, whatLabels="std", layout="tree", rotation=2,
         edge.label.cex = 2.0, nCharNodes = 0, sizeMan=15, style="lisrel")

semPaths(object=beaujean.result, whatLabels="est", layout="tree", rotation=2,
         edge.label.cex = 2.0, nCharNodes = 0, sizeMan=15, style="lisrel")
# stule="lisrel" changes the double-headed arrow (ram style) to single-headed
# arrow (lisre style)

## confidence interval on indirect effect
library(semTools)
monteCarloCI(beaujean.result, plot=TRUE)

