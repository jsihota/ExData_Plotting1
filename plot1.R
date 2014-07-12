## load data
setwd("C:/Git/ExData_Plotting1")
url <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
filename <- 'exdata-data-household_power_consumption.zip'
download.file(url, destfile = filename, method = 'auto')
unzip(filename)



## subset and format 
data <- read.table("household_power_consumption.txt", header=T, sep=';', na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
head(data)
data <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"),]
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
head(data)
summary(data)

## Plot 
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")


## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()