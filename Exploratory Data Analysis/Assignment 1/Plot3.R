# Downloading the data
if(!file.exists('data.zip')){
  url<-"http://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"
  download.file(url,destfile = "data.zip")
}
unzip("data.zip")

# Reading the data by extracting only required dates 
power <- read.table(text = grep("^[1,2]/2/2007", readLines('household_power_consumption.txt'), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)

#Seeting up the right format for date
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")
datetime <- paste(as.Date(power$Date), power$Time)
power$DateTime <- as.POSIXct(datetime)


## Creating Plot 3
with(power, {plot(Sub_metering_1~DateTime, type="l",ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~DateTime,col='Red')
  lines(Sub_metering_3~DateTime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty = 1, lwd = 2, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.75)

## Saving the file as png
dev.copy(png,"Plot3.png", width=480, height=480)
dev.off()
