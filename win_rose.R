# Если ещё не установлено:
if (!require(openair)) install.packages("openair")
library(openair)

# Используем ваш датафрейм
data <- horni_vitkov

# Проверим, есть ли пропуски или некорректные значения
# (например, скорость или температура как -1 — это, видимо, пропуск)
data$WV_LHVIA[data$WV_LHVIA < 0] <- NA
data$T4_LHVIA[data$T4_LHVIA < -50] <- NA # если -1 и 277 — это пропуски

# Строим розу ветров
windRose(
  data,
  ws = "WV_LHVIA",     # скорость ветра
  wd = "WD_LHVIA",     # направление ветра
  type = "T4_LHVIA",   # цвет — температура
  angle = 15,          # 24 секторов
  cols = "turbo",      # цветовая палитра
  key.header = "Teplota, °C",
  key.position = "right",
  main = "Větrná Růžice LHVI (Barva - teplota / 24 sectors)",
  paddle = FALSE       # круговые сектора
)
