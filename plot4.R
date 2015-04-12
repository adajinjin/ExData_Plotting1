unzip("exdata-data-household_power_consumption.zip")
rawdata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?",nrow=2075259)
subsetdata = rawdata[66637:69516,]
DateTime <-dmy_hms(paste(subsetdata$Date,subsetdata$Time))
subsetdata2<-data.frame(DateTime,subsetdata[,3:9])
par(mfrow=c(2,2))
plot(subsetdata2$DateTime,subsetdata2$Global_active_power,type = "n", ylab = "Global Active Power (kilowatts)",xlab="")
lines(subsetdata2$DateTime,subsetdata2$Global_active_power)

plot(subsetdata2$DateTime,subsetdata2$Voltage,type = "n", ylab = "Voltage",xlab="datetime")
lines(subsetdata2$DateTime,subsetdata2$Voltage)

plot(subsetdata2$DateTime,subsetdata2$Sub_metering_1, type ="n",ylab = "Energy sub metering",xlab="")
lines(subsetdata2$DateTime,subsetdata2$Sub_metering_1)
lines(subsetdata2$DateTime,subsetdata2$Sub_metering_2,col="red")
lines(subsetdata2$DateTime,subsetdata2$Sub_metering_3,col="blue")
legend("topright",bty = "n",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))

plot(subsetdata2$DateTime,subsetdata2$Global_reactive_power, type ="n",ylab = "Global_reactive_power",xlab="datetime")
lines(subsetdata2$DateTime,subsetdata2$Global_reactive_power)

dev.copy(png,file="plot4.png")
dev.off()
