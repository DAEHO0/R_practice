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