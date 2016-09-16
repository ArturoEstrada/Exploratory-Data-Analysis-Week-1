
## Loading data
file  <- "C:/Users/Arturo/Documents/Data Science Specialization/Exploratory Data Analysis/week 1/House_Hold/household_power_consumption.txt"
data <- read.table(file, header = TRUE, sep = ";", na.strings = "?")

## Subseting data
data_subset <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

## Changing Date and Time variables class
data_subset$Date <- as.Date(data_subset$Date, format = "%d/%m/%Y")
data_subset$Time <- strptime(data_subset$Time, format = "%H:%M:%S")
data_subset[1:1440,"Time"] <- format(data_subset[1:1440,"Time"],"2007-02-01 %H:%M:%S")
data_subset[1441:2880,"Time"] <- format(data_subset[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

#Create the plot
par(mfrow = c(2,2))
with(data_subset, plot(Time,Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))
with(data_subset, plot(Time,Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))
with(data_subset, plot(Time,Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
lines(data_subset$Time, data_subset$Sub_metering_2, col = "red")
lines(data_subset$Time, data_subset$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
with(data_subset, plot(Time,Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power"))

##Generate PNG file
dev.copy(png, file = "plot4.png")
dev.off()