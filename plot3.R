Sys.setlocale("LC_TIME", "English")

png("plot3.png",width = 480, height = 480)

data <- read.delim("household_power_consumption.txt", header = TRUE, sep = ";")

data <- data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]

data$dt <- strptime(paste(data$Date,data$Time, sep = " "),"%d/%m/%Y %H:%M:%S")

data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))

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

legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("Black","Red","Blue"), lwd = 1)

dev.off()