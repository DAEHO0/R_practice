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
                                  # "two.sided"(양측검정), "less"(단측검정, 적은쪽), "greater"(단측검정 큰쪽)

"""
One Sample t-test # 단일표본 t-검정은 검정하고자 하는 그룹의 평균이 모집단의 평균과 다른지 검정
                  # 이 때 검정하고자 하는 그룹은 setosa(setosa 데이터 프레임의 Sepal.Length변수)이며 모집단의 평균은 5(mu = 5)라고 가정한다

data:  setosa$Sepal.Length  # 검정에 사용된 데이터는 setosa 데이터 프레임의 Sepal.Length 변수
t = 0.12036, df = 49, p-value = 0.9047  # t: t값이 +이면 해당 그룹의 평균이 모집단의 평균보다 크고 
                                        # t값이 -이면 해당 그룹의 평균이 모집단의 평균보다 작다
                                        # df(degree of freedom): t검정의 자유도
                                        # p-value(유의확율): 귀무가설이 참이라고 가정한 확률 또는 귀무가설이 참임에도 이를 기각할 확률
                                        
alternative hypothesis: true mean is not equal to 5 # 대립가설: 참 평균이 5와 같지 않다
                                                    # 즉, 검정하고자 하는 그룹의 평균이 5와 같지 않다는 것을 가설로 세움
                                                    
95 percent confidence interval:   # 4.905824부터 5.106176까지 95% 신뢰구간으로 추정  
 4.905824 5.106176                # 이 범위 내 참 평균이 존재할 가능성이 높다
 
sample estimates:   # 검정하고자 하는 그룹의 표본평균은 5.006으로 추정
mean of x 
    5.006
    
"""
# 결론: 귀무가설을 채택한다, 위 t.test 식은 표본의 평균과 모집단의 평균(mu의 값)을 비교하여 모집단의 평균을 5라고 가정했을 때
# 표본의 평균이 모집단의 평균과 같지 않을 것이라는 대안(대립)가설을 세우고 검정한 결과는
# p-value(유의확률) 값은 0.9047로 0.05보다 높게 나왔으며 표본의 평균도 5.006으로 모집단의 평균과 다르지 않다는 결과를 확인할 수 있다
# 따라서 귀무가설을 채택한다

t.test(setosa$Sepal.Length, versicolor$Sepal.Length, # 검정에 사용하고자 할 두 집단
                                                     # setosa 데이터 프레임의 Sepal.Length 변수와 versicolor 데이터 프레임의 Sepal.Length 변수를 사용
       alternative = "two.sided")                    # 대립가설을 양측검정으로 사용

"""
Welch Two Sample t-test # Bernard Lewis Welch 통계학자의 독립표본 t-검정
                        # 독립표본 t-검정(Independent Samples t-test)은 알 수 없는 두 그룹의 모집단의 평균이 같은지 검정하는데 사용

data:  setosa$Sepal.Length and versicolor$Sepal.Length  # 검정하고자 하는 두 그룹의 데이터
                                                        # setosa 그룹의 데이터와 versicolor 그룹의 데이터
                                                        
t = -10.521, df = 86.538, p-value < 2.2e-16 # t값이 -이므로 versicolor 그룹의 평균이 setosa 그룹의 평균보다 높다
alternative hypothesis: true difference in means is not equal to 0  # 대립가설: 평균의 참 차이가 0과 같지 않다
                                                                    # 즉, 두 그룹의 평균 차이가 0이 아니라는 뜻으로 두 그룹은 평균적으로 서로 다른 값을 가지고 있다
                                                                    # 두 그룹에는 유의미한 차이가 있다
                                                                    
95 percent confidence interval: # 해당 데이터의 평균 추정치 범위가 -1.1057074부터 -0.7542926까지 있을 가능성이 95%
 -1.1057074 -0.7542926          # 정확한 값은 아니며 해당 평균 추정치가 신뢰구간 안에 있을 가능성이 높다
sample estimates:               # 표본평균의 추정치 
mean of x mean of y             # x(setosa)와 y(versicolor)의 평균 추정치
    5.006     5.936             # x(setosa)의 평균 추정치 5.006 < y(versicolor)의 평균 추정치 5.936
    
"""
# 결론: 대립가설을 채택한다, 위 t.test는 두 표본의 평균과 비교했을 때 p-value(유의확률) 값이
# 2.2e-16(2.2의 -16승)으로 귀무가설의 귀무가설의 기각기준 수치인 0.05보다 작게 나왔으며 
# 두 표본의 평균이 5.006(x), 5.936(y)로 뚜렷한 차이가 있다
# 따라서 대립가설을 채택한다

# paired t-test 대응표본 t-검정
# t.test(setosa_Before$Sepal.Length,
#        setosa_After$Sepal.Length,
#        paired = T,
#        alternative = "two.sided")