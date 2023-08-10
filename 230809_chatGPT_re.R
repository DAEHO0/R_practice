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


### 중복값 처리 ###

# 데이터 로딩
d <- data.frame(id = c(1, 2, 3, 1, 4),
                score = c(90, 85, 78, 90, 92))

# 중복값 확인
dupl_rows <- d[duplicated(d), ]
dupl_rows
# id score
# 4  1    90 <- 중복값

# 중복값 제거
uniq_data <- unique(d)
uniq_data


### 정규화 ###

# 데이터 로딩
echo <- data.frame(age = c(25, 30, 22, 25, 40),
                   income = c(50000, 60000, 75000, 80000, 90000))

# 최소-최대 정규화
mn_mx_norm <- function(x) {
  return((x - min(x)) / (max(x) - min(x)))
}

norm_data <- as.data.frame(lapply(data, mn_mx_norm))
# Error in Summary.factor(c(1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, :
# ‘min’ not meaningful for factors

# Z-점수 정규화
z_score_norm <- function(x) {
  return((x - mean(x)) / sd(x))
}

### 데이터 병합 ###

# 데이터 로딩
data1 <- data.frame(id = c(1, 2, 3),
                    name = c("Choonsik", "Chulsoo", "Boknam"))
data2 <- data.frame(id = c(2, 3, 4),
                    score = c(85, 78, 92))

# 행 기준 병합(rbind)
mer_row <- rbind(data1, data2)
# Error in match.names(clabs, names(xi)) : 
# names do not match previous names
mer_col <- cbind(data1, data2)
mer_col

# 공통 열 기준 병합(merge)
mer_common <- merge(data1, data2, by = "id")
mer_common


### 파생변수 ###

# 데이터 로딩
foxtrot <- data.frame(height_cm = c(160, 175, 168, 172, 158),
                      weight_kg = c(50, 70, 60, 65, 48))

# BMI(체질량 지수) 파생변수 생성
foxtrot$BMI <- foxtrot$weight_kg / ((foxtrot$height_cm / 100) ^ 2)
foxtrot$BMI
