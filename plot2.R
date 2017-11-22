#Reading and subsetting data
library(data.table)
house_data <- fread("household_power_consumption.txt", na.strings = "?")
house_data$Date <- as.Date(house_data$Date, "%d/%m/%Y")
house_data <- house_data[Date >= "2007-02-01" & Date <= "2007-02-02"]
house_data$DateTime <- as.POSIXct(paste(house_data$Date,house_data$Time))

#Plot 2
png("plot2.png", width = 480, height = 480)
plot(house_data$DateTime,house_data$Global_active_power, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()