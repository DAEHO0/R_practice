df <- read.csv("Ashopping.csv", fileEncoding = "EUC-KR")
View(df)

install.packages('psych')
library(psych)
describe(df)
colnames(df)

df$�Ѹ���� <- scale(df$�Ѹ����)
summary(df$�Ѹ����)

cg <- c("��Ż����", "���űݾ״�", "�������",
        "��������", "Ŭ������������", "��������",
        "����", "����.���̴�", "���ιΰ�����")

colnames(df[ , cg])
df[ , cg] <- lapply(df[ , cg], factor)
str(df)

colSums(is.na(df))
boxplot(df)

library(caret)
idx <- createDataPartition(df$�Ѹ����, p = 0.7, list = F)
train <- df[idx, ]
test <- df[-idx, ]

??caret

fitControl <- trainControl(## 10-fold CV
  method = "repeatedcv",
  number = 10,
  ## repeated ten times
  repeats = 10)

lmfit <- train(
  �Ѹ���� ~ .,
  data = train,
  method = "lm"
)

summary(lmfit)
lmfit$modelInfo$label
lmfit$results

lmpred <- predict(lmfit, newdata = test)
lmpred
str(lmpred)
cor(lmpred, test$�Ѹ����)
varImp(lmfit)
lmpred <- as.data.frame(lmpred)
pred_y <- cbind(lmpred$lmpred, test$�Ѹ����)
pred_y

step <- step(lm(�Ѹ���� ~., data = df), direction = "forward")
summary(step)
help(step)