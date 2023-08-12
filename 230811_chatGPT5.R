### 선형 회귀 ###

# 라이브러리 불러오기
library(ggplot2)

# 예시 데이터 생성
oska <- data.frame(x = c(1, 2, 3, 4, 5),
                   y = c(3, 6, 8, 11, 15))

# 선형회귀 분석
lm_model <- lm(y ~ x, data = oska)

# 회귀 분석 결과 출력
summary(lm_model)

# 산점도와 회귀선 시각화
ggplot(oska, aes(x, y)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  labs(title = "선형 회귀 분석 결과")


### 릿지 회귀 ###

# 라이브러리 불러오기
install.packages('glmnet')
library('glmnet')
library(dplyr)

papa <- data.frame(x1 = c(1, 2, 3, 4, 5),
                   x2 = c(2, 3, 5, 7, 9),
                   y = c(3, 6, 8, 10, 14))

# 독립 변수와 종속 변수 분리
x <- papa %>% select(-y)
x
y <- papa$y
y

# 릿지 회귀 분석
ridge_mdl <- glmnet(x, y, alpha = 0.5)
ridge_mdl


### 라쏘 회귀 ###

# 라이브러리 불러오기
library(glmnet)
library(dplyr)

# 예시 데이터 생성
quebec <- data.frame(x1 = c(1, 2, 3, 4, 5),
                     x2 = c(2, 3, 5, 7, 9),
                     y = c(3, 6, 8, 10 ,14))

# 독립 변수와 종속 변수 분리
x <- quebec %>% select(-y)
y <- quebec$y

lasso_mdl <- glmnet(x, y, alpha = 1)
lasso_mdl


### 엘라스틱 회귀 ###

# 라이브러리 불러오기
library(glmnet)
library(dplyr)

# 예시 데이터 생성
romio <- data.frame(x1 = c(1, 2, 3, 4, 5),
                    x2 = c(2, 3, 5, 7, 9),
                    y = c(3, 6, 8, 10, 14))

# 독립 변수와 종속 변수 분리
x <- romio %>% select(-y)
y <- romio$y

# 엘라스틱 회귀 분석
ela_mdl <- glmnet(x, y, alpha = 0.5)
ela_mdl


### 오분류표 ###

# 라이브러리 불러오기
library(caret)

# 예측한 결과와 실제 결과 생성(가상의 데이터)
actual <- c("Positive", "Negative", "Positive", "Negative", "Positive")
predicted <- c("Positive", "Negative", "Negative", "Negative", "Positive")
actual_f <- as.factor(actual) # error로 펙터로 전환
prdct <- as.factor(predicted)

# 오분류표 생성
cnfsn_mtrx <- confusionMatrix(prdct, actual_f)
# Error: `data` and `reference` should be factors with the same levels.
cnfsn_mtrx

# 정확도 계산
accrcy <- cnfsn_mtrx$overall['Accuracy']
accrcy

# 정밀도 계산
prcsn <- cnfsn_mtrx$byClass['Pos Pred Value']
prcsn

# 재현율 계산
rcll <- cnfsn_mtrx$byClass['Sens']
rcll


### ROC 곡선 ###

# 라이브러리 불러오기
install.packages('pROC')
install.packages('ROCR')
