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