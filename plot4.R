# use common file to load dataset
if(!exists('loadFile', mode="function")) 
{
  source("utilities.R")
}
Xdata <- loadFile();

# initialize png file plotting
png('plot4.png', width=480, height=480);

# grab days and weekday representations
days <- seq(Xdata$Date[1], Xdata$Date[length(Xdata$Date)], by="day")
weekdays <- weekdays(days)

# init plotting for 2x2 plots
par(mfrow=c(2,2))

# global active power
plot(x=Xdata$DateTime, y=Xdata$Global_active_power, type="l", main="", ylab="Global Active Power", xlab="")

# voltage
plot(x=Xdata$DateTime, y=Xdata$Voltage, type="l", main="", ylab="Voltage", xlab="datetime", col="black")

# sub metering
plot(x=Xdata$DateTime, y=Xdata$Sub_metering_1, type="l", main="", ylab="Energy sub metering", xlab="", col="black")
lines(x=Xdata$DateTime, y=Xdata$Sub_metering_2, type="l", main="", ylab="Energy sub metering", xlab="", col="red")
lines(x=Xdata$DateTime, y=Xdata$Sub_metering_3, type="l", main="", ylab="Energy sub metering", xlab="", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1, 1), col=c("black", "red", "blue"))

# global reactive power
plot(x=Xdata$DateTime, y=Xdata$Global_reactive_power, type="l", main="", ylab="Global_reactive_power", xlab="datetime", col="black")

# dev.off to terminate plotting (snuff just short circuits the dev.off output)
snuff <- dev.off()