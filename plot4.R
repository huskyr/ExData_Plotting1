#plot4.R
# Project 1.. Exploratory Data for Making Plots

###################################################
setwd("E:/R1/ExData_Plotting1_test/data")
unzip("exdata_data_household_power_consumption.zip")
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.string = "?")
#
#test add date and time
data$DateTime <- paste(as.character(data$Date), as.character(data$Time), sep = " ")
data$DateTime <- strptime(data$DateTime,"%d/%m/%Y %H:%M:%S")
# convert the Date and Time variables to Date/Time classes
data$Date <- as.Date(data$Date, "%d/%m/%Y")

data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")
#using data from the dates 2007-02-01 and 2007-02-02
###################################################
#Drawing Plot4
par(mfrow = c(2,2))
#plot top left
plot(data$DateTime, data$Global_active_power, xlab= " ",
     ylab = "Global Active Power (kilowatts)")
lines(data$DateTime, data$Global_active_power)
#plot top right
plot(data$DateTime, data$Voltage, xlab = "datetime",
     ylab = "Voltage")
# plot bottom left
with(data, plot(DateTime, Sub_metering_1, type = "n",
                ylab = "Energy sub metering", xlab = " "))
with(data, lines(DateTime, Sub_metering_1,type="l", col = "black"))
with(data, lines(DateTime, Sub_metering_2,type="l", col = "red"))
with(data, lines(DateTime, Sub_metering_3,type="l", col = "blue"))
legend("topright", pch="_",col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#plot bottom right 
plot(data$DateTime, data$Global_reactive_power, xlab = "datetime",
     ylab = "Global_reactive_power", type = "n")
lines(data$DateTime, data$Global_reactive_power)
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()

