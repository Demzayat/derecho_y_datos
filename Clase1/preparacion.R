library(tidyverse)
library(sf)

mortalidad <- read_csv("~/Documents/GitHub/derecho_y_datos/Clase1/mortalidad.csv")

mortalidad$Comuna <- as.factor(mortalidad$Comuna)

#hacemos un grafico
ggplot(mortalidad) +
  geom_col(aes(x = factor(Comuna), y = `2017`))

comunas <- st_read("http://cdn.buenosaires.gob.ar/datosabiertos/datasets/comunas/CABA_comunas.geojson")

ggplot(data = comunas)+
  geom_sf(aes(fill = `ubicacion`))+
  geom_sf(data = rivadavia, col = "red")

nueva_columna <- c("Sur", "Norte", "Sur", "Sur", "Sur", "Norte", "Sur", "Sur", "Sur", "Norte", "Norte", "Norte", "Norte", "Norte", "Norte")
rivadavia <- st_read("http://cdn.buenosaires.gob.ar/datosabiertos/datasets/calles/avenida_rivadavia.geojson")

comunas <- mutate(comunas, ubicacion = nueva_columna)

mortalidad_comuna <- mortalidad %>% 
  left_join(y = comunas, by = c( "Comuna" = "comunas")) %>% 
  select(-barrios, -perimetro, -area)

mortalidad_comuna <- mortalidad_comuna %>% 
  mutate(lugar = st_centroid(mortalidad_comuna$geometry)) %>% 
  separate(lugar, into =c(long, lat))

ggplot(data = mortalidad_compacta)+
  geom_sf(aes(fill = Total))+
  geom_sf(data = rivadavia, col = "red")+
  scale_fill_distiller(palette = 1, direction = 1)+
  geom_sf_text(aes(label = Comuna))+
  labs(title ="Mortalidad Infantil por comuna - Años 2010- 2017", 
       caption = "Elaboración propia en base a datos del GCBA", 
       fill = "Tasa cada 1000")+
    facet_wrap(~Ano,nrow = 3  )



mortalidad_compacta <- mortalidad %>% 
  gather(key = Ano, value = Total,  `2010`,`2011`, `2012`, `2013`, `2014`, `2015`, `2016`, `2017`) %>% 
  left_join(y = comunas, by = c( "Comuna" = "comunas")) %>% 
  select(-barrios, -perimetro, -area)
