# t-test

data <- iris # data������ iris �����Ϳ� ����
str(data) # str �Լ��� ����Ͽ� data ������ ������ ���

setosa <- data[data$Species == "setosa", ] # data����(iris ������) ��� �� Species�� setosa�� ���� ��� ���� ���
versicolor <- data[data$Species == "versicolor", ] # data����(iris ������) ��� �� Species�� versicolor�� ���� ��� ���� ���

str(setosa) # 50���� ����ġ�� 5���� ���� ���
str(versicolor) # 50���� ����ġ�� 5���� ���� ���

help(t.test) # help(): �Լ��� ������ ������ ����ϴ� �Լ�

t.test(setosa$Sepal.Length,       # setosa$Sepal.Length�� setosa �������������� Sepal.Length����(��)�� �ش��ϴ� ����ġ(��)�� �ǹ�
       mu = 5,                    # mu = �������� ���, �������� ����� 5��� ����
       alternative = "two.sided") # alternative�� �븳������ ������ �����ϴ� ����, �� ������ �������� �� ��� ���� �� ���ΰ�?
                                  # alternative�� "two.sided", "less", "greater" �� ������ �ɼ��� ����
                                  # "two.sided"(��������), "less"(��������, ������), "greater"(�������� ū��)

"""
One Sample t-test # ����ǥ�� t-������ �����ϰ��� �ϴ� �׷��� ����� �������� ��հ� �ٸ��� ����
                  # �� �� �����ϰ��� �ϴ� �׷��� setosa(setosa ������ �������� Sepal.Length����)�̸� �������� ����� 5(mu = 5)��� �����Ѵ�

data:  setosa$Sepal.Length  # ������ ���� �����ʹ� setosa ������ �������� Sepal.Length ����
t = 0.12036, df = 49, p-value = 0.9047  # t: t���� +�̸� �ش� �׷��� ����� �������� ��պ��� ũ�� 
                                        # t���� -�̸� �ش� �׷��� ����� �������� ��պ��� �۴�
                                        # df(degree of freedom): t������ ������
                                        # p-value(����Ȯ��): �͹������� ���̶�� ������ Ȯ�� �Ǵ� �͹������� ���ӿ��� �̸� �Ⱒ�� Ȯ��
                                        
alternative hypothesis: true mean is not equal to 5 # �븳����: �� ����� 5�� ���� �ʴ�
                                                    # ��, �����ϰ��� �ϴ� �׷��� ����� 5�� ���� �ʴٴ� ���� ������ ����
                                                    
95 percent confidence interval:   # 4.905824���� 5.106176���� 95% �ŷڱ������� ����  
 4.905824 5.106176                # �� ���� �� �� ����� ������ ���ɼ��� ����
 
sample estimates:   # �����ϰ��� �ϴ� �׷��� ǥ������� 5.006���� ����
mean of x 
    5.006
    
"""
# ���: �͹������� ä���Ѵ�, �� t.test ���� ǥ���� ��հ� �������� ���(mu�� ��)�� ���Ͽ� �������� ����� 5��� �������� ��
# ǥ���� ����� �������� ��հ� ���� ���� ���̶�� ���(�븳)������ ����� ������ �����
# p-value(����Ȯ��) ���� 0.9047�� 0.05���� ���� �������� ǥ���� ��յ� 5.006���� �������� ��հ� �ٸ��� �ʴٴ� ����� Ȯ���� �� �ִ�
# ���� �͹������� ä���Ѵ�

t.test(setosa$Sepal.Length, versicolor$Sepal.Length, alternative = "two.sided")

"""
Welch Two Sample t-test

data:  setosa$Sepal.Length and versicolor$Sepal.Length
t = -10.521, df = 86.538, p-value < 2.2e-16
alternative hypothesis: true difference in means is not equal to 0
95 percent confidence interval:
 -1.1057074 -0.7542926
sample estimates:
mean of x mean of y 
    5.006     5.936
    
"""
# paired t-test
# t.test(setosa_Before$Sepal.Length,
#        setosa_After$Sepal.Length,
#        paired = T,
#        alternative = "two.sided")