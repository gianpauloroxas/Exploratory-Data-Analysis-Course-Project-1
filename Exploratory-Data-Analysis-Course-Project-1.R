dataFile <- "C:/Users/10017907/Documents/Johns Hopkins University/4 - Exploratory Data Analysis/Course Project 1/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData1 <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

#Global_active_power
Global_active_power <- as.numeric(subSetData1$Global_active_power)
png("Global_active_power.png", width=500, height=500)
hist(Global_active_power, col="blue", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

#datetime
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
Global_active_power <- as.numeric(subSetData$Global_active_power)
png("DateTime.png", width=500, height=500)
plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

#submetering 1,2,3
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

png("Submetering.png", width=500, height=500)
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="blue")
lines(datetime, subMetering3, type="l", col="green")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()

#####
voltage <- as.numeric(subSetData$Voltage)
png("plot.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, Global_active_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
