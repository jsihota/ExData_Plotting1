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
cols = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(data$DateTime,data$Sub_metering_1,xlab="", ylab="Enegey sub meeting",  
     type="l")
lines(data$DateTime,data$Sub_metering_2,type="l",col="red")
lines(data$DateTime,data$Sub_metering_3,type="l",col="blue")
legend("topright", lty=1, lwd=1, col=c("black","blue","red"), legend=cols)


## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()