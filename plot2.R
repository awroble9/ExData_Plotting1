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

# Plot 2 and save .png
png("plot2.png", height = 480, width = 480)
plot(sub.data$Global_active_power ~ sub.data$Datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()