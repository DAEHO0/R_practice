# 8월 2일

name <- "kimdaeho" # name변수에 kimdaeho 문자열을 저장

age <- 27 # age 변수에 27 숫자를 저장

name # "kimdaeho
age # 27

str(name) # str(structure), 데이터셋의 구조를 확인, chr(character)
          # chr는 문자열을 의미
str(age) # num(numeric), num은 숫자열을 의미

# integer와 numeric의 차이점은 numceric은 정수, 실수를 모두 다룰 수 있으나
# integer는 오직 정수만 다룰 수 있다

iris # 붓꽃과 관련된 내장데이터

data <- iris # data 변수에 iris 데이터를 저장

class(iris) # class는 데이터 타입을 확인, chr, num, data.frame, vector...
str(iris) # iris 데이터의 간단한 구조를 확인

data$Sepal.Length # 변수이름$열이름을 작성하여 특정 열에 접근할 수 있다
                  # iris의 Sepal.Length 열에만 접근하여 출력한다

as.integer(data$Sepal.Length) # as.integer를 사용하여 Sepal.Length의 관측치를
                              # 정수로 변환한다

summary(data) # summary 함수는 최소값(Min), 1사분위수,(1st Qu), 중앙값(median),
              # 3사분위수(3rd Qu), 최대값(Max), 평균(Mean)을 구할 수 있다