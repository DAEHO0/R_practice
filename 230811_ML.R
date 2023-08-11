### Machine Learning, Big Data Analysis ###

library(mlbench)
data(Sonar)
str(Sonar[, 1:10])

library(caret)
set.seed(998)
inTraining <- createDataPartition(Sonar$Class, p = .75, list = FALSE)
#             random sampling index
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
                                 # current classification model type == Classification(O)
                                 #                              type == Regression(X)
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

pred_gbm <- as.data.frame(pred_gbm) # create data.frame
str(testing)

predic_gbm_y <- cbind(pred_gbm, testing$Class)
str(predic_gbm_y)
View(predic_gbm_y)

??caret::confusionMatrix
caret::confusionMatrix(predic_gbm_y$pred_gbm,
                       predic_gbm_y$`testing$Class`,
                       mode = "everything")


### model.2 ###

nnet <- train(Class ~ ., data = training, 
                 method = "mlp",
                 trControl = fitControl,
                 ## This last option is actually one
                 ## for gbm() that passes through
                 verbose = FALSE) # verbose = FALSE default
nnet # == f(x)

pred_nm <- predict(nnet, newdata = testing)
pred_nm

pred_nm <- as.data.frame(pred_nm)
pred_nn_y <- cbind(pred_nm, testing$Class)
str(pred_nn_y)
caret::confusionMatrix(pred_nn_y$pred_nm,
                       pred_nn_y$`testing$Class`,
                       mode = "everything")