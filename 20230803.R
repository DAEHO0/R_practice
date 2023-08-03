# t-test

data <- iris # data변수에 iris 데이터에 저장
str(data) # str 함수를 사용하여 data 변수의 구조를 출력

setosa <- data[data$Species == "setosa", ] # data변수 행렬 중 Species가 setosa인 열의 모든 행을 출력
versicolor <- data[data$Species == "versicolor", ] # data변수 행렬 중 Species가 versicolor인 열의 모든 행을 출력

str(setosa) # 50개의 관측치와 5개의 변수 출력
str(versicolor) # 50개의 관측치와 5개의 변수 출력

help(t.test)
t.test(setosa$Sepal.Length,
       mu = 5, # mu = 모집단의 평균
       alternative = "two.sided")

# 표본의 평균과 모집단의 평균(mu의 값)을 비교

"""
One Sample t-test

data:  setosa$Sepal.Length
t = 0.12036, df = 49, p-value = 0.9047
alternative hypothesis: true mean is not equal to 5
95 percent confidence interval:
 4.905824 5.106176
sample estimates:
mean of x 
    5.006
    
"""

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