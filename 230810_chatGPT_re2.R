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


### 가설검정 ###

julu <- c(25, 30, 22, 35, 40, 28, 27, 32, 29)

# 단일 표본 t-검정 예시

# 귀무가설: 평균 = 30
# 대립가설: 평균 != 30
t_rslt <- t.test(julu, mu = 30)
t_rslt


### 정규성 검정 ###

# 데이터 로딩
kilo <- c(25, 30, 22, 35, 40, 28, 27, 32, 29)

# 정규성 검정 예시(Shapiro-Wilk 검정)
shap_test_rslt <- shapiro.test(kilo)
shap_test_rslt
# Shapiro-Wilk normality test
# data:  kilo
# W = 0.97426, p-value = 0.9285 # W값이 1에 가까울수록 정규분포에 가까움


### 독립성 검정 ###

#데이터 로딩
lima <- data.frame(gender = c("Male", "Female", "Male", "Female", "Male"),
                   smoking = c("Yes", "No", "No", "Yes", "No"))

# 교차 테이블 생성
cros_tab <- table(lima$gender, lima$smoking)

# 독립성 검정
chi_sq_test <- chisq.test(cros_tab)
# Warning message:
# In chisq.test(cros_tab) : Chi-squared approximation may be incorrect


### 등분산 검정 ###

# 데이터 로딩
group1 <- c(25, 30, 22, 35, 40)
group2 <- c(28, 27, 32, 29, 31)

# 등분산 검정(르빈 검정)
levene_test <- levene_test(group1, group2)
# Error in levene_test(group1, group2) : 
# could not find function "levene_test"


### 과소표집(Undersampling) ###

# 라이브러리 불러오기
install.packages("dplyr")
library('dplyr')

# 예시 데이터 생성
mike <- data.frame(class = c("A", "A", "A", "B", "B", "B", "B", "B"))

# 다수 클래스와 소수 클래스 나누기
majr_class <- filter(mike, class == "B")
minr_class <- filter(mike, class == "A")
majr_class
minr_class

# 다수 클래스의 샘플 수만큼 무작위로 샘플
undsmpl_majr <- sample_n(majr_class, nrow(minr_class))
undsmpl_majr

# 다수 클래스와 소수 클래스 병합
blncd_data <- bind_rows(undsmpl_majr, minr_class)
blncd_data

### 과대표집(Oversampling) ###

# 라이브러리 불러오기
install.packages("DMwR") # 설치 안 됨 ㅠㅠ

# 예시 데이터 생성
november <- data.frame(class = ("A", "A", "A", "B", "B", "B", "B", "B"))

# 소수 클래스의 샘플 수를 다수 클래스의 수와 같게 만들기
ovrsmpl_data <- SMOTE(class ~ ., november, perc.over = 200)
ovrsmpl_data
