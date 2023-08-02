data <- iris
data$Species <- as.integer(data$Species)
data$Species <- as.factor(data$Species)

str(data)

# 변수이름$열이름

data$Species # data변수(iris 데이터)의 Species열의 모든 행(관측치)을 출력

# 변수이름[행, 열]로 특정 데이터만 출력

data[1, 1] # data(iris 데이터)의 1행 1열을 출력
data[ , ] # 행과 열의 자리를 생략하면 모든 데이터를 출력
data[ , 2] # 행을 생략했기 때문에 2열의 모든 행들을 출력
data[5, ] # 열을 생략했기 때문에 5행의 모든 열을 출력

setosa <- data[data$Species == 1, ] # setosa 변수에 Species 값이 1인 행과 모든 열을 출력
setosa # Species 값이 1인 행과 모든 열이 출력
str(setosa) # Species 값이 1인 50개의 관측치(행)와 5개의 변수(열) 구조로 출력

versicolor <- data[data$Species == 2, ] # versicolor 변수에 Species 값이 2인 행과 모든 열을 출력
versicolor # Species 값이 2인 행과 모든 열이 출력
str(versicolor) # Species 값이 2인 50개의 관측치(행)와 5개의 변수(열) 구조로 출력

virginica <- data[data$Species == 3, ] # virginica 변수에 Species 값이 3인 행과 모든 열을 출력
virginica # Species 값이 3인 행과 모든 열이 출력
str(virginica)  # Species 값이 3인 50개의 관측치(행)와 5개의 변수(열) 구조로 출력
