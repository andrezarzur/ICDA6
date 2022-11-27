library(ggplot2)
library(cowplot)

# Comparativo da quantidade de barbearias por área por shopping
grafico1 <- ggplot(data=shopping, aes(x=Nome, y=barbearia, group=1)) +
  geom_line()+
  geom_point()

grafico2 <- ggplot(data=shopping2, aes(x=Nome, y=barbearia, group=1)) +
  geom_line()+
  geom_point()

plot_grid(grafico1, grafico2, labels = "AUTO")
# é possível ver que, por mais que o shopping2 tenha mais áreas contendo barbearia,
# as áreas do shopping1 que contém barbearias possuem um valor absoluto maior, boa
# parte delas contendo 3 barbearias
