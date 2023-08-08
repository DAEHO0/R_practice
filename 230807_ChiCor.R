# 4. 카이제곱 검정(F-Test)

chisq.test(df$성별, df$할인민감여부)
# 성별과 할인민감여부는 상관관계가 있을까?
# 성별에 따라 할인에 민감할까?

"""
Pearson's Chi-squared test with Yates' continuity correction

data:  df$성별 and df$할인민감여부
X-squared = 5.4044, df = 1, p-value = 0.02009
"""
# 

df_gen0 <- df[df$성별 == 0, ]
df_gen1 <- df[df$성별 == 1, ]
str(df_gen0)
str(df_gen1)
mean(df_gen0$할인민감여부)
mean(df_gen1$할인민감여부)

chisq.test(df_gen0$할인민감여부, df_gen1$할인민감여부)
# Error: 'x' and 'y' must have the same length

# 5. 상관관계 분석

help(cor)
cor(df$방문빈도, df$총매출액, method = "pearson")
# 방문빈도와 총매출액은 관련이 있을까?

# 결과: 0.4737282, -1 <= 피어슨 상관계수 <= 1, 1에 가까울수록 강한 상관관계를 나타낸다
#       방문빈도와 총매출액은 어느정도 상관관계가 있으나 강한 상관관계는 아니다

plot(df$방문빈도, df$총매출액) # 방문빈도에 따른 총매출액의 산점도
abline(lm(df$총매출액 ~ df$방문빈도, data = df), col = "blue") # abline(), 그래프나 선점도위에 직선을 그려줌
reg <- lm(총매출액 ~ 방문빈도, data = df) # 선형회귀분석, x(독립) = 방문빈도, y(종속) = 총매출액
summary(reg)
plot(reg)

"""
Call:
lm(formula = 총매출액 ~ 방문빈도, data = df)

Residuals:  # 잔차
      Min        1Q    Median        3Q       Max 
-18931365  -2152630   -895261    817111  52777858 

Coefficients: # 결정계수
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)  2551792     253151   10.08   <2e-16 ***
방문빈도      144307       8492   16.99   <2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 5122000 on 998 degrees of freedom
Multiple R-squared:  0.2244,	Adjusted R-squared:  0.2236 
F-statistic: 288.8 on 1 and 998 DF,  p-value: < 2.2e-16

"""

help(lm)