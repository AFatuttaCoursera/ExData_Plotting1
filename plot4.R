Sys.setlocale("LC_TIME", "English")

png("plot4.png",width = 480, height = 480)

par(mfrow=c(2,2))

data <- read.delim("household_power_consumption.txt", header = TRUE, sep = ";")

data <- data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]

data$dt <- strptime(paste(data$Date,data$Time, sep = " "),"%d/%m/%Y %H:%M:%S")

data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
data$Voltage <- as.numeric(as.character(data$Voltage))
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))

data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))

plot(
    x = data$dt,
    y = data$Global_active_power,
    col = "black",
    main = NULL,
    ylab = "Global Active Power (kilowatts)",
    xlab="",
    type = "l"
)

plot(
    x = data$dt,
    y = data$Voltage,
    col = "black",
    main = NULL,
    ylab = "Voltage",
    xlab = "datetime",
    type = "l"
)


plot(
    x = data$dt,
    y = data$Sub_metering_1,
    col = "black",
    main = NULL,
    ylab = "Energy sub metering",
    xlab="",
    type = "l"
)

lines( x = data$dt, 
       y = data$Sub_metering_2,
       col = "Red")

lines( x = data$dt, 
       y = data$Sub_metering_3,
       col = "Blue")

legend("topright", 
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col=c("Black","Red","Blue"), lwd = 1, bty = "n", cex = 0.8)

plot(
    x = data$dt,
    y = data$Global_reactive_power,
    col = "black",
    main = NULL,
    ylab = "Global_reactive_power",
    xlab = "datetime",
    type = "l"
)

dev.off()