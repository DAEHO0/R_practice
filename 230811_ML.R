### Machine Learning, Big Data Analysis ###

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
                 method = "gbm", # method = train Models By Tag
                                 # 현재 분류 모형이므로 type == Classification(O)
                                 #                      type == Regression(X)
                 trControl = fitControl,
                 ## This last option is actually one
                 ## for gbm() that passes through
                 verbose = FALSE)
gbmFit1

predict(gbmFit1, data = testing)
pred_gbm <- predict(gbmFit1, newdata = testing)
#                   function        test x
str(testing$Class)
str(pred_gbm)

pred_gbm <- as.data.frame(pred_gbm)
str(testing)

predic_gbm_y <- cbind(pred_gbm, testing$Class)
str(predic_gbm_y)
View(predic_gbm_y)

??caret::confusionMatrix
caret::confusionMatrix(predic_gbm_y$pred_gbm,
                       predic_gbm_y$`testing$Class`,
                       mode = "everything")


### Ex.2 ###

nnet <- train(Class ~ ., data = training, 
                 method = "mlp",
                 trControl = fitControl,
                 ## This last option is actually one
                 ## for gbm() that passes through
                 verbose = FALSE)
nnet
