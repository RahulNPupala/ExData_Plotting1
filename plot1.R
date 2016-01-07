# --------------------------------------------------------------------------------------------
# Name        : plot1()
#
# Purpose     : Draw plot1.png; Programming Assignment #1; Exploratory Data Analysis
#
# Usage       : source("plot1.R")
#
# Author      : Rahul N. Pupala
#
# Date        : 06 Jan 2016
# --------------------------------------------------------------------------------------------

plot1 <- function() {

hpc  <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors=FALSE)
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")

y <- strptime(hpc$Time, "%H:%M:%S")
hpc$Time <- strftime(y, "%H:%M:%S")

hpc_subset <- hpc[hpc$Date == "2007-02-01" | hpc$Date == "2007-02-02", ]

png(filename = "plot1.png", width = 480, height = 480)  # dev.copy(png, "plot1.png")
hist(as.numeric(hpc_subset$Global_active_power), col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()

}