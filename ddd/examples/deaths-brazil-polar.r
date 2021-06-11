library(ggplot2)
library(directlabels)
library(tidyverse)

popbr <- read.csv('populacao-br.csv', header = TRUE)
covidbrN <- merge(covidbr, popbr, by="Year")
covidbrN[,"DeathsPerMillion"] <- 1E6*covidbrN["Deaths"]/covidbrN["Population"]
thisyear <- as.data.frame(subset(covidbrN, Year == 2021))
pastyears <- as.data.frame(subset(covidbrN, Year != 2021))
ggplot(pastyears, aes(x = Month, y = DeathsPerMillion, group = Year, color = Year)) +
  geom_polygon(size=1.2, fill = NA) +
  geom_line(data=thisyear, size=1.2) +
  coord_polar() +
  theme_bw() +
  labs(title = "Diagram of deaths in Brazil", caption = "Source:\nSIDRA(Sistema IBGE de Recuperação Automática)\nRegistro Civil")
ggsave('deaths-brazil-polar-per1E6.pdf')
