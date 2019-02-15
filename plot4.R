data<- read.csv("household.txt",header = T,sep = ";",dec = ".")
library(dplyr)
filtdata<-filter(data,Date=="1/2/2007"|Date=="2/2/2007")
filtdata$Global_active_power=as.numeric(filtdata$Global_active_power)/1000
filtdata$datetime<-as.POSIXct(paste(filtdata$Date,filtdata$Time),format="%d/%m/%Y %H:%M:%S")
png(filename = "plot4.png",width = 480,height = 480,units = "px")
par(mfrow=c(2,2))
with (filtdata,{plot(filtdata$datetime,filtdata$Global_active_power,type="l",ylab = "Global Active Power",xlab = "")

plot(filtdata$datetime,filtdata$Voltage,type="l",ylab = "Voltage",xlab="datetime")

plot(filtdata$datetime,filtdata$Sub_metering_1,type="n",xlab = "",ylab = "Energy sub metering")
legend ("topright",lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
lines(filtdata$datetime,filtdata$Sub_metering_1,col="black")
lines(filtdata$datetime,filtdata$Sub_metering_2,col="red")
lines(filtdata$datetime,filtdata$Sub_metering_3,col="blue")
plot(filtdata$datetime,filtdata$Global_reactive_power,type="l",ylab = "Global Reactive Power",xlab="datetime")
})
dev.off()
