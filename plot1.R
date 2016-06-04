## Read data

fulldata <- read.csv("./household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F) 
fulldata$Date <- as.Date(fulldata$Date, format="%d/%m/%Y")

## Subset data to specified dates
data <- subset(fulldata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

##Create plot 1

hist(data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "Red")

## Save to PNG

dev.copy(png, file="plot1.png", height=480, width=480) 
dev.off() 
