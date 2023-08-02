data <- iris

data$Species <- as.integer(data$Species) # data 변수에 저장된 iris 함수의
                                         # Species 관측치를 정수로 바꾼 후 
                                         # data$Species에 저장

data$Species # iris 원본 데이터와 비교했을 때 Species 열의 1 ~ 150까지 
             # 모든 행들의 값이 정수로 바뀜
             # setosa == 1, versicolor == 2, virginica == 3 으로 붓꽃의 종류가
             # 정수로 바뀐 것을 확인할 수 있다
str(data)

"""
'data.frame':	150 obs. of  5 variables:
 $ Sepal.Length: num  5.1 4.9 4.7 4.6 5 5.4 4.6 5 4.4 4.9 ...
 $ Sepal.Width : num  3.5 3 3.2 3.1 3.6 3.9 3.4 3.4 2.9 3.1 ...
 $ Petal.Length: num  1.4 1.4 1.3 1.5 1.4 1.7 1.4 1.5 1.4 1.5 ...
 $ Petal.Width : num  0.2 0.2 0.2 0.2 0.2 0.4 0.3 0.2 0.2 0.1 ...
 $ Species     : int  1 1 1 1 1 1 1 1 1 1 ... ### Species 열의 모든 행들이 정수로 바뀜
 
"""

data$Species <- as.factor(data$Species) # Species 열의 모든 행들을 factor로 바꾼 후
                                        # data$Species에 저장

# factor란 factor 타입은 범주형 변수를 저장하기 위한 데이터 타입이다

str(data)

"""
'data.frame':	150 obs. of  5 variables:
 $ Sepal.Length: num  5.1 4.9 4.7 4.6 5 5.4 4.6 5 4.4 4.9 ...
 $ Sepal.Width : num  3.5 3 3.2 3.1 3.6 3.9 3.4 3.4 2.9 3.1 ...
 $ Petal.Length: num  1.4 1.4 1.3 1.5 1.4 1.7 1.4 1.5 1.4 1.5 ...
 $ Petal.Width : num  0.2 0.2 0.2 0.2 0.2 0.4 0.3 0.2 0.2 0.1 ...
 $ Species     : Factor w/ 3 levels "1","2","3": 1 1 1 1 1 1 1 1 1 1 ...
                 ### Species 열이 factor(범주형 변수)로 바뀜
 
 """

# factor가 1, 2, 3, 3개의 범주로 나뉜 이유는 Species의 종류가 setosa, versicolor, virginica
# 총 3가지 종류이고 위 식에서 as.integer(data$Species) 함수로 setosa, versicolor, virginica를
# 1(setosa), 2(versicolor), 3(virginica)로 바꿨기 때문에 levels가 1, 2, 3으로 출력된다
# 반대로 as.integer(data$Species) 함수를 작성하지 않는다면 levels는 setosa, versicolor, virginica
# 로 출력된다