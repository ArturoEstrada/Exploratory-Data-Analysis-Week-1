
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
with(data_subset, plot(Time,Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (Kilowatts)", main = "Global Active Power vs Time"))


##Generate PNG file
dev.copy(png, file = "plot2.png")
dev.off()