setwd("/Users/daeho/Desktop/github/R_practice") # 내 맥의 작업 경로 지정
getwd() # 내 현재 작업 경로 불러오기

read.csv("Ashopping.csv", fileEncoding = "EUC-KR")
read.csv("Ashopping2.csv", fileEncoding = "EUC-KR")

# 통계실무
df <- read.csv("Ashopping.csv", fileEncoding = "EUC-KR") # Ashopping.csv 파일을 df 변수에 저장
str(df) # df의 구조 불러오기

"""
'data.frame':	1000 obs. of  21 variables:
 $ 고객ID          : int  1 2 3 4 5 6 7 8 9 10 ...
 $ 이탈여부        : int  1 1 1 1 1 1 1 1 1 1 ...
 $ 총매출액        : int  4963160 2271520 2484250 2778850 4437610 10720400 7228460 8790450 9759800 4077660 ...
 $ 구매금액대      : int  1 0 0 0 1 2 1 2 2 0 ...
                                .
                                .
                                .
# 총 1000가지 관측치와 21가지 변수
"""

# 1. 평균, 분산, 표준편차
summary(df)
library(psych)
describe(df)
mean(df$총매출액) # 평균
var(df$총매출액) # 분산
sd(df$총매출액) # 표준편차

# 2. t-test
head(df$이탈여부, 30) # 이탈여부 열의 첫 번째부터 30번까지 행을 추출

View(df) # df 데이터프레임을 테이블로 보기

# 이탈고객을 1, 잔여고객을 0으로 설정한다면
df1 <- df[df$이탈여부 == 1, ] # df1 변수에 이탈고객의 변수 저장
str(df1) # df1의 구조 불러오기

df2 <- df[df$이탈여부 == 0, ] # df2 변수에 잔여고객의 변수 저장
str(df2) # df2의 구조 불러오기

t.test(df1$X1회.평균매출액, # 이탈고객 중 1회 평균매출액 집단과
       df2$X1회.평균매출액) # 잔여고객 중 1회 평균매출액 집단의 평균 비교

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
# 내 생각: p-value가 3.364e-11로 0.05보다 작아 두 집단의 평균은 유의미한 차이가 있다
#          t값이 양수로 x, y 집단 중 x 집단의 평균이 더 크다는 것을 의미한다 반대로
#          t값이 음수라면 y 집단의 평균이 더 크다는 것을 의미한다

mean(df1$X1회.평균매출액) # x
mean(df2$X1회.평균매출액) # y

t.test(df1$X1회.평균매출액, 
       df2$X1회.평균매출액, paired = T) # 오류: 모든 인수의 길이가 같지 않음
                                        # 대응표본은 한 집단이 전후 비교를 위해 사용한다

# 번외 paired t-test
df2bf <- df2[1:150, ]
df2af <- df2[151:300, ]
str(df2bf)
str(df2af)

t.test(df2bf$X1회.평균매출액,
       df2af$X1회.평균매출액,
       paired = T)

help("t.test")  # 같지 않다 = 양측, 대소비교 = 단측
