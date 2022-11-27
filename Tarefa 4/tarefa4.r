library(tidyverse)

baseJoin <- municipios %>% inner_join(SINASC_2020_compilado, by = c("CODMUNIC" = "CODMUNNASC"))

mediaIdadeMaeRoraima <- mean(baseJoin$IDADEMAE[baseJoin$uf_code=="RO"], na.rm = TRUE)
mediaIdadeMaeRoraima

mediaIdadeMaeSaoPaulo <- mean(baseJoin$IDADEMAE[baseJoin$uf_code=="SP"], na.rm = TRUE)
mediaIdadeMaeSaoPaulo

hist(baseJoin$PESO[baseJoin$uf_code=="AL"])

hist(baseJoin$RACACOR[baseJoin$uf_code=="AL"])
hist(baseJoin$RACACOR[baseJoin$uf_code=="SP"])
hist(baseJoin$RACACOR[baseJoin$uf_code=="PR"])

