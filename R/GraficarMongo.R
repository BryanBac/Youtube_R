
#Libreria para graficar
library(ggplot2)
#Obtener nombres de col
names(tops_mongo)
# Definir rangos
range(tops_mongo$name)
range(tops_mongo$popularity)
#Crear Grafica
ggplot(tops_mongo, aes(x=name, y=popularity)) + geom_bar(stat = "identity")


#  Proyecto

suisei = canales[[2]][[1]]
ElJuaniquilador = canales[[2]][[2]]
PanPiano = canales[[2]][[3]]
Gura = canales[[2]][[4]]
Spreen = canales[[2]][[5]]
Mumei = canales[[2]][[6]]
Vicke_Blanka = canales[[2]][[7]]
missa = canales[[2]][[8]]