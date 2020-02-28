## project 1 , plot 1----
# read data and convert date and time variables to respective classes
data <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
names(data)
summary(data$Date)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
summary(data$Time)
data$Time <- strptime(data$Time, format = "%H:%M:%S")

## subset table to mantain only interval between 2007-02-01 and 2007-02-02
summary(data$Date)
data_filter <- subset(data, Date == "2007-02-02" | Date == "2007-02-01")
rm(data)

png(filename = "ExData_Plotting1/figure/plot1.png", width = 480, height = 480)
hist(data_filter$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", breaks = 11)
dev.off()
