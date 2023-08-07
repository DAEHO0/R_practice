# 3. ANOVA test

summary(df$구매유형)
help('aov')
str(df)
colnames(df)
aov(평균.구매주기 ~ 구매유형, data = df)

"""
Call:
   aov(formula = 평균.구매주기 ~ 구매유형, data = df)

Terms:
                구매유형 Residuals
Sum of Squares    221938  64268831
Deg. of Freedom        1       998

Residual standard error: 253.7669
Estimated effects may be unbalanced

"""

anova <- aov(평균.구매주기 ~ 구매유형, data = df)
summary(anova)
