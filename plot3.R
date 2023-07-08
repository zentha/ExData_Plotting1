### Plot 3

power_consumption <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")
power_consumption[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
power_consumption[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
power_consumption <- power_consumption[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

png("plot3.png", width=480, height=480)
plot(power_consumption[, dateTime], power_consumption[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(power_consumption[, dateTime], power_consumption[, Sub_metering_2],col="red")
lines(power_consumption[, dateTime], power_consumption[, Sub_metering_3],col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))

dev.off()
