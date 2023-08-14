### 앙상블 ###

# 라이브러리 불러오기
install.packages('randomForest')
library(randomForest)

# 데이터 로드
data(iris)
train_data <- iris[1:100, -5]
train_label <-iris[1:100, 5]

# 랜덤 포레스트 모델 생성
rf_mdl <- randomForest(train_data, train_label)
# Error in randomForest.default(train_data, train_label) : 
#   Can't have empty classes in y.

# 예측
predictions <- predict(rf_mdl, newdata = iris[101, 150], -5)

# 예측 결과 출력
print(predictions)


### 군집 분석 ###

# 필요한 라이브러리 불러오기
data(iris)
library(stats)

# 군집 분석 수행(K-Means)
kmeans_rlst <- kmeans(iris[ , -5], centers = 3)

# 군집 분석 결과
print(kmeans_rlst)
