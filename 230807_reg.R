# 6. �ܼ� ȸ�ͺм�
colnames(df)
reg2 <- lm(�Ѹ���� ~ ��.����.�ݾ�, data = df)
summary(reg2)

"""
Call:
lm(formula = �Ѹ���� ~ ��.����.�ݾ�, data = df)

Residuals: # Y
     Min       1Q   Median       3Q      Max 
-3992575 -3035497 -1764881   683756 61718234 

Coefficients: # ��Ÿ, y = B0(5.780e+06) + B1(2.672e-01) + e(error, ������)
              Estimate Std. Error t value Pr(>|t|)    
(Intercept)  5.780e+06  5.146e+05  11.232   <2e-16 ***
��.����.�ݾ� 2.672e-01  1.644e+00   0.163    0.871    
---
Signif. codes:  0 ��***�� 0.001 ��**�� 0.01 ��*�� 0.05 ��.�� 0.1 �� �� 1

Residual standard error: 5816000 on 998 degrees of freedom
Multiple R-squared:  2.647e-05 # ��պ��� �󸶳� �� �� �����ϴ°�,	Adjusted R-squared:  -0.0009755 
F-statistic: 0.02642 on 1 and 998 DF,  p-value: 0.8709

"""

# 7. ���� ȸ�ͺм�
reg3 <- lm(�Ѹ���� ~ �湮��
           +���.�����ֱ�
           +���α�.���.Ƚ��,
           data = df)
summary(reg3)

"""
Call:
lm(formula = �Ѹ���� ~ �湮�� + ���.�����ֱ� + 
    ���α�.���.Ƚ��, data = df)

Residuals:
      Min        1Q    Median        3Q       Max 
-18934144  -2151237   -888762    816338  52714711 

Coefficients:
                  Estimate Std. Error t value Pr(>|t|)    
(Intercept)      2241405.3   517224.1   4.334 1.62e-05 ***
�湮��          146224.8    10138.8  14.422  < 2e-16 ***
���.�����ֱ�        259.1      761.6   0.340    0.734    
���α�.���.Ƚ��   12310.2    19444.3   0.633    0.527    
---
Signif. codes:  0 ��***�� 0.001 ��**�� 0.01 ��*�� 0.05 ��.�� 0.1 �� �� 1

Residual standard error: 5126000 on 996 degrees of freedom
Multiple R-squared:  0.2248,	Adjusted R-squared:  0.2225 
F-statistic: 96.29 on 3 and 996 DF,  p-value: < 2.2e-16

"""



# 8. ������ƽ ȸ�ͺм�







# 9. ���� ������ƽ ȸ�ͺм