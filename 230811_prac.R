### 20230811 ###
### 회귀분석 ~ 빅데이터 분석 ###

# wd 지정
getwd()

# data 불러오기
df <- read.csv("Ashopping.csv", fileEncoding = "EUC-KR")
str(df)
View(df)

# 평균검정(t-검정, ANOVA)
clm0 <- df[df$클레임접수여부 == 0, ]
clm1 <- df[df$클레임접수여부 == 1, ]
str(clm0)
str(clm1)

# 정규성
shapiro.test(clm0$총매출액)
shapiro.test(clm1$총매출액)

# Wilcoxon
wilcox.test(clm1$총매출액, clm1$총매출액)
median(clm0$총매출액)
median(clm1$총매출액)

# anova(3 집단 이상)
colnames(df)
anova <- aov(총매출액 ~ 구매금액대, data = df)
summary(anova)

# 크루스칼-왈리스 검정(과제)