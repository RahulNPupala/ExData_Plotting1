# --------------------------------------------------------------------------------------------
# Name        : plot2()
#
# Purpose     : Draw plot2.png; Programming Assignment #1; Exploratory Data Analysis
#
# Usage       : source("plot2.R")
#
# Author      : Rahul N. Pupala
#
# Date        : 06 Jan 2016
# --------------------------------------------------------------------------------------------

plot2 <- function() {

hpc  <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors=FALSE, dec=".")
hpc_subset <- hpc[hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007", ]

datetime <- strptime(paste(hpc_subset$Date, hpc_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png(filename = "plot2.png", width = 480, height = 480)  # dev.copy(png, "plot2.png")
plot(datetime, as.numeric(hpc_subset$Global_active_power), xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
dev.off()

}