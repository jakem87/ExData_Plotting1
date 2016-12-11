data_all <- read.table('C:/Users/n0270010/Documents/Data Science/Coursera/EDA/Week 1/household_power_consumption.txt', 
                       sep=";", header=TRUE, stringsAsFactors = FALSE, na.strings = "?")

head(data_all)

data_all$datetime <-  strptime(paste(data_all$Date,data_all$Time), format= '%d/%m/%Y %H:%M:%S')
data_all$Date <- as.Date(data_all$Date, '%d/%m/%Y')

data <- data_all[data_all$Date >= '2007-02-01' &data_all$Date <= '2007-02-02', ]

###Plot 1: histogram of Global Active Power
png('C:/Users/n0270010/Documents/Data Science/Coursera/EDA/Week 1/plot1.png',height=480, width=480) 

hist(data$Global_active_power, main="Global Active Power", xlab= "Global Active Power (kilowatts)", col='red')

dev.off()

###Plot 2: Global Active Power time series
png('C:/Users/n0270010/Documents/Data Science/Coursera/EDA/Week 1/plot2.png',height=480, width=480) 

plot(data$datetime,data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)",xlab="")

dev.off()

###Plot 3: Energy sub metering time series
png('C:/Users/n0270010/Documents/Data Science/Coursera/EDA/Week 1/plot3.png',height=480, width=480) 

plot(data$datetime,data$Sub_metering_1, type="l", ylab="Energy sub metering",xlab="")
lines(data$datetime,data$Sub_metering_2, col='red')
lines(data$datetime,data$Sub_metering_3, col='blue')
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c(1,'red','blue'), lty=1)

dev.off()

###Plot 4: panel plot
png('C:/Users/n0270010/Documents/Data Science/Coursera/EDA/Week 1/plot4.png',height=480, width=480) 

par(mfcol=c(2,2))

plot(data$datetime,data$Global_active_power, type="l", ylab="Global Active Power",xlab="")

plot(data$datetime,data$Sub_metering_1, type="l", ylab="Energy sub metering",xlab="")
lines(data$datetime,data$Sub_metering_2, col='red')
lines(data$datetime,data$Sub_metering_3, col='blue')
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c(1,'red','blue'), lty=1, bty = "n")

plot(data$datetime,data$Voltage, type="l", ylab="Voltage",xlab="datetime")

plot(data$datetime,data$Global_reactive_power, type="l", ylab="Global_reactive_power",xlab="datetime")

dev.off()
