library(ggplot2)
library(directlabels)
library(tidyverse)

covidbr <- read.csv('obitos-br.csv', header = TRUE)
covidbr$Date <- as.Date(covidbr$Date,format="%Y-%m-%d")
covidbr$Year <- as.factor(covidbr$Year)
covidbr$Month <- factor(covidbr$Month, levels = unique(covidbr$Month))
covidbr[,"month_number"] <- as.integer(format(covidbr[,"Date"], "%m"))

popbr <- read.csv('populacao-br.csv', header = TRUE)
covidbrN <- merge(covidbr, popbr, by="Year")
covidbrN[,"DeathsPerMillion"] <- 1E6*covidbrN["Deaths"]/covidbrN["Population"]

ggplot(covidbrN, aes(x =  Month, y = DeathsPerMillion, group = Year, color = Year)) +
  geom_line() +
  geom_dl(aes(label=Year), method=list('last.points', cex = 1, hjust = 1) +
  theme_classic() +
  coord_fixed(ratio=0.02) +
  labs(title = "Diagram of deaths in Brazil", caption = "source:\nSIDRA(Sistema IBGE de Recuperação Automática)\nRegistro Civil")
ggsave('deaths-brazil-lines-per1E6.pdf')

thisyear <- as.data.frame(subset(covidbrN, Year == 2021))
pastyears <- as.data.frame(subset(covidbrN, Year != 2021))
ggplot(pastyears, aes(x = Month, y = DeathsPerMillion, group = Year, color = Year)) +
  geom_polygon(size=1.2, fill = NA, show.legend=FALSE) +
  geom_line(data=thisyear, size=1.2) +
  coord_polar() +
  theme_bw() +
  labs(title = "Diagram of deaths in Brazil", caption = "Source:\nSIDRA(Sistema IBGE de Recuperação Automática)\nRegistro Civil")
ggsave('deaths-brazil-polar-per1E6.pdf')
