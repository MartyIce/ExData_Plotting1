# use common file to load dataset
if(!exists('loadFile', mode="function")) source("utilities.R")
Xdata <- loadFile();

# initialize png file plotting
png('plot1.png', width=480, height=480);

# histogram of global active power
hist(Xdata$Global_active_power, breaks=12, col="red", 
     main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")

# dev.off to terminate plotting (snuff just short circuits the dev.off output)
snuff <- dev.off()

