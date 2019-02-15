data<- read.csv("household.txt",header = T,sep = ";",dec = ".")
library(dplyr)
filtdata<-filter(data,Date=="1/2/2007"|Date=="2/2/2007")
filtdata$Global_active_power=as.numeric(filtdata$Global_active_power)/1000

png(filename = "plot1.png",width = 480,height = 480,units = "px")
with(filtdata$Global_active_power,col="red",main="Global Active Power",xlab = "Global Active Power (Kilowatt)")
dev.off()
