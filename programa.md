
<!-- rnb-text-begin -->

---
title: "Derecho y Datos"
output:
  html_document:
    df_print: paged
    toc: yes
    depth: 4
    theme: cerulean
    toc_float: yes
    keep_md: yes
  html_notebook:
    depth: 4
    df_print: paged
    theme: cerulean
    toc: yes
    toc_float: yes
---

# Presentación

En el taller de "Derecho y Datos" (martes de 16.30 a 18.30hs, Instituto "Gioja", Facultad de Derecho Universidad de Buenos Aires) vamos a aprender a usar las herramientas de la Ciencia de Datos para la elaboración de investigaciones jurídicas. La idea es poder manipular bases de datos públicas, para obtener datos relevantes para la investigación jurídica.

Usaremos la herramienta "R" para manipular datos. ¿Qué es R? es un lenguaje de programación para la manipulación estadística de grandes bases de datos, de fuente abierta, muy popular en ámbitos académicos. Para ello, debemos tener instalado el programa, junto con el entorno de trabajo RStudio, y empezar a usarlo.

# Instalación

Vamos a seguir una adaptación de las instrucciones de Laura Acion, de [aquí](https://github.com/lauracion/R_Curso_de_Nivelacion/blob/master/Instalacion_R_RStudio.md#instalaci%C3%B3n-de-r-y-rstudio). 

## Instalación de R y RStudio

En este curso utilizaremos R a través del IDE RStudio. 

¿Qué es un IDE? IDE es el acrónimo de *Integrated Development Environment* (*Entorno de Desarrollo Integrado*). Esto quiere decir que RStudio es una aplicación que nos entrega herramientas para hacer más fácil el desarrollo de proyectos usando R.

Para poder instalar R y RStudio, seguí los siguientes pasos:

- Descargá R desde https://cran.r-project.org/. Debés elegir la opción que corresponda, según tu sistema operativo.
- Instalá R en tu computadora, tal como lo hacés con cualquier programa. 
- Una vez que R quedó correctamente instalado, descargá RStudio desde https://www.rstudio.com/products/rstudio/download/. Eligí la primera opción, es decir, "RStudio Desktop Open Source License" (gratuita). 
- Instalá RStudio en tu computadora, tal como lo haces con cualquier programa. 

Para un paso a paso que incluye imágenes de este proceso de instalación podés ir a [este archivo](https://github.com/lauracion/R_Curso_de_Nivelacion/blob/master/Instalacion_R_RStudio.pdf). 
Si quedó todo bien instalado, cuando abras RStudio deberías ver algo que se parece a esto:

![](https://github.com/lauracion/R_Curso_de_Nivelacion/raw/master/images/rstudio.png)

En este curso usaremos la última versión de R y RStudio, así que si tenés instalada una versión previa, puede que algunas cosas se vean un poco distintas.

IMPORTANTE: Si aparece algún error durante este proceso, lo más probabable es que sea por alguna configuración de tu sistema operativo. En ese caso, la mejor manera de buscar una solución es copiar el error que arroja R, pegarlo en, por ejemplo, Google y ver cómo alguien que se enfrentó a eso antes lo resolvió. Si no lográs solucionarlo, veremos problemas que hayan surgido personalmente durante el transcurso del curso.

## Instalación de los paquetes de R que usaremos

Cuando instalamos R por primera vez en la computadora, lo que estamos instalando es lo que se conoce como "R Base", es decir, los elementos centrales del lenguaje de programación. Una de las ventajas de R es que se trata de un lenguaje extensible: la propia comunidad de usuarios puede desarrollar nuevas posibilidades para utilizarlo. La manera de compartir estos nuevos desarrollos es a través de "paquetes", que incluyen, entre otras cosas, código y datos. Una analogía que se suele utilizar para explicar esto es que R Base es un teléfono celular tal como viene de fábrica y los paquetes las _apps_ que descargamos para que tenga más funcionalidades. 

En este curso usaremos dos paquetes: `sf` y `tidyverse`. El primero (`sf`) es un paquete para manipular mapas principalmente. `tidyverse`, por su parte, es un "megapaquete" que incluye otros paquetes en su interior. Todos los paquetes que conforman _la constelación_ "Tidyverse" comparten la misma visión sobre el trabajo con datos y la escritura de código. Quizás ahora eso suene un poco enigmático, pero más adelante explicaremos qué quiere decir. 

Para instalarlos, 

1. copiá el siguiente código:

```r
install.packages("tidyverse")
install.packages("sf")
```

2. pegálo en la consola (_Console_) de RStudio, luego del `>`:

![](https://github.com/lauracion/R_Curso_de_Nivelacion/raw/master/images/install.packages.png)

3. presioná 'enter'. 
Dependiendo de tu conexión a internet instalar todos los paquetes podría tomar unos minutos. El resultado se debería ver parecido a esto:


![](https://github.com/lauracion/R_Curso_de_Nivelacion/raw/master/images/paquetes_instalados.png)


¿Salió todo bien? ¡Excelente! Felicitaciones. Ya escribiste tus primeras tres líneas de código en R.

## Más instrucciones alternativas

Algunas diapositivas sobre la instalación y un poco más de explicación podes conseguir en este link de R-Ladies de La Pampa, https://github.com/rladies/meetup-presentations_santarosa/raw/master/RdesdeCero/Clase1/RdesdeCero_Clase1.pdf  


# Bibliografía

En el taller vamos a basarnos principalmente en dos libros. El primero más operativo, que usaremos como nuestro _manual_  será el de Antonio Vázquez Brust, _Ciencia de Datos para Gente Sociable_ disponible en el siguiente link https://bitsandbricks.github.io/ciencia_de_datos_gente_sociable/ 

Y asimismo vamos a ir a las fuentes principales _el tratado_ de Hadley Wickham (el _padre fundador_ del paquete Tidyverse, y un referente de RStudio) que escribió este _R for Data Science_ https://r4ds.had.co.nz/.

Este último está en inglés, y recomiendo leerlo allí, siempre que lean inglés. La comunidad R en Latinoamerica, que está creciendo mucho, y en donde Argentina es un país muy relevante, empezó un proyecto de traducción colectiva del libro de Wickham, disponible (al menos la primera parte) aquí: https://es.r4ds.hadley.nz/ 

Luego, hay un montón de bibliografía disponible. El 90% de lo que yo aprendí lo hice leyendo libros online. La filosofía de R es que sea de código abierto, y libremente disponible, y lo mismo sucede con la mayoría de los libros que se escriben sobre ello. De hecho, se puede usar R para escribir un libro, o un blog, o presentaciones, o incluso, este tutorial. Les voy a ir pasando links que me parezcan interesantes.

# Programa

Calculo 4 o 5 reuniones para aprender a usar R. De todos modos, la idea del _Taller_ es que sea un lugar donde cada uno pueda desarrollar sus inquietudes de investigación, y que comiencen al menos una investigación empírica de su interés, a partir del análisis de datos. Entonces, veremos despues de estas reuniones iniciales cómo quedar en contacto, para ir discutiendo colectivamente estas investigaciones. Algo que suele ocurrir es que no haya demasiado análisis empírico en derecho, y que si lo hay, no hay casi discusión sobre la metodología, y si la hay, no hay casi nada sobre el proceso de esa metodología. Eso es lo que quiero que hagamos luego, que podamos discutir sobre `el código` utilizado para llevar adelante la investigación. Gracias a R podemos hacerlo

## Clase 1
Qué es la Ciencia de Datos? Para qué sirve R? ¿Por qué puede ser importante esto?
Bibliofía: 

- Capítulos 1 y 2 del libro de Antonio

- Capítulo 1 del libro de Wickham

## Clase 2
Manipulación de datos. Verbos del Tidyverse

- Capítulo 3 del libro de Antonio

- Capítulo 5 del libro de Wickam

## Clase 3
Visulizaciones. GGplot

- Capítulo 4 del libro de Antonio

- Capítulo 3 del libro de Wickam

## Clase 4
Mapas y geolocalización

- Capítulo 6 del libro de Antonio

- primeros capítulos del libro _Geocomputation with R_ https://geocompr.robinlovelace.net/

## Clase 5 
Informes y presentaciones. Rmarkdown

- Capitulo 27, 28 y 29 del libro de Wickham.
- primeros capítulos del libro Rmarkdown the definitive guide https://bookdown.org/yihui/rmarkdown/ 

# ¿Qué tipo de análisis empíricos puede hacerse?

Con R también armé un sitio web, en donde fui armando unos breves posts sobre analisis 
jurídicos que pueden hacerse con datos. Está en pleno proceso, como la vida misma, pero si quieren ir chusmeando, está aca http://www.antidiscriminacion.org 

Nos vemos el martes!


<!-- rnb-text-end -->
