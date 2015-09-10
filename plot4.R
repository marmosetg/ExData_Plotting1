## Plot 3 generation code
## 

## load data from text file, filter out incomplete readings
pwr_data <- na.omit(read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?"))

## format date and time fields
pwr_data$Date <- as.Date(pwr_data$Date, format="%d/%m/%Y")
pwr_data$Time <- format(strptime(pwr_data$Time, format="%H:%M:%S"),format="%H:%M:%S")

## subset on the desired date range
pwr_data<- subset(pwr_data, Date >= as.Date("2007/02/01") & Date <= as.Date("2007/02/02"))

## open graphic device
png(file = "plot4.png")

## set the display for 2 x 2 plots and adjust margins
par(mfcol = c(2,2))
par(mar=c(4,4,2,2))
    
## generate plot 1 of 4
plot(as.POSIXct(paste(pwr_data$Date, pwr_data$Time), format="%Y-%m-%d %H:%M:%S"), pwr_data$Global_active_power, 
     type="n", xlab="", ylab="Global Active Power")
lines(as.POSIXct(paste(pwr_data$Date, pwr_data$Time), format="%Y-%m-%d %H:%M:%S"), pwr_data$Global_active_power)

## generate plot 2 of 4
plot(as.POSIXct(paste(pwr_data$Date, pwr_data$Time), format="%Y-%m-%d %H:%M:%S"), pwr_data$Sub_metering_1, 
     type="n", xlab="", ylab="Engery Sub Metering")
lines(as.POSIXct(paste(pwr_data$Date, pwr_data$Time), format="%Y-%m-%d %H:%M:%S"), pwr_data$Sub_metering_1)
lines(as.POSIXct(paste(pwr_data$Date, pwr_data$Time), format="%Y-%m-%d %H:%M:%S"), pwr_data$Sub_metering_2, col="red")
lines(as.POSIXct(paste(pwr_data$Date, pwr_data$Time), format="%Y-%m-%d %H:%M:%S"), pwr_data$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1, col = c("black", "red", "blue"), cex=1, bty="n")

## generate plot 3 of 4
plot(as.POSIXct(paste(pwr_data$Date, pwr_data$Time), format="%Y-%m-%d %H:%M:%S"), pwr_data$Voltage, type="n", xlab="datetime", ylab="Voltage")
lines(as.POSIXct(paste(pwr_data$Date, pwr_data$Time), format="%Y-%m-%d %H:%M:%S"), pwr_data$Voltage)

## generate plot 4 or 4
plot(as.POSIXct(paste(pwr_data$Date, pwr_data$Time), format="%Y-%m-%d %H:%M:%S"), pwr_data$Global_reactive_power, type="n", xlab="datetime", ylab="Global_reactive_power")
lines(as.POSIXct(paste(pwr_data$Date, pwr_data$Time), format="%Y-%m-%d %H:%M:%S"), pwr_data$Global_reactive_power)

## close device
dev.off()                          