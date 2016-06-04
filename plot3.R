## Read data

fulldata <- read.csv("./household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F) 
fulldata$Date <- as.Date(fulldata$Date, format="%d/%m/%Y")

## Subset data to specified dates and change date/time format

data <- subset(fulldata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
datetime <- paste(as.Date(data$Date), data$Time) 
data$Datetime <- as.POSIXct(datetime)

##Create plot 3

png("plot3.png", width=480, height=480)

with(data, {
    plot(Sub_metering_1~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~Datetime,col="Red") 
    lines(Sub_metering_3~Datetime,col="Blue") 
})

## Add legend

legend("topright", col=c("black", "red", "blue"), lty=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 

dev.off() 

