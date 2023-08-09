### 지도학습

#라이브러리 불러오기
install.packages("caret")
library(caret)

# 데이터 생성
ex1 <- data.frame(features = c(1, 2, 3, 4, 5),
                  label = c("A", "B", "A", "B", "C"))

# 데이터 분할(훈련 데이터와 테스트 데이터)
trainIndex <- createDataPartition(ex1$label, p = 0.7, list = FALSE)
train_data <- ex1[trainIndex, ]
test_data <- data[-trainIndex, ]
