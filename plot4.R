mydata = read.table("household_power_consumption.txt",header = TRUE,sep = ";")
date1 <-as.Date("02/01/07", "%m/%d/%y")
date2 <-as.Date("02/02/07", "%m/%d/%y")

mydata$Time <- strptime(paste(mydata$Date,mydata$Time), format="%d/%m/%Y %H:%M:%S")
head(mydata$Time)
data <- mydata[as.Date(mydata$Time)==date1|as.Date(mydata$Time)==date2,]
data$Date <-NULL
tail(data)
str(data)
data$Global_active_power <- as.numeric(levels(data$Global_active_power))[data$Global_active_power]
data$Global_reactive_power <- as.numeric(levels(data$Global_reactive_power))[data$Global_reactive_power]
data$Voltage <- as.numeric(levels(data$Voltage))[data$Voltage]
data$Sub_metering_1 <- as.numeric(levels(data$Sub_metering_1))[data$Sub_metering_1]
data$Sub_metering_2 <- as.numeric(levels(data$Sub_metering_2))[data$Sub_metering_2]

png(file = "plot4.png",  width = 480, height = 480, units = "px")
par(oma=c(2,2,2,1))
par(mar=c(4,4,1,1))
par(mfrow=c(2,2))

plot(data$Time,data$Global_active_power,xlab="",ylab="Global Active Power",type="l")
plot(data$Time,data$Voltage,xlab="datetime",ylab="Voltage",type="l")
plot(data$Time,data$Sub_metering_1,xlab="",type="l",ylim=c(0,37),ylab="Energy sub Metering",col="black")
par(new = TRUE)
plot(data$Time,data$Sub_metering_2,xlab="",ylab="",ylim=c(0,37),type="l",col="red")
par(new = TRUE)
plot(data$Time,data$Sub_metering_3,xlab="",ylab="",ylim=c(0,37),type="l",col="blue")
legend("topright", cex=1,col=c("black",'red',"blue"),lwd=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(data$Time,data$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="l")
dev.off()
