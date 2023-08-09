# Chat GPT

### 주성분 분석 R 코드

# 라이브러리 불러오기
library(stats)

# 데이터 생성
ex <- data.frame(x1 = c(1, 2, 3, 4, 5),
                 x2 = c(2, 3, 4, 5, 6),
                 x3 = c(5, 4, 3, 2, 1))

# 주성분 분석 수행
pca_rslt <- prcomp(ex, scale = TRUE)

# 주성분 분석 결과 출력
summary(pca_rslt)

### 요인분석 R 코드

# 라이브러리 불러오기
library(stats)

# 데이터 생성
ex <- data.frame(x1 = c(1, 2, 3, 4, 5),
                 x2 = c(2, 3, 4, 5, 6),
                 x3 = c(5, 4, 3, 2, 1))

# 요인분석 수행
fctr_rslt <- factanal(ex, factors = 2, rotation = "varimax")
# Error in factanal(ex, factors = 2, rotation = "varimax") : 
# 2 factors are too many for 3 variables

# 요인분석 결과 출력
summary(fctr_rslt)

# 요인 로딩 출력
fctr_rslt$loadings