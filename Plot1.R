#Plot1

data<-read.table("household_power_consumption.txt",skip=1,sep=";")
names(data)<- c("Date","Time","Global_active_power","Global_reactive_power",
                "Voltage","Global_intensity","Sub_metering_1",
                "Sub_metering_2","Sub_metering_3")
library(plyr)
data$Date <- as.Date(data$Date,format="%d/%m/%Y")

data1 <- subset(data,Date =="2007-02-01"|Date =="2007-02-02")

data1$Global_active_power <- as.numeric(as.character(data1$Global_active_power))
hist(data1$Global_active_power,col="red", 
     xlab="Global active power(kilowattas)", 
     main="Global Active Power")
