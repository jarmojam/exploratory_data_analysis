## plot1.R
## First get complete data set from file
dataComplete <- read.csv("./data/household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

## Convert date
dataComplete$Date <- as.Date(dataComplete$Date, format="%d/%m/%Y")

## Subset data for required dates only
dataSub <- subset(dataComplete, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Original dataset may be removed, since only subset will be used
rm(dataComplete)

## Convert date and time into datetime
dateTime <- paste(as.Date(dataSub$Date), dataSub$Time)
## Add Datetime into dataSub dataset
dataSub$Datetime <- as.POSIXct(dateTime)

## Create plot
hist(dataSub$Global_active_power, main = "Global Active Power",
     xlab= "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")

## Save to file
dev.copy(png, file="plot1.png", height = 480, width=480)
dev.off()





