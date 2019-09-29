
library(dplyr)

power_data <- read.table("household_power_consumption.txt", sep = ";", skip = 1,
                         stringsAsFactors = FALSE)

colnames(power_data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity",
                          "Sub_metering_1","Sub_metering_2","Sub_metering_3")


power_data <- filter(power_data, Date == '1/2/2007'| Date == '2/2/2007')



######

power_data$DateTime <- as.POSIXct(paste(power_data$Date, power_data$Time), format ="%d/%m/%Y %H:%M:%S")

png("plot4.png", width = 420, height = 420)

layout(matrix(c(1,2,3,4), 2, 2, byrow = TRUE))

#top left plot
plot(power_data$DateTime, as.numeric(power_data$Global_active_power), ylab = "Global Active Power (kilowatts)", type = "l", xaxt = 'n')

#top right plot
plot(power_data$DateTime, as.numeric(power_data$Voltage), ylab = "Voltage", xlab = "datetime",type = "l")

#bottom left plot
plot(power_data$DateTime, power_data$Sub_metering_1,col = "black", ylab = "Energy sub metering", xlab ='',type = "l") +
  lines(power_data$DateTime, power_data$Sub_metering_2, col = "red", type = "l") +
  lines(power_data$DateTime, power_data$Sub_metering_3, col = "blue", type = "l") +
  legend("topright",legend = names(power_data[7:9]), col = c("black","red","blue"), lty = 1, cex = 0.75, bty = 'n')

#bottom right plot
plot(power_data$DateTime, as.numeric(power_data$Global_reactive_power), ylab = "Global_reactive_power", xlab="datetime", type = "l")

dev.off()

