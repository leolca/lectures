# http://www.seguranca.mg.gov.br/2018-08-22-13-39-06/dados-abertos
# https://github.com/ipeaGIT/geobr
# https://cran.r-project.org/web/packages/geobr/vignettes/intro_to_geobr.html
# https://r-spatial.org/r/2018/10/25/ggplot2-sf-2.html
# http://tabnet.datasus.gov.br/cgi/deftohtm.exe?ibge/cnv/popmg.def

library(geobr)
library(ggplot2)
library(dplyr)
library(stringr)

datasets <- list_geobr()
muni <- read_municipality(code_muni= "MG", year=2020)

no_axis <- theme(axis.title=element_blank(),
           axis.text=element_blank(),
           axis.ticks=element_blank(),
           panel.grid.major = element_blank(), 
           panel.grid.minor = element_blank(),
           plot.caption = element_markdown(lineheight = 1.2)
           )


ggplot() + geom_sf(data=muni, fill="#2D3E50", color="#FEBF57", size=.15, show.legend = FALSE) + theme_minimal() + no_axis

muni %>% filter(name_muni == "Belo Horizonte") %>% ggplot() + geom_sf(fill="#2D3E50", color="#FEBF57", size=.15, show.legend = FALSE) + theme_minimal() + no_axis

url_veiculos <- "http://www.seguranca.mg.gov.br/images/2021/Junho/EstatisticasMaio/Banco%20Veculos%20Furtados%20-%20Atualizado%20Maio%202021.csv"
file <- "/tmp/data.csv"
download.file(url=url_veiculos, destfile=file, method="wget", extra="--user-agent='Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36'")
file_utf8 <- "/tmp/data_utf8.csv"
cmd <- paste("iconv -f ISO-8859-1 -t ASCII//TRANSLIT",file,"> ",file_utf8)
system(cmd)
df <- read.csv(file = file_utf8, sep=";")
df$Municipio <- str_replace(str_to_title(tolower(df$Municipio)), "-", " ")
df %>% group_by(Municipio, Ano)  %>% summarise(Registros = sum(Registros)) 
df2 <- df %>% group_by(Municipio, Ano)  %>% summarise(Registros = sum(Registros))
names(df2)[1] <- "name_muni"

# subset(df2, !(name_muni %in% muni$name_muni))
muni$name_muni <- str_replace(iconv(muni$name_muni, to="ASCII//TRANSLIT"), "-", " ")
df_muni <- merge(x=muni, y=df2, by = "name_muni", all.x = TRUE) # https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/merge
#df_muni$name_muni[ which(is.na(df_muni$Registros)) ]
df_muni$Registros[ is.na(df_muni$Registros) ] <- 0

ggplot(data=df_muni) + geom_sf(aes(fill=Registros)) + scale_fill_viridis_c(trans = "sqrt", alpha = .4) + facet_wrap(~ Ano) + theme_minimal() + no_axis

ggplot(data=df_muni) + geom_sf(aes(fill=Registros)) + facet_wrap(~ Ano) + theme_minimal() + no_axis

df_muni %>% filter(Ano == 2020) %>% ggplot() + geom_sf(aes(fill=Registros)) + theme_minimal() + no_axis + ggtitle("Furtos de veículos em 2020")

df_muni %>% filter(Ano == 2020) %>% ggplot() + geom_sf(aes(fill=Registros), color='black', size=0.1) + scale_fill_viridis_c(trans = "sqrt", alpha = .8) + theme_minimal() + no_axis + ggtitle("Furtos de veículos em 2020")
ggsave('/tmp/mg-furtos-veiculos.pdf')


# http://tabnet.datasus.gov.br/cgi/deftohtm.exe?ibge/cnv/popmg.def
# save data in text file : pop-mg-2012.txt
# cat pop-mg-2012.txt | iconv -f utf8 -t ascii//TRANSLIT | awk -F';' '{gsub(/"/,"",$1); n=split($1,x," "); printf "%s",x[1]","; for(i=2;i<n;i++) printf "%s",x[i]" "; printf "%s",x[i]; print ","$2}' > pop-mg-2012.csv
# sed -i '1s/^/code_muni,name_muni,pop\n/' pop-mg-2012.csv

file_pop <- 'pop-mg-2012.csv'
df_pop <- read.csv(file = file_pop)
df_muni2 <- merge(x=df_muni, y=df_pop, by = "name_muni", all.x = TRUE) 
df_muni2$RegistrosNorm <- 100000*df_muni2$Registros/df_muni2$pop

sAno <- 2020
df_muni2 %>% filter(Ano == sAno) %>% 
  ggplot() + 
  geom_sf(aes(fill=RegistrosNorm), color='black', size=0.1) + 
  scale_fill_viridis_c(trans = "sqrt", alpha = .8) + 
  theme_minimal() + no_axis + 
  ggtitle(paste("Furtos de veículos em", sAno)) + 
  labs(fill="Registros por\n100 mil hab.", caption="**Fonte dos dados**<br/>*Furto de veículos:* Secretaria de Segurança Pública de MG<br/>*População por município (2012):* DATASUS")

ggsave(paste('/tmp/mg-furtos-veiculos-norm-',sAno,'.pdf'))


df_muni2 %>% filter(!is.na(Ano)) %>% 
  ggplot() +
  geom_sf(aes(fill=RegistrosNorm), color='black', size=0.1) +
  facet_wrap(~ Ano) +
  scale_fill_viridis_c(trans = "sqrt", alpha = .8) +
  theme_minimal() + no_axis +
  ggtitle("Furtos de veículos de 2015 a 2021") +
  labs(fill="Registros por\n100 mil hab.", caption="**Fonte dos dados**<br/>*Furto de veículos:* Secretaria de Segurança Pública de MG<br/>*População por município (2012):* DATASUS")

ggsave('/tmp/mg-furtos-veiculos-2015a2021.png')


