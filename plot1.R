## Plot 1 generation code
## 

## load data from text file, filter out incomplete readings
pwr_data <- na.omit(read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?"))

## format date and time fields
pwr_data$Date <- as.Date(pwr_data$Date, format="%d/%m/%Y")
pwr_data$Time <- format(strptime(pwr_data$Time, format="%H:%M:%S"),format="%H:%M:%S")

## subset on the desired date range
pwr_data<- subset(pwr_data, Date >= as.Date("2007/02/01") & Date <= as.Date("2007/02/02"))

## open graphic device
png(file = "plot1.png")

## generate the histogram w/labels and title
hist(pwr_data$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

## close device
dev.off()                          