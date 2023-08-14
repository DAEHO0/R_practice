df <- read.csv("Ashopping.csv", fileEncoding = "EUC-KR")
View(df)

install.packages('psych')
library(psych)
describe(df)
colnames(df)

df$총매출액 <- scale(df$총매출액)
summary(df$총매출액)

cg <- c("이탈여부", "구매금액대", "고객등급",
        "구매유형", "클레임접수여부", "거주지역",
        "성별", "고객.나이대", "할인민감여부")

colnames(df[ , cg])
df[ , cg] <- lapply(df[ , cg], factor)
str(df)

colSums(is.na(df))
boxplot(df)

library(caret)
idx <- createDataPartition(df$총매출액, p = 0.7, list = F)
train <- df[idx, ]
test <- df[-idx, ]

??caret

fitControl <- trainControl(## 10-fold CV
  method = "repeatedcv",
  number = 10,
  ## repeated ten times
  repeats = 10)

lmfit <- train(
  총매출액 ~ .,
  data = train,
  method = "lm"
)

summary(lmfit)
lmfit$modelInfo$label
lmfit$results

lmpred <- predict(lmfit, newdata = test)
lmpred
str(lmpred)
cor(lmpred, test$총매출액)
varImp(lmfit)
lmpred <- as.data.frame(lmpred)
pred_y <- cbind(lmpred$lmpred, test$총매출액)
pred_y

step <- step(lm(총매출액 ~., data = df), direction = "forward")
summary(step)
help(step)