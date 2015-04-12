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
GAPower <- as.numeric(data_subset$Global_active_power)
#str(GAPower)

# creaing Graphic Device .png file
png("plot2.png")
#str(date_time)
plot(date_time, GAPower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()