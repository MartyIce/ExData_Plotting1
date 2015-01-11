# utility method to load dataset, rename/format columns, and filter to two days
loadFile <- function() {
  # ~66000 (1/31/2007)
  # ~70000 (2/3/2007)
  
  
  dat <- read.csv("household_power_consumption.txt", 
                    sep=";", 
                    header=TRUE, 
                    stringsAsFactors=FALSE, 
                    skip = 66000,
                    nrows=4000)
  names(dat)[1] <- "Date"
  dat$Date = as.Date(dat$Date, "%d/%m/%Y")
  names(dat)[2] <- "Time"
  dat$Time = strptime(dat$Time, "%H:%M:%S")

  # combine date/time into one column
  dat$DateTime = as.POSIXct(paste(dat$Date, strftime(dat$Time, format="%H:%M:%S")), format="%Y-%m-%d %H:%M:%S")
  
  #rename columns
  names(dat)[3] <- "Global_active_power"
  names(dat)[4] <- "Global_reactive_power"
  names(dat)[5] <- "Voltage"
  names(dat)[6] <- "Global_intensity"
  names(dat)[7] <- "Sub_metering_1"
  names(dat)[8] <- "Sub_metering_2"
  names(dat)[9] <- "Sub_metering_3"
  
  # filter to 2/1 and 2/2
  dat = dat[dat$Date=="2007-02-01" | dat$Date=="2007-02-02",]
  
  # return data.frame
  dat;
}