ancho <- 10
largo <- 4
superficie <- ancho*largo

mortalidad <- read.csv(file ="mortalidad.csv") #leo el archivo

dim(mortalidad)
names(mortalidad)
str(mortalidad)
head(mortalidad)
tail(mortalidad)

library(tidyverse)
ggplot(data = mortalidad)+
  geom_col(aes(x = Comuna, y = X2017, fill = as.factor(Comuna)))
