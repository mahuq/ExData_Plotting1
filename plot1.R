# entire data frame
data_firstread <- read.csv("household_power_consumption.txt", header=T, sep=';', 
                      na.strings="?", )
# Date class update
data_firstread$Date <- as.Date(data_firstread$Date, format="%d/%m/%Y")

# subset of data - only required data rows
data_subset <- subset(data_firstread, 
                      subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
#str(data_subset)

# creaing Graphic Device .png file
png("plot1.png")
hist(data_subset$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.off()