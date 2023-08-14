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


### Support Vector Machine ###

# 라이브러리 불러오기
install.packages('e1071')
library(e1071)

# 가상의 데이터 생성
set.seed(123)
victor <- data.frame(X1 = rnorm(100), X2 = rnorm(100), Y = factor(sample(c("A", "B"), 100, replace = TRUE)))

# SVM 분류 모델 생성
svm_mdl <- svm(Y ~ X1 + X2, data = victor, kernel = "linear")

# 모델 예측
prdct <- predict(svm_mdl, newdata = victor)

# 예측 결과 출력
print(prdct)


### 인공신경망 ###

# 라이브러리 불러오기
install.packages('neuralnet')
library(neuralnet)

# 가상의 데이터 생성
set.seed(123)
wiskey <- data.frame(X1 = rnorm(100), X2 = rnorm(100), Y = rnorm(100))

# 인공 신경망 모델 생성
nn_mdl <- neuralnet(Y ~ X1 + X2, data = wiskey)

# 모델 예측
prdct <- predict(nn_mdl, newdata = wiskey)

# 예측 결과 출력
print(prdct)


### Convolutional Neural Network ###

# 필요한 라이브러리 불러오기
install.packages("keras")
library(keras)

# 간단한 CNN 모델 생성
mdl <- keras_model_sequential() # 파이썬, 텐서플로우 설치 필요
mdl %>%
  layer_conv_2d(filters = 32, kernel_size = c(3, 3), activation = 'relu',
                input_shape = c(28, 28, 1)) %>%
  layer_max_pooling_2d(pool_size = c(2, 2)) %>%
  layer_flatten() %>%
  layer_dense(units = 10, activation = 'softmax')

# 모델 요약 정보 출력
summary(mdl)


### Deep Neural Network ###

# 필요한 라이브러리 불러오기
install.packages("keras")
library(keras)

# 간단한 DNN 모델 생성
mdl <- keras_model_sequential()
model %>%
  layer_dense(units = 128, activation = 'relu', input_shape = c(784)) %>%
  layer_dropout(rate = 0.5) %>%
  layer_dense(units = 64, activation = 'relu') %>%
  layer_dropout(rate = 0.3) %>%
  layer_dense(units = 10, activation = 'softmax')

# 모델 요약 정보 출력
summary(mdl)


### Recurrent Neural Network ###

# 필요한 라이브러리 불러오기
install_keras()
library(keras)

# 간단한 RNN 모델 생성
mdl <- keras_model_sequential()
model %>%
  layer_simple_rnn(units = 64, activation = 'tanh', input_shape = c(10, 1)) %>%
  layer_dense(untis = 1)

# 모델 요약 정보 출력
summary(mdl)
