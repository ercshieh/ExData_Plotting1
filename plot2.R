# Code for plot 2
library(lubridate)

# Read in the data
energy <- read.table("household_power_consumption.txt", header=TRUE, sep=";", 
                     na.strings = "?", nrows= 90000)

# Create a new column for the date/time using the Date class
energy$DateTime <- paste(energy$Date, energy$Time)
energy$DateTime <- strptime(energy$DateTime, format = "%d/%m/%Y %H:%M:%S")

# Constrain the dates from 2007-02-01 to 2007-02-02
energy <- energy[energy$DateTime >= dmy("01/02/2007") & energy$DateTime < dmy("03/02/2007"), ]

# open the png device
png(filename = "plot2.png", width = 480, height = 480)

# plot the plot :-)
with(energy, plot(DateTime, Global_active_power, type="l", xlab=" ", 
                  ylab="Global Active Power (kilowatts)"))

# close the device!!
dev.off() 
