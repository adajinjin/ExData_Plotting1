unzip("exdata-data-household_power_consumption.zip")
rawdata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?",nrow=2075259)
subsetdata = rawdata[66637:69516,]
DateTime <-dmy_hms(paste(subsetdata$Date,subsetdata$Time))
subsetdata2<-data.frame(DateTime,subsetdata[,3:9])
par(mar=(6.1,4.1,4.1,2.1))
hist(subsetdata2$Global_active_power,col="red",main = "Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png,file="plot1.png")
dev.off()