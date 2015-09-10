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
png(file = "plot3.png")

## generate the line plot (3 data lines)
plot(as.POSIXct(paste(pwr_data$Date, pwr_data$Time), format="%Y-%m-%d %H:%M:%S"), pwr_data$Sub_metering_1, 
     type="n", xlab="", ylab="Engery Sub Metering")
lines(as.POSIXct(paste(pwr_data$Date, pwr_data$Time), format="%Y-%m-%d %H:%M:%S"), pwr_data$Sub_metering_1)
lines(as.POSIXct(paste(pwr_data$Date, pwr_data$Time), format="%Y-%m-%d %H:%M:%S"), pwr_data$Sub_metering_2, col="red")
lines(as.POSIXct(paste(pwr_data$Date, pwr_data$Time), format="%Y-%m-%d %H:%M:%S"), pwr_data$Sub_metering_3, col="blueviolet")

## add a legend
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1, col = c("black", "red", "blueviolet"))

## close device
dev.off()                          