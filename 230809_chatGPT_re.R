### 결측값 처리 ###

# 데이터 로딩
a <- data.frame(age = c(25, 30, NA, 22, 40),
                income = c(50000, NA, 60000, 75000, NA))

# 결측값 확인
miss_val <- sum(is.na(data))

# 결측값 대체(평균 사용)
mean_income <- mean(a$income, na.rm = TRUE)
a$income[is.na(a$income)] <- mean_income
a$income[is.na(a$income)]
# numeric(0)


### 이상치 처리 ###

# 데이터 로딩
b <- data.frame(age = c(25, 30, 22, 50, 500),
                income = c(50000, 60000, 75000, 80000, 100000))

# 이상치 탐지
boxplot(b$age, b$income)

#이상치 처리
q1 <- quantile(b$age, 0.25)
q3 <- quantile(b$age, 0.75)
iqr <- q3 - q1
lower <- q1 - 1.5 * iqr
upper <- q3 + 1.5 * iqr
data_no_out <- b[b$age >= lower & b$age <= upper, ]
data_no_out