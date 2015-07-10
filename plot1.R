plot1 <- function(){
  ## This function creates a histogram of the Global Active Power for the dates 2/1/2007 & 2/2/2007
  ## It takes no parameters
  ## Example Usage: plot1()
  ## This relies on the raw data file located at https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
  
  ## Need these librarys included because of functions needed
  library(dplyr)
  library(readr)
  
  ## Set our working directory to where our raw data exists
  ## you will need to change this to your directory where your data exists
  setwd("~/DevelopmentStuff/Coursera/ExData_Plotting1")
  
  ## Read in the raw data
  ## We suppress the warnings generated because we are setting the column type and the function issues warnings for the missing data
  powerstats <- suppressWarnings(read_csv2("household_power_consumption.txt", col_types = "ccddddddd", col_names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")))
  
  ## We filter down the raw data to two dates we want
  mydata <- filter(powerstats, Date == "1/2/2007" | Date == "2/2/2007")
  
  ## We create a new graphics device, a png file in this case
  png("plot1.png")
  
  ## We plot a historgram of the Global Active Power column
  hist(mydata$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
  
  ## We shut the graphics device off
  dev.off()
}

