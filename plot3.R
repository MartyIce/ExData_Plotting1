# use common file to load dataset
if(!exists('loadFile', mode="function")) 
{
  source("utilities.R")
}
Xdata <- loadFile();

# initialize png file plotting
png('plot3.png', width=480, height=480);

# grab days and weekday representations
days <- seq(Xdata$Date[1], Xdata$Date[length(Xdata$Date)], by="day")
weekdays <- weekdays(days)

# plot sub metering 1-3
plot(x=Xdata$DateTime, y=Xdata$Sub_metering_1, type="l", main="", ylab="Energy sub metering", xlab="")
lines(x=Xdata$DateTime, y=Xdata$Sub_metering_2, type="l", main="", ylab="Energy sub metering", xlab="", col="red")
lines(x=Xdata$DateTime, y=Xdata$Sub_metering_3, type="l", main="", ylab="Energy sub metering", xlab="", col="blue")
# legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1, 1), col=c("black", "red", "blue"))

# dev.off to terminate plotting (snuff just short circuits the dev.off output)
snuff <- dev.off()

