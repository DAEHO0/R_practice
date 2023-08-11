### Machine Learning ###

alpha <- read.csv("Ashopping.csv", fileEncoding = "EUC-KR")
View(alpha)

library(ggplot2)
library(lattice)
library(caret)
# Loading required package ggplot2 and lattice

set.seed(123)
# inTrain <- createDataPartition(data.frame$factor, p = .75, list = FALSE)

str(alpha$°í°´µî±Þ) # integer

alpha$°í°´µî±Þ <- as.factor(alpha$°í°´µî±Þ) # factor·Î º¯È¯
str(alpha$°í°´µî±Þ) # factor

