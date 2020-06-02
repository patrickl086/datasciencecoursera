
# Downloading the data
if(!file.exists('data.zip')){
  url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
  download.file(url,destfile = "data.zip")
}
unzip("data.zip")

# Reading the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

str(NEI)
str(SCC)

#Question 1
#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

barplot(
  ((aggregate(Emissions ~ year, NEI, sum))$Emissions),
  col = 'blue',
  xlab="Year",
  ylab="PM2.5 Emissions",
  main="Total PM2.5 Emissions by Year"
)

# Saving the file as png
dev.copy(png,"Plot1.png", width=480, height=480)
dev.off()

# Question2
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (\color{red}{\verb|fips == "24510"|}fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.

baltimore <- NEI[NEI$fips=="24510",]

barplot(
  ((aggregate(Emissions ~ year, baltimore, sum))$Emissions),
  col = 'red',
  xlab="Year",
  ylab="PM2.5 Emissions",
  main="Baltimore Total PM2.5 Emissions by Year"
)

# Saving the file as png
dev.copy(png,"Plot2.png", width=480, height=480)
dev.off()

# Question 3
# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? Which have seen increases in emissions from 1999-2008? Use the ggplot2 plotting system to make a plot answer this question.

library(ggplot2)

ggplot(baltimore,aes(factor(year),Emissions,fill=type)) +
  geom_bar(stat="identity") +
  theme_bw() + guides(fill=FALSE)+
  facet_grid(.~type,scales = "free",space="free") + 
  labs(x="Year", y=expression("Total PM2.5 Emissions")) + 
  labs(title=expression("Baltimore PM2.5 Emissions by year by Source Type"))

# Saving the file as png
dev.copy(png,"Plot3.png", width=480, height=480)
dev.off()


# Question 4
# Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?
SCC_Name <- subset(SCC, select = c("SCC", "Short.Name"))
NEI_Name <- merge(NEI, SCC_Name, by.x="SCC", by.y="SCC", all=TRUE)
coal <- subset(NEI_Name, grepl('Coal',NEI_Name$Short.Name, fixed=TRUE), c("Emissions", "year","type", "Short.Name"))
coal <- coal[complete.cases(coal), ]

ggplot(coal,aes(factor(year),Emissions)) +
  geom_bar(stat="identity", fill='blue') +
  theme_bw() + guides(fill=FALSE)+
  labs(x="Year", y=expression("Total PM2.5 Emissions")) + 
  labs(title=expression("USA Coal PM2.5 Emissions by year by Source Type"))


# Saving the file as png
dev.copy(png,"Plot4.png", width=480, height=480)
dev.off()


# Question 5
# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?
balMotor <- subset(baltimore, NEI$type == "ON-ROAD")
balMotorAgg <- aggregate(Emissions ~ year, balMotor, sum)

ggplot(balMotorAgg,aes(factor(year),Emissions)) +
  geom_bar(stat="identity", fill='red') +
  theme_bw() + guides(fill=FALSE)+
  labs(x="Year", y=expression("Total PM2.5 Emissions")) + 
  labs(title=expression("Baltimore Total PM2.5 Motor Emissions by Year"))

# Saving the file as png
dev.copy(png,"Plot5.png", width=480, height=480)
dev.off()

# Question 6
# Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (\color{red}{\verb|fips == "06037"|}fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?
library("plyr")

balLAMotor <- subset(NEI, NEI$fips %in% c("24510","06037") & NEI$type == "ON-ROAD")
balLAMotorAgg <- aggregate(Emissions ~ year + fips, balLAMotor, sum)

balLAMotorAgg <- rename(balLAMotorAgg, c("fips"="City"))
balLAMotorAgg$City <- factor(balLAMotorAgg$City, levels=c("06037", "24510"), labels=c("Los Angeles", "Baltimore"))

ggplot(balLAMotorAgg, aes(x=factor(year), y=Emissions, fill=City)) +
  geom_bar(aes(fill=year),stat="identity") +
  facet_grid(.~City, scales = "free",space="free") +
  guides(fill=FALSE) + theme_bw() +
  labs(x="Year", y=expression("Total PM2.5 Emissions")) + 
  labs(title=expression("Total PM2.5 Motor Emissions in Los Angeles and Baltimore"))

# Saving the file as png
dev.copy(png,"Plot6.png", width=480, height=480)
dev.off()
