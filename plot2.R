# construct the plot2 as specified for the week1 peer assignment
# this code includes the code to 
# - read the data
# - create the png file

# how to use the function
# plot2("./household_power_consumption.csv")

plot2 <- function(filePath=NULL) {
  
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
  png(file = "plot2.png")

  # generate the plot
  plot(d1$DateTime, 
       d1$Global_active_power, 
       type="l", 
       ylab="Global Active Power (kilowatts)", 
       xlab="")

  dev.off()
}