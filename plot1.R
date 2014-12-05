mydata = read.table("household_power_consumption.txt",header = TRUE,sep = ";")
date1 <-as.Date("02/01/07", "%m/%d/%y")
date2 <-as.Date("02/02/07", "%m/%d/%y")

mydata$Time <- strptime(paste(mydata$Date,mydata$Time), format="%d/%m/%Y %H:%M:%S")
head(mydata$Time)
data <- mydata[as.Date(mydata$Time)==date1|as.Date(mydata$Time)==date2,]
data$Date <-NULL
tail(data)

data$Global_active_power <- as.numeric(levels(data$Global_active_power))[data$Global_active_power]
png(file = "plot1.png",  width = 480, height = 480, units = "px")
hist(data$Global_active_power,col="red",main="Global Active Power", xlab="Global Active Power (killowatts)")
dev.off()
