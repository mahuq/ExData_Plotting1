# entire data frame
data_firstread <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', 
                           na.strings="?", 
                           stringsAsFactors=FALSE, dec="." )

# Date class update
data_firstread$Date <- as.Date(data_firstread$Date, format="%d/%m/%Y")

#summary(data_firstread)
#str(data_firstread)

# subset of data - only required data rows
data_subset <- subset(data_firstread, 
                      subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
#str(data_subset)
#summary(data_subset)

## Converting dates
date_time <- as.POSIXct(paste(as.Date(data_subset$Date), data_subset$Time))
#str(date_time)
#str(data_subset)

#format conversion as.numeric

SMtr1 <- as.numeric(data_subset$Sub_metering_1)
SMtr2 <- as.numeric(data_subset$Sub_metering_2)
SMtr3 <- as.numeric(data_subset$Sub_metering_3)
GAPower <- as.numeric(data_subset$Global_active_power)
GRPower <- as.numeric(data_subset$Global_reactive_power)
Voltage <- as.numeric(data_subset$Voltage)


# creaing Graphic Device .png file
png("plot4.png")
par(mfrow = c(2, 2))

#plot upper right
plot(date_time, GAPower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#plot upper right
plot(date_time, Voltage, type="l", xlab="datetime", ylab="Voltage")

#plot lower left
plot(date_time, SMtr1, type="l", ylab="Energy sub metering", xlab="")
lines(date_time, SMtr2, type="l", col="red")
lines(date_time, SMtr3, type="l", col="blue")

legend("topright", col=c("black", "red", "blue"), 
       lty=1, lwd=2.5, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


#plot lower right
plot(date_time, GRPower, type="l", xlab="datetime", ylab="Global Reactive Power")

#device off
dev.off()