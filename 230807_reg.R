# 6. ´Ü¼ø È¸±ÍºÐ¼®
colnames(df)
reg2 <- lm(ÃÑ¸ÅÃâ¾× ~ ÃÑ.ÇÒÀÎ.±Ý¾×, data = df)
summary(reg2)

"""
Call:
lm(formula = ÃÑ¸ÅÃâ¾× ~ ÃÑ.ÇÒÀÎ.±Ý¾×, data = df)

Residuals:
     Min       1Q   Median       3Q      Max 
-3992575 -3035497 -1764881   683756 61718234 

Coefficients:
              Estimate Std. Error t value Pr(>|t|)    
(Intercept)  5.780e+06  5.146e+05  11.232   <2e-16 ***
ÃÑ.ÇÒÀÎ.±Ý¾× 2.672e-01  1.644e+00   0.163    0.871    
---
Signif. codes:  0 ¡®***¡¯ 0.001 ¡®**¡¯ 0.01 ¡®*¡¯ 0.05 ¡®.¡¯ 0.1 ¡® ¡¯ 1

Residual standard error: 5816000 on 998 degrees of freedom
Multiple R-squared:  2.647e-05,	Adjusted R-squared:  -0.0009755 
F-statistic: 0.02642 on 1 and 998 DF,  p-value: 0.8709

"""

# 7. ´ÙÁß È¸±ÍºÐ¼®




# 8. ·ÎÁö½ºÆ½ È¸±ÍºÐ¼®







# 9. ´ÙÁß ·ÎÁö½ºÆ½ È¸±ÍºÐ¼®