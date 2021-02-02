# Code for plot 3
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
png(filename = "plot3.png", width = 480, height = 480)

# Initialize plot
plot(energy$DateTime,energy$Sub_metering_1,type="n", xlab=" ", ylab="Energy sub metering")

# Add the three lines
lines(energy$DateTime,energy$Sub_metering_1)
lines(energy$DateTime,energy$Sub_metering_2, col="red")
lines(energy$DateTime,energy$Sub_metering_3, col="blue")

# Add the legend
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lty=1)

# close the device!!
dev.off() 

