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