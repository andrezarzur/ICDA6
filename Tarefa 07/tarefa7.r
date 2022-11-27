#referencia: https://www.codingprof.com/how-to-replace-nas-with-the-mode-most-frequent-value-in-r/

library(ggplot2)
library(dplyr)
library(DAAG)

baseJoin <- municipios %>% inner_join(SINASC_2020_compilado, by = c("CODMUNIC" = "CODMUNNASC"))

calc_mode <- function(x){
  
  # List the distinct / unique values
  distinct_values <- unique(x)
  
  # Count the occurrence of each distinct value
  distinct_tabulate <- tabulate(match(x, distinct_values))
  
  # Return the value with the highest occurrence
  distinct_values[which.max(distinct_tabulate)]
}

#Tratando NA
baseJoin %>% 
  mutate(LOCNASC = if_else(is.na(LOCNASC), 
                           calc_mode(LOCNASC), 
                           LOCNASC))

baseJoin %>% 
  mutate(CONSULTAS = if_else(is.na(CONSULTAS), 
                             calc_mode(CONSULTAS), 
                             CONSULTAS))


#Criando RLin

modelLinear = lm(IDADEMAE ~ PESO, data = baseJoin)
modelLinear

predict(modelLinear, newdata = data.frame(IDADEMAE > 60))

cor(baseJoin$IDADE,baseJoin$PESO)

set.seed(100)
treino <- sample(1:nrow(baseJoin), 0.8*nrow(baseJoin))
treinoDados <- baseJoin[treino, ] 
testeDados  <- baseJoin[-treino, ]

#Criando RLog
modelLogistico <- glm(PARTO~GRAVIDEZ+GESTACAO, data = treinoDados, family = "binomial")
summary(model_tit)

head(predict(modelLogistico, type = 1))

