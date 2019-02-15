data<- read.csv("household.txt",header = T,sep = ";",dec = ".")
library(dplyr)
filtdata<-filter(data,Date=="1/2/2007"|Date=="2/2/2007")
filtdata$Global_active_power=as.numeric(filtdata$Global_active_power)/1000
filtdata$datetime<-as.POSIXct(paste(filtdata$Date,filtdata$Time),format="%d/%m/%Y %H:%M:%S")
png(filename = "plot2.png",width = 480,height = 480,units = "px")
plot(filtdata$datetime,filtdata$Global_active_power,type="l",xlab = "",ylab = "Global Active Power (Kilowatt)")
dev.off()

