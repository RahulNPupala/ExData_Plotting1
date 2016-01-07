# --------------------------------------------------------------------------------------------
# Name        : plot3()
#
# Purpose     : Draw plot3.png; Programming Assignment #1; Exploratory Data Analysis
#
# Usage       : source("plot3.R")
#
# Author      : Rahul N. Pupala
#
# Date        : 06 Jan 2016
# --------------------------------------------------------------------------------------------

plot3 <- function() {

hpc  <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors=FALSE, dec=".")
hpc_subset <- hpc[hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007", ]

datetime <- strptime(paste(hpc_subset$Date, hpc_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png(filename = "plot3.png", width = 480, height = 480)  # dev.copy(png, "plot3.png")
with(hpc_subset, plot(datetime, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n"))
lines(datetime, as.numeric(hpc_subset$Sub_metering_1), col = "black")
lines(datetime, as.numeric(hpc_subset$Sub_metering_2), col = "red")
lines(datetime, as.numeric(hpc_subset$Sub_metering_3), col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 1)
dev.off()

}