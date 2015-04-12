unzip("exdata-data-household_power_consumption.zip")
rawdata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?",nrow=2075259)
subsetdata = rawdata[66637:69516,]
DateTime <-dmy_hms(paste(subsetdata$Date,subsetdata$Time))
subsetdata2<-data.frame(DateTime,subsetdata[,3:9])
plot(subsetdata2$DateTime,subsetdata2$Global_active_power,type = "n", main = "",ylab = "Global Active Power (kilowatts)",xlab="")
lines(subsetdata2$DateTime,subsetdata2$Global_active_power)
dev.copy(png,file="plot2.png")
dev.off()