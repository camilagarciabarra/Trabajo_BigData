######################################################################

####                          REQUERIMIENTOS                      ####

######################################################################

#### Configuracion Espacio de Trabajo ####

setwd("C:/Users/camil/Desktop/Trabajo_BigData")

#### Instaland Paquetes #### 

# Instalando paquete rvest
install.packages("rvest")

# Instalando paquete gdata
install.packages("gdata")


#### Implementando Paquetes 
# Implementando rvest
library(rvest)

# Implementando gdata
library(gdata)


######################################################################

####                  TOP 100 CANCIONES BILLBOARD                 ####

######################################################################


#### INSTALANDO PAGINA WEB ####

billboard <- read_html("https://www.billboard.com/charts/hot-100")

print(html_text(billboard))



#### LISTADO DE CANCIONES ####

listacanciones_billboard <- html_nodes(billboard, css = ".chart-list__elements")


#### EXTRACCION DE DATOS POR CANCION #### 

# Posicion de la cancion 

posicioncancion_billboard <- html_nodes(listacanciones_billboard, css = ".chart-element__rank__number")
textoposicioncancion_billboard<- html_text(posicioncancion_billboard)
textoposicioncancion_billboard <- as.numeric(textoposicioncancion_billboard)
for (e in 1:length(textoposicioncancion_billboard)) {
  print(textoposicioncancion_billboard[e])
}


# Nombre de la cancion 

nombrecancion_billboard <- html_nodes(listacanciones_billboard, css = ".chart-element__information__song.text--truncate.color--primary")
textonombrecancion_billboard <- html_text(nombrecancion_billboard)
textonombrecancion_billboard <- gsub("\n","", textonombrecancion_billboard)
textonombrecancion_billboard <- as.character(textonombrecancion_billboard)
textonombrecancion_billboard <- trim(textonombrecancion_billboard)
for (f in 1:length(textonombrecancion_billboard)) {
  print(textonombrecancion_billboard[f])
}


# Cantante de la cancion 

cantantecancion_billboard <- html_nodes(listacanciones_billboard, css = ".chart-element__information__artist.text--truncate.color--secondary")
textocantantecancion_billboard <- html_text(cantantecancion_billboard)
textocantantecancion_billboard <- gsub("\n", "", textocantantecancion_billboard)
textocantantecancion_billboard <- trim(textocantantecancion_billboard)
for (g in 1:length(textocantantecancion_billboard)) {
  print(textocantantecancion_billboard[g])
}


# Semanas en lista de la cancion 

semanaslista_billboard <- html_nodes(listacanciones_billboard, css = ".chart-element__meta.text--center.color--secondary.text--week")
textosemanaslista_billboard <- html_text(semanaslista_billboard)
textosemanaslista_billboard <- gsub("\n", "", textosemanaslista_billboard)
textosemanaslista_billboard <- trim(textosemanaslista_billboard)
for (h in 1:length(textosemanaslista_billboard)) {
  print(textosemanaslista_billboard[h])
}



#### CREANDO DATA FRAME PARA BILLBOARD #### 
# Creando Dataframe con Informacion de pagina billboard hot 100.

datoscancionesbillboard <- data.frame()
itembillboard <- data.frame(posicioncancion_billboard = textoposicioncancion_billboard,
                            nombrecancion_billboard = textonombrecancion_billboard,
                            cantantecancion_billboard = textocantantecancion_billboard,
                            semanaslista_billboard = textosemanaslista_billboard)



#### ALMACENAR INFORMACION CON DATOS TOTALES ####                                 

datoscancionesbillboard <- rbind(datoscancionesbillboard, itembillboard)



