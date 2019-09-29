
library(dplyr)

power_data <- read.table("household_power_consumption.txt", sep = ";", skip = 1,
                         stringsAsFactors = FALSE)

colnames(power_data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity",
                          "Sub_metering_1","Sub_metering_2","Sub_metering_3")


power_data <- filter(power_data, Date == '1/2/2007'| Date == '2/2/2007')


########

power_data$DateTime <- as.POSIXct(paste(power_data$Date, power_data$Time), format ="%d/%m/%Y %H:%M:%S")

png("plot2.png", width = 420, height = 420)

plot(power_data$DateTime, as.numeric(power_data$Global_active_power), ylab = "Global Active Power (kilowatts)", type = "l", xlab = '')

dev.off()

