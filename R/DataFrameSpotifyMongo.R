install.packages("mongolite")
install.packages("rJava")
install_github("jeroen/mongolite")
library(mongolite)

mng_canal_conn <- mongo (collection = 'Canal', db = 'Proyecto', url = "mongodb+srv://Bryan:traceon@cluster0.m8f238i.mongodb.net/?retryWrites=true&w=majority")
canales <- mng_canal_conn$find('{}')
mng_video_conn <- mongo (collection = 'Video', db = 'Proyecto', url = "mongodb+srv://Bryan:traceon@cluster0.m8f238i.mongodb.net/?retryWrites=true&w=majority")
videos <- mng_video_conn$find('{}')