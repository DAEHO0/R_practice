### 선형 회귀 ###

# 라이브러리 불러오기
library(ggplot2)

# 예시 데이터 생성
oska <- data.frame(x = c(1, 2, 3, 4, 5),
                   y = c(3, 6, 8, 11, 15))

# 선형회귀 분석
lm_model <- lm(y ~ x, data = oska)

# 회귀 분석 결과 출력
summary(lm_model)

# 산점도와 회귀선 시각화
ggplot(oska, aes(x, y)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  labs(title = "선형 회귀 분석 결과")
