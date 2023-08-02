data <- iris
data$Species <- as.integer(data$Species)
data$Species <- as.factor(data$Species)

str(data)

# �����̸�$���̸�

data$Species # data����(iris ������)�� Species���� ��� ��(����ġ)�� ���

# �����̸�[��, ��]�� Ư�� �����͸� ���

data[1, 1] # data(iris ������)�� 1�� 1���� ���
data[ , ] # ��� ���� �ڸ��� �����ϸ� ��� �����͸� ���
data[ , 2] # ���� �����߱� ������ 2���� ��� ����� ���
data[5, ] # ���� �����߱� ������ 5���� ��� ���� ���

setosa <- data[data$Species == 1, ] # setosa ������ Species ���� 1�� ��� ��� ���� ���
setosa # Species ���� 1�� ��� ��� ���� ���
str(setosa) # Species ���� 1�� 50���� ����ġ(��)�� 5���� ����(��) ������ ���

versicolor <- data[data$Species == 2, ] # versicolor ������ Species ���� 2�� ��� ��� ���� ���
versicolor # Species ���� 2�� ��� ��� ���� ���
str(versicolor) # Species ���� 2�� 50���� ����ġ(��)�� 5���� ����(��) ������ ���

virginica <- data[data$Species == 3, ] # virginica ������ Species ���� 3�� ��� ��� ���� ���
virginica # Species ���� 3�� ��� ��� ���� ���
str(virginica)  # Species ���� 3�� 50���� ����ġ(��)�� 5���� ����(��) ������ ���