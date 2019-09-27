library(tidyverse)

largo <- 10
ancho <- 5

superficie <- largo * ancho

mortalidad <- read_csv2("https://raw.githubusercontent.com/Demzayat/derecho_y_datos/master/Clase1/mortalidad.csv")
head(mortalidad)
tail(mortalidad)

ggplot(data = mortalidad, aes(x= Comuna, y = `2018`))+
    geom_col()+
    geom_text(aes(label = `2018`), nudge_y = 0.4)


mortalidad <- mortalidad %>% 
    mutate(Comuna = as.factor(Comuna))

