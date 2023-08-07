# 4. 카이제곱 검정(F-Test)

chisq.test(df$성별, df$할인민감여부)

"""
Pearson's Chi-squared test with Yates' continuity correction

data:  df$성별 and df$할인민감여부
X-squared = 5.4044, df = 1, p-value = 0.02009


"""

df_gen0 <- df[df$성별 == 0, ]
df_gen1 <- df[df$성별 == 1, ]
str(df_gen0)
str(df_gen1)
mean(df_gen0$할인민감여부)
mean(df_gen1$할인민감여부)


# 5. 상관관계 분석

help(cor)
cor(df$방문빈도, df$총매출액, method = "pearson")
# 0.4737282 # 양의 상관관계이나 강하지 않다
plot(df$방문빈도, df$총매출액)
abline(lm(df$방문빈도 ~ df$총매출액), col = "blue")
reg <- lm(총매출액 ~ 방문빈도, data = df)
summary(reg)

"""
Call:
lm(formula = 총매출액 ~ 방문빈도, data = df)

Residuals:
      Min        1Q    Median        3Q       Max 
-18931365  -2152630   -895261    817111  52777858 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)  2551792     253151   10.08   <2e-16 ***
방문빈도      144307       8492   16.99   <2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 5122000 on 998 degrees of freedom
Multiple R-squared:  0.2244,	Adjusted R-squared:  0.2236 
F-statistic: 288.8 on 1 and 998 DF,  p-value: < 2.2e-16


"""
