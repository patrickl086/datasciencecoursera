

# Downloading the data
if(!file.exists('data.zip')){
  url<-"http://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"
  download.file(url,destfile = "data.zip")
}
unzip("data.zip")

# Reading the data by extracting only required dates 
power <- read.table(text = grep("^[1,2]/2/2007", readLines('household_power_consumption.txt'), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)


# Creating Plot 1
hist(power$Global_active_power, col = "red", main = paste("Global Active Power"), 
     xlab = "Global Active Power (kilowatts)", ylab="Frequency")

# Saving the file as png
dev.copy(png,"Plot1.png", width=480, height=480)
dev.off()
