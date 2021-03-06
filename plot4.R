## project 1 , plot 2 ----
# read data and convert date and time variables to respective classes
data <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
names(data)
summary(data$Date)
date_time <- paste(data$Date, data$Time, sep = " ")
summary(date_time)
date_time <- strptime(date_time, format = "%d/%m/%Y %H:%M:%S")
summary(date_time)

data$date_time <- date_time
## subset table to mantain only interval between 2007-02-01 and 2007-02-02
summary(data$Date)
data_filter <- subset(data, Date == "2/2/2007" | Date == "1/2/2007")
rm(data)

head(data_filter)
times <- c(min(data_filter$date_time) - 60, (max(data_filter$date_time) + 60))

png(filename = "ExData_Plotting1/figure/plot4.png", width = 480, height = 480)
par(mfrow = c(2,2), mar = c(5,5,2,2))
plot(x = data_filter$date_time, y = data_filter$Global_active_power, type = "l",
     lwd = 0.1, xlim= times,
     main = "",
     ylab = "Global Active Power (kilowatts)",
     xlab = "")

plot(x = data_filter$date_time, y = data_filter$Voltage, type = "l",
     lwd = 0.1, xlim= times,
     main = "",
     ylab = "Voltage",
     xlab = "datetime")


plot(x = data_filter$date_time, y = data_filter$Sub_metering_1, type = "l",
     lwd = 0.1, xlim= times, col = "black", 
     main = "",
     ylab = "Energy sub metering",
     xlab = "")
lines(x = data_filter$date_time, y = data_filter$Sub_metering_2, lwd = 0.1, col = "red")
lines(x = data_filter$date_time, y = data_filter$Sub_metering_3, lwd = 0.1, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1, cex = .8)

plot(x = data_filter$date_time, y = data_filter$Global_reactive_power, type = "l",
     lwd = 0.1, xlim= times,
     main = "",
     ylab = "Global_reactive_power",
     xlab = "datetime")

dev.off()
