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
  mutate(QDTFILVIVO = if_else(is.na(QDTFILVIVO), 
                           calc_mode(QDTFILVIVO), 
                           QDTFILVIVO))
baseJoin %>% 
  mutate(QDTFILMORT = if_else(is.na(QDTFILMORT), 
                           calc_mode(QDTFILMORT), 
                           QDTFILMORT))
baseJoin %>% 
  mutate(CONSULTAS = if_else(is.na(CONSULTAS), 
                           calc_mode(CONSULTAS), 
                           CONSULTAS))

#Verificando Normalidade

shapiro.test(baseJoin$IDADEMAE)
shapiro.test(baseJoin$PESO)