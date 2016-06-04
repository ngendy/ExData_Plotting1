## Read data

fulldata <- read.csv("./household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F) 
fulldata$Date <- as.Date(fulldata$Date, format="%d/%m/%Y")

## Subset data to specified dates and change date/time format

data <- subset(fulldata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
datetime <- paste(as.Date(data$Date), data$Time) 
data$Datetime <- as.POSIXct(datetime)

##Create plot 2

with(data, plot(data$Global_active_power~data$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")) 
     
## Save to PNG

dev.copy(png, file="plot2.png", height=480, width=480) 
dev.off() 
