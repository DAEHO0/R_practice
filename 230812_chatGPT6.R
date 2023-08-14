### 로지스틱 회귀 ###

# 라이브러리 불러오기

library(dplyr)
library(ggplot2)
library(glmnet)

# 데이터 불러오기
siera <- data.frame(X1 = rnorm(100), X2 = norm(100), Y = rbinom(100, 1, 0.5))
# Error in base::norm(x, type, ...) : 'A' must be a numeric matrix

# 로지스틱 회귀 모델 생성
lgt_mdl <- glm(Y ~ X1 + X2, data = siera, family = "binomial")

# 모델 요약 출력
summary(siera)

# 로지스틱 함수로 확률 예측
siera$prdct <- predict(lgt_mdl, newdata = siera, type = "response")


### KNN ###

# 라이브러리 불러오기
install.packages('class')
library(class)
# Error in value[[3L]](cond) : 
# Package ‘class’ version 7.3.21 cannot be unloaded:
#   Error in unloadNamespace(package) : namespace ‘class’ is imported by ‘ipred’ so cannot be unloaded

set.seed(123)
tango <- data.frame(X1 = rnorm(50), X2 = rnorm(50), Y = c(rep('A', 25), rep('B', 25)))

# KNN 모델 분류 생성
k <- 3
knn_mdl <- knn(train = tango[ , c('X1', 'X2')], test = data[ , c("X1", "X2")], cl = siera$Y k = k)

#예측 결과 출력
knn_mdl


### 의사결정 나무 ###

# 라이브러리 불러오기
install.packages('rpart')
library(rpart)

# 가상 데이터 생성
set.seed(123)
uniform <- data.frame(X1 = rnorm(100), X2 = rnorm(100), Y = factor(sample(c("A", "B"), 100, replace = TRUE)))

# 의사결정 나무 생성
tre_mdl <- rpart(Y ~ X1 + X2, data = uniform, method = "class")

# 의사결정 나무 시각화
library(rpart.plot)
prp(tre_mdl)
