install.packages("rlang")
library(rlang)
install.packages("ggplot2")
library("ggplot2")

### 강화학습 ###

# Q-학습 알고리즘
q_learning <- function(num_episodes, num_actions, learning_rate,
                       discount_factor) {
  Q <- matrix(0, nrow = num_actions, ncol = num_actions)
  
  for(episode in 1:num_episodes) {
    state <- sample(1:num_episodes, 1)
    for(step in 1:num_actions, 1) {
      action <- sample(1:num_actions, 1)
      reward <- ifelse(action == num_actions, 1, 0)
      Q[state, action] <- Q[state, action] + learning_rate * (reward + 
                                                                discount_factor * max(Q[action, ]) - Q[state, action])
      state <- action
    }
  }
  return(Q)
}
# Error: unexpected ',' in:
# "    state <- sample(1:num_episodes, 1)
#    for(step in 1:num_actions,"

# Q-학습 알고리즘 실행
num_episode <- 1000
num_actions <- 10
learning_rate <- 0.1
discount_factor <- 0.9
Q <- q_learning(num_episode, num_actions, learning_rate, discount_factor)
# Error in q_learning(num_episode, num_actions, learning_rate, discount_factor) : 
# could not find function "q_learning"


### 교차검증 ###

# 라이브러리 불러오기
install.packages("lattice")
# Error in value[[3L]](cond) : 
# Package ‘lattice’ version 0.20.45 cannot be unloaded:
#  Error in unloadNamespace(package) : namespace ‘lattice’ is imported by ‘nlme’, ‘Matrix’, ‘caret’ so 
# cannot be unloaded

install.packages("caret")
library(lattice)
library(ggplot2)
library(caret)
# Error in value[[3L]](cond) : 
# Package ‘lattice’ version 0.20.45 cannot be unloaded:
#  Error in unloadNamespace(package) : namespace ‘lattice’ is imported by ‘nlme’, ‘Matrix’, ‘caret’ so 
# cannot be unloaded

# 데이터 로딩
data <- iris

# K-Fold 교차검증
set.seed(123) # 재현성을 위한 시드 설정
folds <- createFolds(data$Species, k = 5, returnTrain = TRUE)
# Error in createFolds(data$Species, k = 5, returnTrain = TRUE) : 
#   could not find function "createFolds"

for(i in 1:length(folds)) {
  train_data <- data[folds[[i]], ]
  test_data <- data[-folds[[i]], ]
  
  # 모델 학습 및 평가
  # ... (모델 학습 및 평가 코드 작성)
}
# Error in length(folds) : object 'folds' not found


### 변수선택 ###

# 데이터 로딩
data <- iris

# 변수 선택을 위한 제어 매개변수 설정
num_feature <- 3 # 선택한 변수의 개수
best_subset <- NULL
best_score <- Inf

# 모든 가능한 변수 조합 탐색
for (i in 1:(length(data) - 1)) {
  subsets <- combn(names(data)[1:4], i)
  
  for (j in 1:ncol(subsets)) {
    selected_features <- subsets[ , j]
    x <- data[ , selected_features]
    y <- data$Species
    
    # 모델 학습 및 성능 평가(예: 회귀모델)
    model <- lm(y ~ x)
    score <- summary(model)$adj.r.squared
    
    # 최적의 변수 조합 찾기
    if (score > best_score) {
      best_score <- score
      best_subset <- selected_features
    }
  }
}
# Error in if (score > best_score) { : 
#   missing value where TRUE/FALSE needed
# In addition: Warning messages:
# 1: In model.response(mf, "numeric") :
#   using type = "numeric" with a factor response will be ignored
# 2: In Ops.factor(y, z$residuals) : ‘-’ not meaningful for factors
# 3: In Ops.factor(r, 2) : ‘^’ not meaningful for factors

print("Selected Features:")
print(best_subset)