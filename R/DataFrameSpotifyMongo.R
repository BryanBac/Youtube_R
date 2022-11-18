install.packages("mongolite")
install.packages("rJava")
install_github("jeroen/mongolite")
library(mongolite)

mng_canal_conn <- mongo (collection = 'Canal', db = 'Proyecto', url = "mongodb+srv://Bryan:traceon@cluster0.m8f238i.mongodb.net/?retryWrites=true&w=majority")

#Susei Channel
SuiseiChannel <- mng_canal_conn$aggregate('[{"$match": {"nombre": "Suisei Channel"}}, {"$unwind":"$historial"}, {"$group":{"_id":{"$dayOfMonth":"$historial.fecha_hora"}, "promedio": {"$avg":"$historial.vistas"}}}]')
SuiseiChannel
SuiseiChannel[order(SuiseiChannel[,2]),]

plot(x = SuiseiChannel[order(SuiseiChannel[,2]),], xlab = 'Día', ylab = 'Vistas', type = 'h', lwd = 3, main="Susei Channel", col="#87CEFA")

#ElJuaniquilador
ElJuaniquilador <- mng_canal_conn$aggregate('[{"$match": {"nombre": "ElJuaniquilador"}}, {"$unwind":"$historial"}, {"$group":{"_id":{"$dayOfMonth":"$historial.fecha_hora"}, "promedio": {"$avg":"$historial.vistas"}}}]')
ElJuaniquilador
ElJuaniquilador[order(ElJuaniquilador[,2]),]

plot(x = ElJuaniquilador[order(ElJuaniquilador[,2]),], xlab = 'Día', ylab = 'Vistas', type = 'h', lwd = 3, main="El Juaniquilador", col="#87CEFA")

#PanPiano
PanPiano <- mng_canal_conn$aggregate('[{"$match": {"nombre": "Pan Piano"}}, {"$unwind":"$historial"}, {"$group":{"_id":{"$dayOfMonth":"$historial.fecha_hora"}, "promedio": {"$avg":"$historial.vistas"}}}]')
PanPiano
PanPiano[order(PanPiano[,2]),]

plot(x = PanPiano[order(PanPiano[,2]),], xlab = 'Día', ylab = 'Vistas', type = 'h', lwd = 3, main="Pan Piano", col="#87CEFA")

#Gawr
Gawr <- mng_canal_conn$aggregate('[{"$match": {"nombre": "Gawr Gura Ch. hololive-EN"}}, {"$unwind":"$historial"}, {"$group":{"_id":{"$dayOfMonth":"$historial.fecha_hora"}, "promedio": {"$avg":"$historial.vistas"}}}]')
Gawr
Gawr[order(Gawr[,2]),]

plot(x = Gawr[order(Gawr[,2]),], xlab = 'Día', ylab = 'Vistas', type = 'h', lwd = 3, main="Gawr Gura Ch. hololive-EN", col="#87CEFA")

#Spreen
Spreen <- mng_canal_conn$aggregate('[{"$match": {"nombre": "Spreen"}}, {"$unwind":"$historial"}, {"$group":{"_id":{"$dayOfMonth":"$historial.fecha_hora"}, "promedio": {"$avg":"$historial.vistas"}}}]')
Spreen
Spreen[order(Spreen[,2]),]

plot(x = Spreen[order(Spreen[,2]),], xlab = 'Día', ylab = 'Vistas', type = 'h', lwd = 3, main="Spreen", col="#87CEFA")

#Nanashi Mumei Ch. hololive-EN
Nanashi <- mng_canal_conn$aggregate('[{"$match": {"nombre": "Nanashi Mumei Ch. hololive-EN"}}, {"$unwind":"$historial"}, {"$group":{"_id":{"$dayOfMonth":"$historial.fecha_hora"}, "promedio": {"$avg":"$historial.vistas"}}}]')
Nanashi
Nanashi[order(Nanashi[,2]),]

plot(x = Nanashi[order(Nanashi[,2]),], xlab = 'Día', ylab = 'Vistas', type = 'h', lwd = 3, main="Nanashi Mumei", col="#87CEFA")


#VickeBlanka
VickeBlanka <- mng_canal_conn$aggregate('[{"$match": {"nombre": "Vicke Blanka"}}, {"$unwind":"$historial"}, {"$group":{"_id":{"$dayOfMonth":"$historial.fecha_hora"}, "promedio": {"$avg":"$historial.vistas"}}}]')
VickeBlanka
VickeBlanka[order(VickeBlanka[,2]),]

plot(x = VickeBlanka[order(VickeBlanka[,2]),], xlab = 'Día', ylab = 'Vistas', type = 'h', lwd = 3, main = "Vicke Blanka", col="#87CEFA")

#MissaSinfonia
MissaSinfonia <- mng_canal_conn$aggregate('[{"$match": {"nombre": "MissaSinfonia"}}, {"$unwind":"$historial"}, {"$group":{"_id":{"$dayOfMonth":"$historial.fecha_hora"}, "promedio": {"$avg":"$historial.vistas"}}}]')
MissaSinfonia
MissaSinfonia[order(MissaSinfonia[,2]),]

plot(x = MissaSinfonia[order(MissaSinfonia[,2]),], xlab = 'Día', ylab = 'Vistas', type = 'h', lwd = 3, main= "MissaSinfonia", col="#87CEFA")

promedioSuisei <- mean(SuiseiChannel$promedio)
promedioElJuaniquilador <- mean(ElJuaniquilador$promedio)
promedioPanPiano <- mean(PanPiano$promedio)
promedioGwar <- mean(Gawr$promedio)
promedioSpreen <- mean(Spreen$promedio)
promedioNanashi <- mean(Nanashi$promedio)
promedioVicke <- mean(VickeBlanka$promedio)
promedioMissa <- mean(MissaSinfonia$promedio)

promedios <- c(promedioSuisei, promedioElJuaniquilador, promedioPanPiano, promedioGwar, promedioSpreen, promedioNanashi, promedioVicke, promedioMissa)
promedios
lbls <- c('Susei Channel', 'ElJuaniquilador', 'PanPiano', 'Gawr Gura', 'Spreen', 'Nanashi', 'Vicke Blanka', 'MissaSinfonia')
plot(x = promedios, xlab = 'Canal', ylab = 'Vistas', xaxt = "n", type = 'h', lwd = 3, main= "Promedio de Vistas por Canal", col="turquoise3")
axis(1,at=1:8,labels = lbls[1:8])
