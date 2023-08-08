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
Estimated effects may be unbalanced # 추정된 효과들이 불균형할 수 있다
                                    # 즉, 각각의 카테고리가 불균형하게 분포될수 있다

"""
summary(anova)

"""                                                 # Sum Sq: 제곱합, Mean Sq: 평균제곱합
              Df Sum Sq Mean Sq F value Pr(>F)      # F value: F-통계량, Pr(>F): p-value
Species       2  63.21  31.606   119.3 <2e-16 ***
Residuals   147  38.96   0.265                   
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

* F-value: 분산분석(ANOVA)에 사용되는 통계량으로 독립변수의 그룹 간 변동과 그룹 내 변동 비율을 나타내는 값
           F-value가 크면 그룹 간 변동이 그룹 내 변동에 비해 상대적으로 큰 영향을 미치는 것을 의미
           반대로 F-value가 작으면 그룹간 변동이 그룹 내 변동보다 작아 그룹들 간 차이가 없다는 것을 의미
"""

# 내 생각: F-value가 119.3으로 F-value가 크다고 판단하며 이는 그룹간 변동이 크다는 것을 의미한다
#          p-value는 2e-16으로 0.05보다 작아 대립가설을 채택할 수 있다

# 사후분석
install.packages("DescTools", binary = T, dependencies = T)
library(DescTools)

help("PostHocTest")

PostHocTest(anova,
            method = "hsd",
            conf.level = 0.95)

"""
 Posthoc multiple comparisons of means : Tukey HSD # 투키 크레이머 또??? 투키 HSD 테스트
                                                   # 분산분석(ANOVA)등에서 주로 사용하는 다중비교 절차 및 통계검정
    95% family-wise confidence level

$Species
                      diff    lwr.ci    upr.ci    pval
versicolor-setosa    0.930 0.6862273 1.1737727 3.4e-14 ***
virginica-setosa     1.582 1.3382273 1.8257727 3.0e-15 ***
virginica-versicolor 0.652 0.4082273 0.8957727 8.3e-09 ***

# diff: 그룹 간의 평균 차이
# lwr.ci(lower confidence interval): 신뢰구간의 하한값
# upr.ci(upper confidence interval): 신뢰구간이 상한값
# p-value: 그룹 간의 평균 차이가 통계적으로 유의미한지 나타냄
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
"""

# 내 생각: versicolor와 setosa 그룹의 평균 차는 0.930이고 신뢰구간은 0.6862273에서 1.1737727 사이에 위치한다
#          p-value는 3.4e-14로 0.05보다 작기 때문에 대립가설을 채택할 수 있으며 이는 versicolor와 setosa 그룹의
#          평균 차이는 통계적으로 유의미하다고 해석할 수 있다
