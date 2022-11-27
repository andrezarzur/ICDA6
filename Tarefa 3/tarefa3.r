library(tidyverse)

sinasc <- SINASC_2020_compilado%>%
  slice_head(n = 50000)


ggplot(sinasc, aes(x=sinasc$IDADEMAE)) + geom_bar()
boxplot(sinasc$IDADEMAE)
mediaIdadeMae <- mean(sinasc$IDADEMAE, na.rm = TRUE)
mediaIdadeMae

hist(sinasc$PESO)
boxplot(sinasc$PESO)
mediaPeso <- mean(sinasc$PESO, na.rm = TRUE) / 1000
mediaPeso
