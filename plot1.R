

library(dplyr)

power_data <- read.table("household_power_consumption.txt", sep = ";", skip = 1,
                         stringsAsFactors = FALSE)

colnames(power_data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity",
                          "Sub_metering_1","Sub_metering_2","Sub_metering_3")


power_data <- filter(power_data, Date == '1/2/2007'| Date == '2/2/2007')

#####

png("plot1.png", width = 420, height = 420)

hist(as.numeric(power_data$Global_active_power), col = "red",
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)",
     breaks = 16, xaxt = 'n') + 
  axis(side = 1, at = seq(0,8,2), labels = seq(0,8,2))

dev.off()





