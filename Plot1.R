# This is the script to create Plot 1 in Week 1 assignment for 
# Exploratory Data Analysis.
# Alert! You must have "household_power_consumption.txt" downloaded and unzipped
# in your working directory for this script to work.

# Start by obtaining our data.frame and subsetting the part we need of it.
HHPCdata <- read.csv("household_power_consumption.txt", header = TRUE, 
                      sep = ";")
GAP.1and2feb <- subset(HHPCdata, 
                            Date == "1/2/2007" | Date == "2/2/2007")[, 3]

# We'll need to convert factor to numeric.
GAP.1and2feb <- as.numeric(levels(GAP.1and2feb))[GAP.1and2feb]

# Let's now draw in a png.
png(filename = "plot1.png")
hist(GAP.1and2feb, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()

# Done!