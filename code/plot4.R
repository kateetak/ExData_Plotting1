# construct the plot4 as specified for the week1 peer assignment
# this code includes the code to 
# - read the data
# - create the png file

# how to use the function
# plot4("./household_power_consumption.csv")

plot4 <- function(filePath) {
  
  if(is.null(filePath)) {
    stop("filePath parameter not specified")
  }
  
  # read the full set of data from file    
  d <- read.table(filePath, header = TRUE, sep=";", na.strings=c("?"), stringsAsFactors = FALSE)

  # transform the date column to a date format
  d$Date <- as.Date(d$Date, format="%d/%m/%Y")
  
  # subset the data (only select required days)
  d1 <- d[d$Date %in% as.Date(c("2007-02-01","2007-02-02")),]
  
  # add a column containing the date and time
  d1$DateTime <- as.POSIXct(paste(d1$Date,d1$Time))
  # create a png file
  # 480x480 is the standard size of the file created
  png(file = "plot4.png")
  
  # set the par attributes to obtain multiple charts in the same png
  # mfrow=number of row/columns | mar=margins | oma=outermargins
  par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
  
  # generate plot1
  plot(d1$DateTime, d1$Global_active_power, type="l", ylab="Global Active Power", xlab="")
  
  # generate plot2
  plot(d1$DateTime, d1$Voltage, type="l", ylab="Voltage", xlab="datetime")
  
  # generate plot3
  plot(d1$DateTime, d1$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
  lines(d1$DateTime, d1$Sub_metering_2, type="l", col="red")
  lines(d1$DateTime, d1$Sub_metering_3, type="l", col="blue")
  legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

  # generate plot4
  plot(d1$DateTime, d1$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")
  
  dev.off()
}