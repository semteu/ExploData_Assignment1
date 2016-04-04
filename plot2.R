# This script allows to plot the Global Active Power variable according to Date/Time 
# from "Individual household electric power consumption Data Set" (household_power_consumption.txt)

#Get a subset of the dataset
households <- read.csv(file ="household_power_consumption.txt", header = FALSE, skip = 66637, 
                       nrows = 2880, sep = ";")

#Setting the headers of variables
colnames(households) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", 
                          "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

#Convert Date and Time fields into the date format
households$DateTime <- strptime(paste(households$Date, households$Time), "%d/%m/%Y %H:%M:%S")

#Plot the values of Global Active Power variable according to Date/Time in a png file (plot2.png)
png(filename = "plot2.png", width  = 480, height = 480, units = "px")
with(households, plot(DateTime, Global_active_power, type ="l", xlab = "", 
                      ylab ="Global Active Power (kilowatts)"))
dev.off()