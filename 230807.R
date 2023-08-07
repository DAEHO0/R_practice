setwd("/Users/daeho/Desktop/github/R_practice")
getwd()

read.csv("Ashopping.csv", fileEncoding = "EUC-KR")
read.csv("Ashopping2.csv", fileEncoding = "EUC-KR")

# 통계실무

df <- read.csv("Ashopping.csv", fileEncoding = "EUC-KR")
str(df)

"""
'data.frame':	1000 obs. of  21 variables:
 $ 고객ID          : int  1 2 3 4 5 6 7 8 9 10 ...
 $ 이탈여부        : int  1 1 1 1 1 1 1 1 1 1 ...
 $ 총매출액        : int  4963160 2271520 2484250 2778850 4437610 10720400 7228460 8790450 9759800 4077660 ...
 $ 구매금액대      : int  1 0 0 0 1 2 1 2 2 0 ...
                                .
                                .
                                .

"""
# 1. 평균, 분산, 표준편차
summary(df)
library(psych)
describe(df)
mean(df$총매출액)
var(df$총매출액)
sd(df$총매출액)

# 2. t-test
head(df$이탈여부, 30)
# View(df)

df1 <- df[df$이탈여부 == 1, ]
str(df1)

df2 <- df[df$이탈여부 == 0, ]
str(df2)

t.test(df1$X1회.평균매출액, 
       df2$X1회.평균매출액)

"""
	Welch Two Sample t-test

data:  df1$X1회.평균매출액 and df2$X1회.평균매출액
t = 6.8278, df = 385.59, p-value = 3.364e-11
alternative hypothesis: true difference in means is not equal to 0
95 percent confidence interval:
 124521.3 225237.4
sample estimates:
mean of x mean of y 
 474517.9  299638.6 
 
"""

mean(df1$X1회.평균매출액)
mean(df2$X1회.평균매출액)

t.test(df1$X1회.평균매출액, 
       df2$X1회.평균매출액, paired = T) # 오류: 모든 인수의 길이가 같지 않음

# 번외 paired t-test
df2bf <- df2[1:150, ]
df2af <- df2[151:300, ]
str(df2bf)
str(df2af)

t.test(df2bf$X1회.평균매출액,
       df2af$X1회.평균매출액,
       paired = T)
