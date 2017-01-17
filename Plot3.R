# This is the script to create Plot 3 in Week 1 assignment for 
# Exploratory Data Analysis.
# Alert! You must have "household_power_consumption.txt" downloaded and unzipped
# in your working directory for this script to work.

# Start by obtaining our data.frame and subsetting the part we need of it.
HHPCdata <- read.csv("household_power_consumption.txt", header = TRUE, 
                     sep = ";")
HHPCdata <- subset(HHPCdata, Date == "1/2/2007" | Date == "2/2/2007")

# We'll need to convert factor to numeric and dates.
SM1 <- as.numeric(levels(HHPCdata$Sub_metering_1))[HHPCdata$Sub_metering_1]
SM2 <- as.numeric(levels(HHPCdata$Sub_metering_2))[HHPCdata$Sub_metering_2]
SM3 <- HHPCdata$Sub_metering_3
datetime <- as.POSIXct(paste(HHPCdata$Date, HHPCdata$Time), 
                       format="%d/%m/%Y %H:%M:%S")

# Let's now draw in a png.
png(filename = "plot3.png")
plot(datetime, SM1, type = "l", ylab = "Energy sub metering", 
     xlab = "")
lines(datetime, SM2, col="red")
lines(datetime, SM3, col="blue")
legend("topright", legend = names(HHPCdata[,7:9]), 
       col=c("black", "red", "blue"), pch = c("-","-","-"))
dev.off()

# Done!