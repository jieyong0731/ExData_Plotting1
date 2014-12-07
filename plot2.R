mydata = read.table("household_power_consumption.txt",header = TRUE,sep = ";")
date1 <-as.Date("02/01/07", "%m/%d/%y")
date2 <-as.Date("02/02/07", "%m/%d/%y")

mydata$Time <- strptime(paste(mydata$Date,mydata$Time), format="%d/%m/%Y %H:%M:%S")
head(mydata$Time)
data <- mydata[as.Date(mydata$Time)==date1|as.Date(mydata$Time)==date2,]
data$Date <-NULL

data$Global_active_power <- as.numeric(levels(data$Global_active_power))[data$Global_active_power]

png(file = "plot2.png",  width = 480, height = 480, units = "px")
plot(data$Time,data$Global_active_power,xlab="",ylab="Global Active Power (killowatts)",type="l")
dev.off()
