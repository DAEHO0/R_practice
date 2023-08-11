### ������ ó�� ###

# ������ �ε�
a <- data.frame(age = c(25, 30, NA, 22, 40),
                income = c(50000, NA, 60000, 75000, NA))

# ������ Ȯ��
miss_val <- sum(is.na(data))

# ������ ��ü(��� ���)
mean_income <- mean(a$income, na.rm = TRUE)
a$income[is.na(a$income)] <- mean_income
a$income[is.na(a$income)]
# numeric(0)


### �̻�ġ ó�� ###

# ������ �ε�
b <- data.frame(age = c(25, 30, 22, 50, 500),
                income = c(50000, 60000, 75000, 80000, 100000))

# �̻�ġ Ž��
boxplot(b$age, b$income)

#�̻�ġ ó��
q1 <- quantile(b$age, 0.25)
q3 <- quantile(b$age, 0.75)
iqr <- q3 - q1
lower <- q1 - 1.5 * iqr
upper <- q3 + 1.5 * iqr
data_no_out <- b[b$age >= lower & b$age <= upper, ]
data_no_out


### �ߺ��� ó�� ###

# ������ �ε�
d <- data.frame(id = c(1, 2, 3, 1, 4),
                score = c(90, 85, 78, 90, 92))

# �ߺ��� Ȯ��
dupl_rows <- d[duplicated(d), ]
dupl_rows
# id score
# 4  1    90 <- �ߺ���

# �ߺ��� ����
uniq_data <- unique(d)
uniq_data


### ����ȭ ###

# ������ �ε�
echo <- data.frame(age = c(25, 30, 22, 25, 40),
                   income = c(50000, 60000, 75000, 80000, 90000))

# �ּ�-�ִ� ����ȭ
mn_mx_norm <- function(x) {
  return((x - min(x)) / (max(x) - min(x)))
}

norm_data <- as.data.frame(lapply(data, mn_mx_norm))
# Error in Summary.factor(c(1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, :
# ��min�� not meaningful for factors

# Z-���� ����ȭ
z_score_norm <- function(x) {
  return((x - mean(x)) / sd(x))
}

### ������ ���� ###

# ������ �ε�
data1 <- data.frame(id = c(1, 2, 3),
                    name = c("Choonsik", "Chulsoo", "Boknam"))
data2 <- data.frame(id = c(2, 3, 4),
                    score = c(85, 78, 92))

# �� ���� ����(rbind)
mer_row <- rbind(data1, data2)
# Error in match.names(clabs, names(xi)) : 
# names do not match previous names
mer_col <- cbind(data1, data2)
mer_col

# ���� �� ���� ����(merge)
mer_common <- merge(data1, data2, by = "id")
mer_common


### �Ļ����� ###

# ������ �ε�
foxtrot <- data.frame(height_cm = c(160, 175, 168, 172, 158),
                      weight_kg = c(50, 70, 60, 65, 48))

# BMI(ü���� ����) �Ļ����� ����
foxtrot$BMI <- foxtrot$weight_kg / ((foxtrot$height_cm / 100) ^ 2)
foxtrot$BMI