plot3 <- function(){
  ## This function creates a line graph of the sub_metering power for the 3 sub_meter columns for the dates 2/1/2007 & 2/2/2007
  ## It takes no parameters
  ## Example Usage: plot3()
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
  png("plot3.png")
  
  ## We plot a line of the sub_metering_1 column
  plot(mydata$Sub_metering_1, type = "l", xaxt="n", xlab = "", ylab = "Energy sub metering")  

  ## We add a line of the sub_metering_2 column
  lines(mydata$Sub_metering_2, col="red")

  ## We add a line of the sub_metering_3 column
  lines(mydata$Sub_metering_3, col="blue")
  
  ## We set a lable on the X axis
  axis(1,labels = c("Thu","Fri","Sat"), at = c(0,1440,2880))
  
  ## We add a legend to the plot
  legend(x="topright", lty = "solid", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"))
  
  ## We turn the graphics device off, i.e. save the png file.
  dev.off()
}

