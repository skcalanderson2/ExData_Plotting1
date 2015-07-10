plot2 <- function(){
  ## This function creates a line graph of the Global Active Power for the dates 2/1/2007 & 2/2/2007
  ## It takes no parameters
  ## Example Usage: plot2()
  ## This relies on the raw data file located at https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
  
  ## Need these librarys included because of functions needed
  library(readr)
  library(dplyr)
  
  ## Set our working directory to where our raw data exists
  ## you will need to change this to your directory where your data exists
  setwd("~/DevelopmentStuff/Coursera/ExData_Plotting1")

  ## Read in the raw data
  ## We suppress the warnings generated because we are setting the column type and the function issues warnings for the missing data
  powerstats <- read_csv2("household_power_consumption.txt", col_names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

  ## We filter down the raw data to two dates we want
  mydata <- filter(powerstats, Date == "1/2/2007" | Date == "2/2/2007")

  ## We create a new graphics device, a png file in this case
  png("plot2.png")

  ## We plot a line of the Global Active Power column
  plot(mydata$Global_active_power, type="l", xaxt ="n", xlab = "", ylab = "Global Active Power (kilowatts)")

  ## We set a lable on the X axis
  axis(1,labels = c("Thu","Fri","Sat"), at = c(0,1440,2880))
  
  ## We turn the graphics device off, i.e. save the png file.
  dev.off()
}

