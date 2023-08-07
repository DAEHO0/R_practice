# 6. 단순 회귀분석
colnames(df)
reg2 <- lm(총매출액 ~ 총.할인.금액, data = df)
summary(reg2)

"""
Call:
lm(formula = 총매출액 ~ 총.할인.금액, data = df)

Residuals: # Y
     Min       1Q   Median       3Q      Max 
-3992575 -3035497 -1764881   683756 61718234 

Coefficients: # 베타, y = B0(5.780e+06) + B1(2.672e-01) + e(error, 오차항)
              Estimate Std. Error t value Pr(>|t|)    
(Intercept)  5.780e+06  5.146e+05  11.232   <2e-16 ***
총.할인.금액 2.672e-01  1.644e+00   0.163    0.871    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 5816000 on 998 degrees of freedom
Multiple R-squared:  2.647e-05 # 평균보다 얼마나 더 잘 설명하는가,	Adjusted R-squared:  -0.0009755 
F-statistic: 0.02642 on 1 and 998 DF,  p-value: 0.8709

"""

# 7. 다중 회귀분석
reg3 <- lm(총매출액 ~ 방문빈도
           +평균.구매주기
           +할인권.사용.횟수,
           data = df)
summary(reg3)

"""
Call:
lm(formula = 총매출액 ~ 방문빈도 + 평균.구매주기 + 
    할인권.사용.횟수, data = df)

Residuals:
      Min        1Q    Median        3Q       Max 
-18934144  -2151237   -888762    816338  52714711 

Coefficients:
                  Estimate Std. Error t value Pr(>|t|)    
(Intercept)      2241405.3   517224.1   4.334 1.62e-05 ***
방문빈도          146224.8    10138.8  14.422  < 2e-16 ***
평균.구매주기        259.1      761.6   0.340    0.734    
할인권.사용.횟수   12310.2    19444.3   0.633    0.527    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 5126000 on 996 degrees of freedom
Multiple R-squared:  0.2248,	Adjusted R-squared:  0.2225 
F-statistic: 96.29 on 3 and 996 DF,  p-value: < 2.2e-16

"""



# 8. 로지스틱 회귀분석







# 9. 다중 로지스틱 회귀분석