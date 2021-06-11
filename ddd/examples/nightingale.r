# Creating a circular line chart
# https://biostats.w.uib.no/creating-a-circular-line-chart/

# Florence Nightingale’s “rose charts” (and others) in ggplot2
# https://www.r-bloggers.com/2021/03/florence-nightingales-rose-charts-and-others-in-ggplot2/

library(ggplot2)
library(directlabels)
library(tidyverse)

covidbr <- read.csv('obitos-br.csv', header = TRUE)
covidbr %>% 
  select(Date, Month, Year, Deaths) %>% 
  mutate(Month = fct_relevel(Month, "Jul", "Aug", "Sep", "Oct", "Nov", "Dec", "Jan", "Feb", "Mar", "Apr", "May", "Jun")) %>% 
  ggplot(aes(Month, Deaths)) + 
  geom_col(width = 1, position = "identity") + 
  coord_polar() + 
  facet_wrap(~Year) +
  scale_fill_manual(values = c("skyblue3", "grey30", "firebrick")) +
  scale_y_sqrt() +
  theme_void() +
  theme(axis.text.x = element_text(size = 9),
        strip.text = element_text(size = 11),
        legend.position = "bottom",
        plot.background = element_rect(fill = alpha("cornsilk", 0.5)),
        plot.margin = unit(c(10, 10, 10, 10), "pt"),
        plot.title = element_text(vjust = 5)) +
  ggtitle("Diagram of Deaths in Brazil")




covidbr %>%
  select(Date, Month, Year, Deaths) %>%
  ggplot(aes(x = Month, y = Deaths, color = Year)) +
  geom_line() +
  coord_polar()

  scale_fill_manual(values = c("skyblue3", "grey30", "firebrick")) +
  scale_y_sqrt() +
  theme_void() +
  theme(axis.text.x = element_text(size = 9),
        strip.text = element_text(size = 11),
        legend.position = "bottom",
        plot.background = element_rect(fill = alpha("cornsilk", 0.5)),
        plot.margin = unit(c(10, 10, 10, 10), "pt"),
        plot.title = element_text(vjust = 5)) +
  ggtitle("Diagram of Deaths in Brazil")



library(ggplot2)
library(directlabels)
library(tidyverse)

covidbr <- read.csv('obitos-br.csv', header = TRUE)
covidbr$Date <- as.Date(covidbr$Date,format="%Y-%m-%d")
covidbr$Year <- as.factor(covidbr$Year)
covidbr$Month <- factor(covidbr$Month, levels = unique(covidbr$Month))
covidbr[,"month_number"] <- as.integer(format(covidbr[,"Date"], "%m"))

ggplot(covidbr, aes(x =  Month, y = Deaths, group = Year, color = Year)) + 
  geom_line() + 
  geom_dl(aes(label=Year), method="last.points") +
  theme_classic() +
  coord_fixed(ratio=0.0001) +
  labs(title = "Diagram of deaths in Brazil", caption = "source:\nSIDRA(Sistema IBGE de Recuperação Automática)\nRegistro Civil")
ggsave('deaths-brazil-lines.png')




library(ggplot2)
library(directlabels)
library(tidyverse)

covidbr <- read.csv('obitos-br.csv', header = TRUE)
covidbr$Date <- as.Date(covidbr$Date,format="%Y-%m-%d")
covidbr$Year <- as.factor(covidbr$Year)
covidbr$Month <- factor(covidbr$Month, levels = unique(covidbr$Month))
covidbr[,"month_number"] <- as.integer(format(covidbr[,"Date"], "%m"))

thisyear <- as.data.frame(subset(covidbr, Year == 2021))
pastyears <- as.data.frame(subset(covidbr, Year != 2021)) # filter(covidbr, Year != 2021)
ggplot(pastyears, aes(x = Month, y = Deaths, group = Year, color = Year)) +
  geom_polygon(size=1.2, fill = NA, show.legend=FALSE) +
  geom_line(data=thisyear, size=1.2) +
  coord_polar() +
  theme_bw() +
  labs(title = "Diagram of deaths in Brazil", caption = "Source:\nSIDRA(Sistema IBGE de Recuperação Automática)\nRegistro Civil")
ggsave('deaths-brazil-polar.png')




#### NORMALIZING BY POPULATION

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
ggsave('deaths-brazil-polar-per1E6.png')


ggplot(covidbrN, aes(x =  Month, y = DeathsPerMillion, group = Year, color = Year)) +
  geom_line() +
  geom_dl(aes(label=Year), method="last.points") +
  theme_classic() +
  coord_fixed(ratio=0.02) +
  labs(title = "Diagram of deaths in Brazil", caption = "source:\nSIDRA(Sistema IBGE de Recuperação Automática)\nRegistro Civil")
ggsave('deaths-brazil-lines-per1E6.png')


