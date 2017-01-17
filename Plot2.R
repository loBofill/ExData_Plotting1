# This is the script to create Plot 2 in Week 1 assignment for 
# Exploratory Data Analysis.
# Alert! You must have "household_power_consumption.txt" downloaded and unzipped
# in your working directory for this script to work.

# Start by obtaining our data.frame and subsetting the part we need of it.
HHPCdata <- read.csv("household_power_consumption.txt", header = TRUE, 
                     sep = ";")
HHPCdata <- subset(HHPCdata, Date == "1/2/2007" | Date == "2/2/2007")

# We'll need to convert factor to numeric and dates.
GAP <- as.numeric(levels(HHPCdata$Global_active_power))[HHPCdata$Global_active_power]
datetime <- as.POSIXct(paste(HHPCdata$Date, HHPCdata$Time), 
                       format="%d/%m/%Y %H:%M:%S")

# Let's now draw in a png.
png(filename = "plot2.png")
plot(datetime, GAP, type = "l", ylab = "Global Active Power (kilowatts)", 
     xlab = "")
dev.off()

# Done!