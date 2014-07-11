# construct the plot3 as specified for the week1 peer assignment
# this code includes the code to 
# - read the data
# - create the png file

# how to use the function
# plot3("./household_power_consumption.csv")

plot3 <- function(filePath=NULL) {
  
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
  png(file = "plot3.png")
  
  # generate the plot
  plot(d1$DateTime, d1$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
  lines(d1$DateTime, d1$Sub_metering_2, type="l", col="red")
  lines(d1$DateTime, d1$Sub_metering_3, type="l", col="blue")
  legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

  dev.off()
}