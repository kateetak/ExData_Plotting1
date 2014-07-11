# construct the plot1 as specified for the week1 peer assignment
# this code includes the code to 
# - read the data
# - create the png file

# how to use the function
# plot1("./household_power_consumption.csv")

plot1 <- function(filePath=NULL) {
  
  if(is.null(filePath)) {
    stop("filePath parameter not specified")
  }
  
  # read the full set of data from file    
  d <- read.table(filePath, header = TRUE, sep=";", na.strings=c("?"), stringsAsFactors = FALSE)
  
  # transform the date column to a date format
  d$Date <- as.Date(d$Date, format="%d/%m/%Y")
  
  # subset the data (only select required days)
  d1 <- d[d$Date %in% as.Date(c("2007-02-01","2007-02-02")),]
    

  # create a png file
  # 480x480 is the standard size of the file created
  png(file = "plot1.png")
  
  # generate the histogram
  hist(d1$Global_active_power, 
        main="Global Active Power", 
        xlab="Global Active Power (kilowatts)", 
        col="red")
  
  dev.off()
}