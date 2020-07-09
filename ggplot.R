library(ggplot2)
data = read.csv("kanna6.csv")
 p<- ggplot(data,aes(ID,SCORE))
 p+ geom_point( colour = "RED")

data2 = read.csv("kanna7.csv")
 p<- ggplot(data,aes(ID,SCORE))
 p+ geom_point( colour = "VIOLET")
 
data3 = read.csv("kanna8.csv")
 p<- ggplot(data,aes(ID,SCORE))
 p+ geom_point( colour = "GREEN")
 
data4 = read.csv("kanna9.csv")
 p<- ggplot(data,aes(ID,SCORE))
 p+ geom_point( colour = "BLACK")
 
data5 = read.csv("kanna10.csv")
 p<- ggplot(data,aes(ID,SCORE))
 p+ geom_point( colour = "BLUE")
 
 