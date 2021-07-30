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

####               TOP 100 CANCIONES PORTAL DE MUSICA             ####

######################################################################

#### INSTALANDO PAGINA WEB ####

portalcanciones <- read_html("https://www.elportaldemusica.es/lists/top-100-canciones/2020")

print(html_text(portalcanciones))



#### LISTADO DE CANCIONES ####

listacanciones_portal <- html_nodes(portalcanciones, css = "#w1")


#### EXTRACCION DE DATOS POR CANCION #### 

# Posicion de la cancion 

posicioncancion_portal <- html_nodes(listacanciones_portal, css = ".single-list-entry-rank-position")
textoposicioncancion_portal <- html_text(posicioncancion_portal)
textoposicioncancion_portal <- as.numeric(textoposicioncancion_portal)
for (a in 1:length(textoposicioncancion_portal)) {
  print(textoposicioncancion_portal[a])
}


# Nombre de la cancion 

nombrecancion_portal <- html_nodes(listacanciones_portal, css = ".name")
textonombrecancion_portal <- html_text(nombrecancion_portal)
textonombrecancion_portal <- gsub("\n","", textonombrecancion_portal)
textonombrecancion_portal <- as.character(textonombrecancion_portal)
textonombrecancion_portal <- trim(textonombrecancion_portal)
for (b in 1:length(textonombrecancion_portal)) {
  print(textonombrecancion_portal[b])
}


# Cantante de la cancion 

cantantecancion_portal <- html_nodes(listacanciones_portal, css = ".related")
textocantantecancion_portal <- html_text(cantantecancion_portal)
textocantantecancion_portal <- gsub("\n", "", textocantantecancion_portal)
textocantantecancion_portal <- trim(textocantantecancion_portal)
for (c in 1:length(textocantantecancion_portal)) {
  print(textocantantecancion_portal[c])
}


# Semanas en lista de la cancion 

semanaslista_portal <- html_nodes(listacanciones_portal, css = ".list_week")
textosemanaslista_portal <- html_text(semanaslista_portal)
textosemanaslista_portal <- gsub("\n", "", textosemanaslista_portal)
textosemanaslista_portal <- trim(textosemanaslista_portal)
for (d in 1:length(textosemanaslista_portal)) {
  print(textosemanaslista_portal[d])
}



#### CREANDO DATA FRAME PORTAL DE CANCIONES #### 
# Creando Dataframe con Informacion de pagina el portal de musica hot 100.

datoscancionesportal <- data.frame()
itemportalcanciones <- data.frame(posicioncancion_portal = textoposicioncancion_portal,
                                  nombrecancion_portal = textonombrecancion_portal,
                                  cantantecancion_portal = textocantantecancion_portal,
                                  semanaslista_portal = textosemanaslista_portal)
                                  


#### ALMACENAR INFORMACION CON DATOS TOTALES ####                                 

datoscancionesportal <- rbind(datoscancionesportal, itemportalcanciones)




