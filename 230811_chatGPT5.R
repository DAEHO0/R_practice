### ���� ȸ�� ###

# ���̺귯�� �ҷ�����
library(ggplot2)

# ���� ������ ����
oska <- data.frame(x = c(1, 2, 3, 4, 5),
                   y = c(3, 6, 8, 11, 15))

# ����ȸ�� �м�
lm_model <- lm(y ~ x, data = oska)

# ȸ�� �м� ��� ���
summary(lm_model)

# �������� ȸ�ͼ� �ð�ȭ
ggplot(oska, aes(x, y)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  labs(title = "���� ȸ�� �м� ���")


### ���� ȸ�� ###

# ���̺귯�� �ҷ�����
install.packages('glmnet')
library('glmnet')
library(dplyr)

papa <- data.frame(x1 = c(1, 2, 3, 4, 5),
                   x2 = c(2, 3, 5, 7, 9),
                   y = c(3, 6, 8, 10, 14))

# ���� ������ ���� ���� �и�
x <- papa %>% select(-y)
x
y <- papa$y
y

# ���� ȸ�� �м�
ridge_mdl <- glmnet(x, y, alpha = 0.5)
ridge_mdl


### ��� ȸ�� ###

# ���̺귯�� �ҷ�����
library(glmnet)
library(dplyr)

# ���� ������ ����
quebec <- data.frame(x1 = c(1, 2, 3, 4, 5),
                     x2 = c(2, 3, 5, 7, 9),
                     y = c(3, 6, 8, 10 ,14))

# ���� ������ ���� ���� �и�
x <- quebec %>% select(-y)
y <- quebec$y

lasso_mdl <- glmnet(x, y, alpha = 1)
lasso_mdl


### ����ƽ ȸ�� ###

# ���̺귯�� �ҷ�����
library(glmnet)
library(dplyr)

# ���� ������ ����
romio <- data.frame(x1 = c(1, 2, 3, 4, 5),
                    x2 = c(2, 3, 5, 7, 9),
                    y = c(3, 6, 8, 10, 14))

# ���� ������ ���� ���� �и�
x <- romio %>% select(-y)
y <- romio$y

# ����ƽ ȸ�� �м�
ela_mdl <- glmnet(x, y, alpha = 0.5)
ela_mdl


### ���з�ǥ ###

# ���̺귯�� �ҷ�����
library(caret)

# ������ ����� ���� ��� ����(������ ������)
actual <- c("Positive", "Negative", "Positive", "Negative", "Positive")
predicted <- c("Positive", "Negative", "Negative", "Negative", "Positive")
actual_f <- as.factor(actual) # error�� ���ͷ� ��ȯ
prdct <- as.factor(predicted)

# ���з�ǥ ����
cnfsn_mtrx <- confusionMatrix(prdct, actual_f)
# Error: `data` and `reference` should be factors with the same levels.
cnfsn_mtrx

# ��Ȯ�� ���
accrcy <- cnfsn_mtrx$overall['Accuracy']
accrcy

# ���е� ���
prcsn <- cnfsn_mtrx$byClass['Pos Pred Value']
prcsn

# ������ ���
rcll <- cnfsn_mtrx$byClass['Sens']
rcll


### ROC � ###

# ���̺귯�� �ҷ�����
install.packages('pROC')
install.packages('ROCR')
library(pROC)
library(ROCR)

# ������ ���� ����� ���� ��� ����
actl <- c(1, 0, 1, 0, 1)
prdctd <- c(0.8, 0.3, 0.6, 0.2, 0.9)

# pROC ��Ű���� ����� ROC � �׸���
roc_obj <- roc(actl, prdctd)
plot(roc_obj, main = "ROC curce", col = "blue", lwd = 2)

# ROCR ��Ű���� ����� ROC � �׸���
pred_obj <- prediction(prdctd, actl)
perf_obj <- performance(pred_obj, "tpr", "fpr")
plot(perf_obj, col = "red", lwd = 2)