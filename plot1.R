## load data
setwd("C:/Git/ExData_Plotting1")
url <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
filename <- 'exdata-data-household_power_consumption.zip'
download.file(url, destfile = filename, method = 'auto')
unzip(filename)

data_full <- read.table('household_power_consumption.txt', header = TRUE, sep = ";")
head(data_full)

## subset and format 
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")
data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)
head(data)

## Plot 1
hist(as.double(data$Global_active_power), main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()