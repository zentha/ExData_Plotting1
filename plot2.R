### Plot 2 
# Making a POSIXct date capable of being filtered and graphed by time of day
power_consumption <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")
power_consumption[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
power_consumption[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
power_consumption <- power_consumption[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

png("plot2.png", width=480, height=480)
plot(x = power_consumption[, dateTime]
     , y = power_consumption[, Global_active_power]
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
