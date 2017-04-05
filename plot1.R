Sys.setlocale("LC_TIME", "English")

png("plot1.png",width = 480, height = 480)

data <- read.delim("household_power_consumption.txt", header = TRUE, sep = ";")

data <- data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]

data$dt <- strptime(paste(data$Date,data$Time, sep = " "),"%d/%m/%Y %H:%M:%S")

data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

hist(data$Global_active_power, col = "Red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

dev.off()