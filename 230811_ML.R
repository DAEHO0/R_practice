### 머신러닝, 빅데이터 분석 ###

library(mlbench)
data(Sonar)
str(Sonar[, 1:10])
library(caret)
set.seed(998)
inTraining <- createDataPartition(Sonar$Class, p = .75, list = FALSE)
training <- Sonar[ inTraining,]
testing  <- Sonar[-inTraining,]
fitControl <- trainControl(## 10-fold CV
  method = "repeatedcv",
  number = 10,
  ## repeated ten times
  repeats = 10)
set.seed(825)
gbmFit1 <- train(Class ~ ., data = training, 
                 method = "gbm", 
                 trControl = fitControl,
                 ## This last option is actually one
                 ## for gbm() that passes through
                 verbose = FALSE)
gbmFit1

predict(gbmFit1, data = testing)
pred_gbm <- predict(gbmFit1, data = testing)
testing$Class
pred_gbm
