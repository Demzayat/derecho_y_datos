library(tidyverse)
library(sf)

mortalidad <- read.csv(file ="mortalidad.csv") #leo el archivo

# exploro la tabla --------------------------------------------------------

dim(mortalidad)
names(mortalidad)
str(mortalidad)
head(mortalidad)
tail(mortalidad)

table(mortalidad$X2017)


# armamos los datos -------------------------------------------------------

mortalidad2017 <- mortalidad %>% 
  select(Comuna, X2017)
nueva_columna <- c("Sur", "Norte", "Sur", "Sur", "Sur", "Norte", "Sur", "Sur", "Sur", "Norte", "Norte", "Norte", "Norte", "Norte", "Norte")

mortalidad2017 <- mortalidad2017 %>% 
  mutate(Zona = nueva_columna)

mortalidad <- mortalidad %>% 
  mutate(promedio = as.numeric(X2010)-as.numeric(X2011))

comuna5 <- mortalidad %>% 
  filter(Comuna == 5)

# Grafico -----------------------------------------------------------------


ggplot(data = mortalidad2017, aes(x=as.factor(Comuna), y = X2017))+
  geom_col(aes(fill= Zona))+
  labs(title= "Grafico comunas", x = "Comuna", y = "mortalidad")+
  geom_text(aes(label = X2017), nudge_y = 0.5, size = 3)+
  theme_bw()

  