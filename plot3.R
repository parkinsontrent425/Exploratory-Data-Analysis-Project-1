#Reading and subsetting data
library(data.table)
house_data <- fread("household_power_consumption.txt", na.strings = "?")
house_data$Date <- as.Date(house_data$Date, "%d/%m/%Y")
house_data <- house_data[Date >= "2007-02-01" & Date <= "2007-02-02"]
house_data$DateTime <- as.POSIXct(paste(house_data$Date,house_data$Time))

#Plot 3
png("plot3.png", width = 480, height = 480)
with(house_data,plot(DateTime,Sub_metering_1, type = "l", xlab = "",
                     ylab = "Energy sub metering"))
lines(house_data$DateTime,house_data$Sub_metering_2, col = "red")
lines(house_data$DateTime,house_data$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), lty = c(1,1,1),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()