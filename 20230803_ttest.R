# t-test

data <- iris # data변수에 iris 데이터에 저장
str(data) # str 함수를 사용하여 data 변수의 구조를 출력

setosa <- data[data$Species == "setosa", ] # data변수(iris 데이터) 행렬 중 Species가 setosa인 열의 모든 행을 출력
versicolor <- data[data$Species == "versicolor", ] # data변수(iris 데이터) 행렬 중 Species가 versicolor인 열의 모든 행을 출력

str(setosa) # 50개의 관측치와 5개의 변수 출력
str(versicolor) # 50개의 관측치와 5개의 변수 출력

help(t.test) # help(): 함수의 설명과 사용법을 출력하는 함수

t.test(setosa$Sepal.Length,       # setosa$Sepal.Length는 setosa 데이터프레임의 Sepal.Length변수(열)에 해당하는 관측치(행)를 의미
       mu = 5,                    # mu = 모집단의 평균, 모집단의 평균을 5라고 가정
       alternative = "two.sided") # alternative는 대립가설의 방향을 지정하는 인자, 즉 양측과 단측검정 중 어느 것을 할 것인가?
                                  # alternative는 "two.sided", "less", "greater" 총 세가지 옵션이 있음
                                  # "two.sided"(양측검정): 
                                  # "less"(단측검정, 적은쪽):
                                  # "greater"(단측검정 큰쪽):

"""
One Sample t-test # 단일표본 t-검정

data:  setosa$Sepal.Length  # 검정에 사용된 데이터는 setosa 데이터 프레임의 꽃받침 길이 변수(열)
t = 0.12036, df = 49, p-value = 0.9047  # t: 
alternative hypothesis: true mean is not equal to 5
95 percent confidence interval:
 4.905824 5.106176
sample estimates:
mean of x 
    5.006
    
"""
# 위 t.test 식은 표본의 평균과 모집단의 평균(mu의 값)을 비교


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