setwd("/Users/daeho/Desktop/github/R_practice")
getwd()

read.csv("Ashopping.csv", fileEncoding = "EUC-KR")
read.csv("Ashopping2.csv", fileEncoding = "EUC-KR")

# ���ǹ�

df <- read.csv("Ashopping.csv", fileEncoding = "EUC-KR")
str(df)

"""
'data.frame':	1000 obs. of  21 variables:
 $ ����ID          : int  1 2 3 4 5 6 7 8 9 10 ...
 $ ��Ż����        : int  1 1 1 1 1 1 1 1 1 1 ...
 $ �Ѹ����        : int  4963160 2271520 2484250 2778850 4437610 10720400 7228460 8790450 9759800 4077660 ...
 $ ���űݾ״�      : int  1 0 0 0 1 2 1 2 2 0 ...
                                .
                                .
                                .

"""