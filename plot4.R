# This script plots in one figure :
# - the histogram of Global Active Power variable
# - the Global Active Power variable according to Date/Time
# - the different Sub Metering variables according to Date/Time 
# - the Global Reactive Power variable according to Date/Time

#Get a subset of the dataset
households <- read.csv(file ="household_power_consumption.txt", header = FALSE, skip = 66637, 
                       nrows = 2880, sep = ";")

#Setting the headers of variables
colnames(households) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", 
                          "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

#Convert Date and Time fields into the date format
households$DateTime <- strptime(paste(households$Date, households$Time), "%d/%m/%Y %H:%M:%S")

#Plot 
png(filename = "plot4.png", width  = 480, height = 480, units = "px")
par(mfrow = c(2, 2))

with(households, plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))

with(households, plot(households$DateTime, households$Voltage, type = "l", xlab = "datetime", 
                      ylab = "Voltage"))

with(households, plot(DateTime, Sub_metering_1, type ="l", xlab = "", ylab = "Energy sub metering"))
with(households, lines(DateTime, Sub_metering_2, col = "red"))
with(households, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_1", "Sub_metering_1"))

with(households, plot(DateTime, Global_reactive_power, type ="l", xlab = "datetime"))

dev.off()
