# Get all the data
all.data <- read.csv("./household_power_consumption.txt", header = T, 
                     sep = ';', na.strings = "?", nrows = 2075259, 
                     check.names = F, stringsAsFactors = F, comment.char = "", 
                     quote = '\"')

all.data$Date <- as.Date(all.data$Date, format = "%d/%m/%Y")

# Subset the data to grab only two dates
sub.data <- subset(all.data, subset = (Date >= "2007-02-01" & 
                  Date <= "2007-02-02"))
rm(all.data)

# Converting dates
datetime <- paste(as.Date(sub.data$Date), sub.data$Time)
sub.data$Datetime <- as.POSIXct(datetime)

# Plot 3 and save as .png
png("plot3.png", height = 480, width = 480)
with(sub.data, {
      plot(Sub_metering_1 ~ Datetime, type = "l",
           ylab = "Global Active Power (kilowatts)", xlab = "")
      lines(Sub_metering_2 ~ Datetime, col = 'Red')
      lines(Sub_metering_3 ~ Datetime, col = 'Blue')
})
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 
dev.off()