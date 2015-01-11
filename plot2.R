# use common file to load dataset
if(!exists('loadFile', mode="function")) 
{
  source("utilities.R")
}
Xdata <- loadFile();

# initialize png file plotting
png('plot2.png', width=480, height=480);

# grab days and weekday representations
days <- seq(Xdata$Date[1], Xdata$Date[length(Xdata$Date)], by="day")
weekdays <- weekdays(days)

# plot global active power
plot(x=Xdata$DateTime, y=Xdata$Global_active_power, type="l", main="", ylab="Global Active Power (kilowatts)", xlab="")

# dev.off to terminate plotting (snuff just short circuits the dev.off output)
snuff <- dev.off()

