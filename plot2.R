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

png(filename = "ExData_Plotting1/figure/plot2.png", width = 480, height = 480)
par(mar = c(4,5,1,1))
plot(x = data_filter$date_time, y = data_filter$Global_active_power, type = "l",
     lwd = 0.1, xlim= times,
     main = "",
     ylab = "Global Active Power (kilowatts)",
     xlab = "")

dev.off()
