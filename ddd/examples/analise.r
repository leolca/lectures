library(ggplot2)
filename <- 'data.csv'
dataset <- read.csv(filename)
dataset$apto_num <- dataset$apto
dataset$apto <- as.factor(dataset$apto)
dataset$data <- as.Date(dataset$data, format = "%d/%m/%Y")
summary(dataset)

ggplot(data=subset(dataset, apto %in% c('1002')), aes(x=data, y=agua)) + geom_line(size=1) + ylim(0, 250) + theme_minimal()

ggplot(data=subset(dataset, apto_num < 700), aes(x=data, y=agua, color=apto)) + geom_line(size=1) + ylim(0, 250) + theme_minimal()


library(dplyr)
tmp <- dataset %>% mutate(apto2=apto)

tmp %>%
  ggplot(aes(x=data, y=agua)) +
  geom_line( data=tmp %>% dplyr::select(-apto), aes(group=apto2), color="grey", size=0.5, alpha=0.5) +
  geom_line( aes(color=apto), color="#59a392", size=1.2 ) +
  ylim(0, 250) +
  theme_minimal() + 
  theme(
      legend.position="none",
      plot.title = element_text(size=14),
      panel.grid = element_blank()
    ) +
  facet_wrap(~apto)



library(ggforce)

tmp %>%
  ggplot(aes(x=data, y=agua)) +
  geom_line( data=tmp %>% dplyr::select(-apto), aes(group=apto2), color="grey", size=0.5, alpha=0.5) +
  geom_line( aes(color=apto), color="#59a3ef", size=1.2 ) +
  ylim(0, 250) +
  theme_minimal() +
  theme(
      legend.position="none",
      plot.title = element_text(size=14),
      panel.grid = element_blank(),
      axis.line = element_line(size = 0.25, colour = "black", linetype=1)
    ) +
 facet_wrap_paginate(~ apto, ncol = 4, nrow = 4, page = 1)



pdf("agua.pdf")
for(i in 1:5){
print(
tmp %>%
  ggplot(aes(x=data, y=agua)) +
  geom_line( data=tmp %>% dplyr::select(-apto), aes(group=apto2), color="grey", size=0.5, alpha=0.5) +
  geom_line( aes(color=apto), color="#59a392", size=1.2 ) +
  ylim(0, 250) +
  theme_minimal() +
  theme(
      legend.position="none",
      plot.title = element_text(size=14),
      panel.grid = element_blank()
    ) +
 facet_wrap_paginate(~ apto, ncol = 4, nrow = 4, page = i)
)
}
dev.off()

pdf("gas.pdf")
for(i in 1:5){
print(
tmp %>%
  ggplot(aes(x=data, y=gas)) +
  geom_line( data=tmp %>% dplyr::select(-apto), aes(group=apto2), color="grey", size=0.5, alpha=0.5) +
  geom_line( aes(color=apto), color="#59a392", size=1.2 ) +
  ylim(0, 250) +
  theme_minimal() +
  theme(
      legend.position="none",
      plot.title = element_text(size=14),
      panel.grid = element_blank()
    ) +
 facet_wrap_paginate(~ apto, ncol = 4, nrow = 4, page = i)
)
}
dev.off()

pdf("gas_aq.pdf")
for(i in 1:5){
print(
tmp %>%
  ggplot(aes(x=data, y=gas_aq)) +
  geom_line( data=tmp %>% dplyr::select(-apto), aes(group=apto2), color="grey", size=0.5, alpha=0.5) +
  geom_line( aes(color=apto), color="#59a392", size=1.2 ) +
  ylim(0, 250) +
  theme_minimal() +
  theme(
      legend.position="none",
      plot.title = element_text(size=14),
      panel.grid = element_blank()
    ) +
 facet_wrap_paginate(~ apto, ncol = 4, nrow = 4, page = i)
)
}
dev.off()

