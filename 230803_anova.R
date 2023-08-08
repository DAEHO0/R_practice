# 3개 집단 간 이상 평균 비교 : ANOVA

data <- iris
str(data)

setosa <- data[data$Species == "setosa", ]  # setosa 변수에 Species가 setosa인 모든 열을 저장
versicolor <- data[data$Species == "versicolor", ]  # versicolor 변수에 Species가 versicolor인 모든 열을 저장

str(setosa) # setosa 변수의 구조
str(versicolor) # versicolor 변수의 구조

anova <- aov(Sepal.Length ~ Species, # Sepal.Length(꽃받침 길이)를 Species(종)에 따라 분석하고자 함
                                     # 종속변수 ~ 독립변수 형식으로 사용, 종에 따라 꽃받침 길이가 어떻게 다른지 분석
                                     # anova(분산분석) 결과를 anova 변수에 저장
             data = data) # 데이터는 iris 데이터가 저장된 data 변수를 사용

# 붓꽃의 종류에 따라서 꽃받침 길이는 다를까?

anova

"""
Call:
   aov(formula = Sepal.Length ~ Species, data = data)

Terms:
                 Species Residuals
Sum of Squares  63.21213  38.95620  # Species, Residuals 각각의 제곱합
Deg. of Freedom        2       147  # Species의 자유도는 2, 오차에 대한 자유도 147

Residual standard error: 0.5147894  # 잔차표준오차(RSE): 회귀분석에서 예측된 종속 변수 값과 
                                    # 실제 관측된 종속 변수 값 사이의 차이를 나타내는 잔차들의 표준 편차
Estimated effects may be unbalanced

"""
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
