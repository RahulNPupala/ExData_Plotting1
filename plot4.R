# --------------------------------------------------------------------------------------------
# Name        : plot4()
#
# Purpose     : Draw plot4.png; Programming Assignment #1; Exploratory Data Analysis
#
# Usage       : source("plot4.R")
#
# Author      : Rahul N. Pupala
#
# Date        : 06 Jan 2016
# --------------------------------------------------------------------------------------------

plot4 <- function() {

hpc  <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors=FALSE, dec=".")
hpc_subset <- hpc[hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007", ]

datetime <- strptime(paste(hpc_subset$Date, hpc_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png(filename = "plot4.png", width = 480, height = 480)  # dev.copy(png, "plot4.png")
par(mfrow = c(2, 2))

with(hpc_subset, {
plot(datetime, as.numeric(hpc_subset$Global_active_power), xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")

plot(datetime, as.numeric(Voltage), xlab = "datetime", ylab = "Voltage", type = "l")

plot(datetime, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n")
lines(datetime, as.numeric(hpc_subset$Sub_metering_1), col = "black")
lines(datetime, as.numeric(hpc_subset$Sub_metering_2), col = "red")
lines(datetime, as.numeric(hpc_subset$Sub_metering_3), col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 1)

plot(datetime, as.numeric(Global_reactive_power), xlab = "datetime", ylab = "Global_reactive_power", type = "l")
})

dev.off()

}