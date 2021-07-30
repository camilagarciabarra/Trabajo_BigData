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

# Instalando paquete gdata
install.packages("dplyr")

# Instalando paquete ggplot 2
install.packages("ggplot2")

# Instalando Paquete xlsx
install.packages("xlsx")


#### Implementando Paquetes 
# Implementando rvest
library(rvest)

# Implementando gdata
library(gdata)

# Implementando gdata
library(dplyr)

# Implementando ggplot2
library(ggplot2)

# Implementando xlsx
library(xlsx)


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
textocantantecancion_portal <- gsub("/", "", textocantantecancion_portal)
textocantantecancion_portal <- as.character(textocantantecancion_portal)
textocantantecancion_portal <- mutate_each(textocantantecancion_portal, funs(toupper))
textocantantecancion_portal <- trim(textocantantecancion_portal)
for (c in 1:length(textocantantecancion_portal)) {
  print(textocantantecancion_portal[c])
}


# Semanas en lista de la cancion 

semanaslista_portal <- html_nodes(listacanciones_portal, css = ".list_week")
textosemanaslista_portal <- html_text(semanaslista_portal)
textosemanaslista_portal <- gsub("\n", "", textosemanaslista_portal)
textosemanaslista_portal <- gsub("Semanas en lista", "", textosemanaslista_portal)
textosemanaslista_portal <- trim(textosemanaslista_portal)
textosemanaslista_portal <- as.numeric(textosemanaslista_portal)
for (d in 1:length(textosemanaslista_portal)) {
  print(textosemanaslista_portal[d])
}




#### CREANDO DATA FRAME PORTAL DE CANCIONES #### 
# Creando Dataframe con Informacion de pagina portal de canciones hot 100.

datoscancionesportal <- data.frame()
itemportalcanciones <- data.frame(posicioncancion_portal = textoposicioncancion_portal,
                                  nombrecancion_portal = textonombrecancion_portal,
                                  cantantecancion_portal = textocantantecancion_portal,
                                  semanaslista_portal = textosemanaslista_portal)



#### ALMACENAR INFORMACION CON DATOS TOTALES ####                                 

datoscancionesportal <- rbind(datoscancionesportal, itemportalcanciones)




#################################################################################################



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
textonombrecancion_billboard <- as.character(textonombrecancion_billboard)
for (f in 1:length(textonombrecancion_billboard)) {
  print(textonombrecancion_billboard[f])
}


# Cantante de la cancion 

cantantecancion_billboard <- html_nodes(listacanciones_billboard, css = ".chart-element__information__artist.text--truncate.color--secondary")
textocantantecancion_billboard <- html_text(cantantecancion_billboard)
textocantantecancion_billboard <- gsub("\n", "", textocantantecancion_billboard)
textocantantecancion_billboard <- trim(textocantantecancion_billboard)
textocantantecancion_billboard <- as.character(textocantantecancion_billboard)
for (g in 1:length(textocantantecancion_billboard)) {
  print(textocantantecancion_billboard[g])
}


# Semanas en lista de la cancion 

semanaslista_billboard <- html_nodes(listacanciones_billboard, css = ".chart-element__meta.text--center.color--secondary.text--week")
textosemanaslista_billboard <- html_text(semanaslista_billboard)
textosemanaslista_billboard <- gsub("\n", "", textosemanaslista_billboard)
textosemanaslista_billboard <- trim(textosemanaslista_billboard)
textosemanaslista_billboard <- as.numeric(textosemanaslista_billboard)
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




#################################################################################################


######################################################################

####              UNION DE DATOS PARA DATASET FINAL               ####

######################################################################


#### RENOMBRAR VARIABLES CON EL FIN DE POR UNIR EL DATASET ####

names(datoscancionesportal)
names(datoscancionesbillboard)

datosportal <- rename(datoscancionesportal, PosicionCancion = posicioncancion_portal, NombreCancion = nombrecancion_portal, CantanteCancion = cantantecancion_portal, SemanaenLista = semanaslista_portal)
datosbillboard <- rename(datoscancionesbillboard, PosicionCancion = posicioncancion_billboard, NombreCancion = nombrecancion_billboard, CantanteCancion = cantantecancion_billboard, SemanaenLista = semanaslista_billboard)


#### UNION DE TODOS LOS DATOS EN UN SOLO DATASET ####

datosportal %>% union_all(datosbillboard) -> DatasetFinal
DatasetFinal <- mutate_all(DatasetFinal, funs(toupper))


#################################################################################################


######################################################################

####             INFORMACION PARA REALIZAR ANALISIS               ####

######################################################################

#------------------------ GRAFICO 1 ------------------------#

# A traves del grafico se intenta mostrar en general la cantidad de semanas que ha 
# permanecido la cancion en el ranking de las 100 mas escuchadas.

