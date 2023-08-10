### 데이터 시각화 ###

# 라이브러리 불러오기
install.packages('ggplot2')
installed.packages("ggplot2")
library(ggplot2)

# 데이터 로딩

delta <- data.frame(age = c(25, 30, 22, 35, 40),
                    income = c(50000, 60000, 75000, 80000, 90000))

# 산점도 시각화
ggplot(delta, aes(x = age, y = income)) + 
  geom_point() +
  labs(x = "Age", y = "Income") + 
  ggtitle("Scatter Plot of Age vs. Income")


### 기술통계 ###

# 데이터 로딩
golf <- c(25, 30, 22, 35, 40, 30, 28, 27, 32, 29)

# 평균, 중앙값, 분산, 표준편차, 최빈값, 범위 계산
mean_val <- mean(golf)
mean_val

median_val <- median(golf)
median_val

var_val <- var(golf)
var_val

sd_val <- sd(golf)
sd_val

mode_val <- as.numeric(names(table(golf))[which.max(table(golf))])
mode_val

rang_val <- max(golf) - min(golf)
rang_val


### 공분산 ###

# 데이터 로딩
hotel <- data.frame(x = c(25, 30, 22, 35, 40),
                    y = c(50000, 60000, 75000, 80000, 90000))

# 공분산 계산
covari_mat <- cov(hotel)
covari_mat


### 데이터 로딩 ###
india <- data.frame(x = c(25, 30 , 22, 35, 40),
                    y = c(50000, 60000, 75000, 80000, 90000))

# 상관계수 계산
correl <- cor(india$x, india$y)
correl
