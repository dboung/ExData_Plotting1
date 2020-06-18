#Plot3

data<-read.table("household_power_consumption.txt",skip=1,sep=";")
names(data)<- c("Date","Time","Global_active_power","Global_reactive_power",
                "Voltage","Global_intensity","Sub_metering_1",
                "Sub_metering_2","Sub_metering_3")
library(plyr)
data$Date <- as.Date(data$Date,format="%d/%m/%Y")

data1 <- subset(data,Date =="2007-02-01"|Date =="2007-02-02")

data1$Time <- strptime(data1$Time, format="%H:%M:%S")
data1[1:1440,"Time"] <- format(data1[1:1440,"Time"],"2007-02-01 %H:%M:%S")
data1[1441:2880,"Time"] <- format(data1[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

png("plot4.png",480,480)
par(mfrow = c(2, 2)) 

#plot1
plot(data1$Time,as.numeric(as.character(data1$Global_active_power)),
     type="l",xlab="",ylab="Global Active Power")

#plot2
plot(data1$Time,as.numeric(as.character(data1$Voltage)),
     type="l",xlab="datetime",ylab="Voltage")

#plot3
plot(data1$Time,as.numeric(as.character(data1$Sub_metering_1)),
     type="l",xlab="",ylab="Energy sub metering")
lines(data1$Time,as.numeric(as.character(data1$Sub_metering_2)),col="red")
lines(data1$Time,as.numeric(as.character(data1$Sub_metering_3)),col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))

#plot4
plot(data1$Time,as.numeric(as.character(data1$Global_reactive_power)),
     type="l",xlab="datetime",ylab="Global_reactive_power")


dev.off()
