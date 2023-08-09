### �����н�

#���̺귯�� �ҷ�����
install.packages("caret")
library(caret)

# ������ ����
ex1 <- data.frame(features = c(1, 2, 3, 4, 5),
                  label = c("A", "B", "A", "B", "C"))

# ������ ����(�Ʒ� �����Ϳ� �׽�Ʈ ������)
trainIndex <- createDataPartition(ex1$label, p = 0.7, list = FALSE)
# Warning messages:
# In createDataPartition(ex1$label, p = 0.7, list = FALSE) :
# Some classes have a single record ( C ) and these will be selected for the sample
train_data <- ex1[trainIndex, ]
test_data <- data[-trainIndex, ]

# �� �н�(��: �ǻ���� Ʈ��)
model <- train(label ~ features, data = train_data, method = "rpart")
# Warning messages:
# 1: model fit failed for Resample19: cp=0 Error in cbind(yval2, yprob, nodeprob) : 
#   number of rows of matrices must match (see arg 2)

# 2: In nominalTrainWorkflow(x = x, y = y, wts = weights, info = trainInfo,  :
#   There were missing values in resampled performance measures.

# �� ����
prdct <- predict(model, newdata = test_data)

### �������н�

# ���̺귯�� �ҷ�����
library(cluster)

# ������ ����
ex2 <- data.frame(x = c(1, 2, 3, 10, 11, 12),
                  y = c(5, 6, 7, 1, 2, 3))

# k-means Ŭ�����͸� ����
clstr <- kmeans(data, centers = 2)
# In storage.mode(x) <- "double" : NAs introduced by coercion

# Ŭ�����͸� ��� �ð�ȭ
plot(data, col = clstr$cluster)