ggplot(data = DatasetFinal)+
  geom_bar(mapping = aes(x = SemanaenLista))

### Se puede apreciar que solo dos canciones han permanecido mas de 80 semanas
### en el ranking, y hay una gran concentracion de canciones que tan solo 
### permanecieron una semana en el ranking.


#------------------------ GRAFICO 2 ------------------------#

# Mediante el siguiente grafico se muestra los 4 cantantes que tienen mas canciones
# dentro del ranking.

cantante <- count(DatasetFinal, CantanteCancion)
top_mejorescantantes <- cantante %>% filter(n>=2)

top_4cantantes <- cantante %>% filter(n>=3)

top_4cantantes %>%
  ggplot(aes(x=CantanteCancion, y=n)) +
  geom_bar(stat="identity", fill="green", alpha=.6, width=.4)+
  theme_classic() + ggtitle("Top Cantantes") +
  theme(plot.title = element_text(family="Serif",
                                  size = rel(1),
                                  vjust = 0.5, hjust = 0.5,
                                  face = "italic",
                                  color = "Black",
                                  lineheight = 1.5)) +
  labs(y="frecuencia", x="cantante") +
  theme(axis.title.x = element_text(face="bold", vjust = 0.5, color = "black"))+
  theme(axis.title.y = element_text(face = "bold", vjust = 0.5, color = "black"))

### Los cantantes con mas canciones en los ranking son: BAD BUNNY (3) y J.Balvin (4) en el
### ranking de canciones en español; y Dua Lipa (3) y Olivia Rodrigo (8) en el ranking
### billboard.


#------------------------ GRAFICO 3 ------------------------#


### A traves del grafico 3 se puede observar el top 3 de canciones que han permanecido
### mas semanas en el ranking de canciones mas escuchadas.

cancion_semanasenlista <- DatasetFinal %>% select(NombreCancion, SemanaenLista)
cancion_semanasenlista1 <- cancion_semanasenlista %>% filter(SemanaenLista>=65)

top_canciones <- cancion_semanasenlista %>% filter(SemanaenLista>=65)

top_canciones %>%
  ggplot(aes(x=NombreCancion, y=SemanaenLista)) +
  geom_bar(stat="identity", fill="red", alpha=.6, width=.4)+
  theme_classic() + ggtitle("Top Canciones") +
  theme(plot.title = element_text(family="Serif",
                                  size = rel(1),
                                  vjust = 0.5, hjust = 0.5,
                                  face = "italic",
                                  color = "Black",
                                  lineheight = 1.5)) +
  labs(y="semanas", x="cancion") +
  theme(axis.title.x = element_text(face="bold", vjust = 0.5, color = "black"))+
  theme(axis.title.y = element_text(face = "bold", vjust = 0.5, color = "black"))


### La cancion con mas semanas en el ranking de las 100 canciones mas escuchadas son
### Blinding Lights (85 semanas), CONTANDO LUNARES (81 semanas), y Dance Monkey (68 semanas).


#------------------------ TABLA TOP_SEMANAS ------------------------#


#### SEMANAS EN LISTA QUE HA ESTADO LA CANCION #### 

# Top de semanas en lista
semanas <- count(DatasetFinal, SemanaenLista)
top_semanas <- semanas %>% filter(n>=6)

# Se observa mediante la tabla top_semanas que la semana en lista que más se repite es una semana 
# Ademas, la duracion de 20 y 22 semanas en lista se repite una importante cantidad de veces


#------------------------ GRAFICO 5 ------------------------#


# Top de 5 semanas en lista que se repiten
top_5semanas <- semanas %>% filter(n>=8)

top_5semanas %>%
  ggplot(aes(x=SemanaenLista, y=n)) +
  geom_bar(stat="identity", fill="skyblue", alpha=.6, width = .4) +
  theme_classic() + ggtitle("Top Semanas") +
  theme(plot.title = element_text(family="Serif",
                                  size=rel(1),
                                  vjust = 0.5, hjust = 0.5,
                                  face = "italic",
                                  color = "Black",
                                  lineheight = 1.5)) +
  labs(y="frecuencia", x="semanas") +
  theme(axis.title.x = element_text(face="bold", vjust = 0.5, color = "black")) +
  theme(axis.title.y = element_text(face="bold", vjust = 0.5, color = "black"))

# Las semanas que se repiten mayor cantidad de veces es 1 semana y 4 semanas 
# Es decir, hay una mayor cantidad de canciones que permanecen en la lista 1 y 4 semanas



#################################################################################################



######################################################################

####                  PASAR BASE DE DATOS A EXCEL                 ####

######################################################################


#### DATASET A EXCEL ####

write.csv(DatasetFinal, "Investigacionfinal en csv")








