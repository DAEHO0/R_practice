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
# 비모수적 방법, 세 개 이상의 독립적인 그룹 간 등위 척도의 종속 변수에
# 차이가 있는지를 검정하는 통계적 방법
# 귀무가설(H0): 각 그룹의 등위 척도의 평균이 모두 동일하다
# 대립가설(H1): 적어도 하나의 그룹의 등위 척도의 평균이 다른 그룹과 다르다
# 해당 검정은 그룹 간 등위 합을 비교하여 그룹 간 차이가 있는지 평가
rlst <- kruskal.test(list(df$고객등급, df$구매유형, df$거주지역))
rlst
summary(rlst) # ???

# 상관관계(서열형integer O, 연속형numeric O, 집단형factor X)
cor(df$구매금액대, df$총.할인.금액)
cor(df$할인권.사용.횟수, df$총.할인.금액)
plot(df$할인권.사용.횟수, df$총.할인.금액)
abline(lm(df$총.할인.금액 ~ df$할인권.사용.횟수),
       col = "blue")
help(abline)

reg <- lm(총매출액 ~ 할인권.사용.횟수 + 총.할인.금액,
          data = df)
summary(reg)
plot(reg)

reg1 <- lm(총매출액 ~ 총.할인.금액, data = df)
# 상관계수가 0.8 이상이므로 변수 택일 해야 함
summary(reg1)
plot(reg1)

str(df)
df$이탈여부 <- as.factor(df$이탈여부)
logit <- glm(이탈여부 ~ ., data = df, family = "binomial")
# Warning messages:
# 1: glm.fit: algorithm did not converge 
# 2: glm.fit: fitted probabilities numerically 0 or 1 occurred 
summary(logit)
str(df$이탈여부)

# ifelse(조건, TRUE, FALSE)
# df$이탈여부 <- ifelse(df$이탈여부 == 1, 0, 1)

# 변수 변환
str(df)

cg <- c("이탈여부", "구매금액대", "고객등급",
        "구매유형", "클레임접수여부", "구매카테고리수",
        "거주지역", "성별", "고객.나이대", "할인민감여부")

df[, cg] <- lapply(df[ , cg], factor)
str(df)

# {} <= 함수식 지정
minmax <- function(x) {
  (x - min(x))/max(x) - min(x)
  return(x)
}

minmax

# () <= 매개변수 입력

colnames(df)
num <- c("총매출액", "X1회.평균매출액", "총.할인.금액" )
df$총매출액 <- as.numeric(df$총매출액)
df[, num] <- laaply(df[ , num], numeric)
str(df)

install.packages("caret", type = "binary",
                 dependencies = T)
install.packages("gglpot2")
install.packages("lattice")
library(lattice)
library(caret)
??caret
help(caret)


# 결측값
colSums(is.na(df))

# 이상치
boxplot(df)