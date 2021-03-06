unzip("exdata-data-household_power_consumption.zip")
rawdata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?",nrow=2075259)
subsetdata = rawdata[66637:69516,]
DateTime <-dmy_hms(paste(subsetdata$Date,subsetdata$Time))
subsetdata2<-data.frame(DateTime,subsetdata[,3:9])
plot(subsetdata2$DateTime,subsetdata2$Sub_metering_1, type ="n",ylab = "Energy sub metering",xlab="")
lines(subsetdata2$DateTime,subsetdata2$Sub_metering_1)
lines(subsetdata2$DateTime,subsetdata2$Sub_metering_2,col="red")
lines(subsetdata2$DateTime,subsetdata2$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))
dev.copy(png,file="plot3.png")
dev.off()
