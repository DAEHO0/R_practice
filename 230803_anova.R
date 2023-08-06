# 3개 집단 간 이상 평균 비교 : ANOVA

data <- iris
str(data)

setosa <- data[data$Species == "setosa", ]  # setosa 변수에 Species가 setosa인 모든 열을 저장
versicolor <- data[data$Species == "versicolor", ]  # versicolor 변수에 Species가 versicolor인 모든 열을 저장

str(setosa) # setosa 변수의 구조
str(versicolor) # versicolor 변수의 구조

anova <- aov(Sepal.Length ~ Species, data = data)
summary(anova)

"""
 Df Sum Sq Mean Sq F value Pr(>F)    
Species       2  63.21  31.606   119.3 <2e-16 ***
Residuals   147  38.96   0.265                   
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

"""

# 사후분석
install.packages("DescTools", binary = T, dependencies = T)
library(DescTools)

help("PostHocTest")

PostHocTest(anova,
            method = "hsd",
            conf.level = 0.95)

"""
 Posthoc multiple comparisons of means : Tukey HSD 
    95% family-wise confidence level

$Species
                      diff    lwr.ci    upr.ci    pval    
versicolor-setosa    0.930 0.6862273 1.1737727 3.4e-14 ***
virginica-setosa     1.582 1.3382273 1.8257727 3.0e-15 ***
virginica-versicolor 0.652 0.4082273 0.8957727 8.3e-09 ***

---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

"""
