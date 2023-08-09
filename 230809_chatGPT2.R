### 지도학습

#라이브러리 불러오기
install.packages("caret")
library(caret)

# 데이터 생성
ex1 <- data.frame(features = c(1, 2, 3, 4, 5),
                  label = c("A", "B", "A", "B", "C"))

# 데이터 분할(훈련 데이터와 테스트 데이터)
trainIndex <- createDataPartition(ex1$label, p = 0.7, list = FALSE)
# Warning messages:
# In createDataPartition(ex1$label, p = 0.7, list = FALSE) :
# Some classes have a single record ( C ) and these will be selected for the sample
train_data <- ex1[trainIndex, ]
test_data <- data[-trainIndex, ]

# 모델 학습(예: 의사결정 트리)
model <- train(label ~ features, data = train_data, method = "rpart")
# Warning messages:
# 1: model fit failed for Resample19: cp=0 Error in cbind(yval2, yprob, nodeprob) : 
#   number of rows of matrices must match (see arg 2)

# 2: In nominalTrainWorkflow(x = x, y = y, wts = weights, info = trainInfo,  :
#   There were missing values in resampled performance measures.

# 모델 예측
prdct <- predict(model, newdata = test_data)

### 비지도학습

# 라이브러리 불러오기
library(cluster)

# 데이터 생성
ex2 <- data.frame(x = c(1, 2, 3, 10, 11, 12),
                  y = c(5, 6, 7, 1, 2, 3))

# k-means 클러스터링 수행
clstr <- kmeans(data, centers = 2)
# In storage.mode(x) <- "double" : NAs introduced by coercion

# 클러스터링 결과 시각화
plot(data, col = clstr$cluster)