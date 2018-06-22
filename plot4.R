getwd()

#load the data

data_all<- read.table("household_power_consumption.txt", header = TRUE, sep = ";",stringsAsFactors = FALSE, dec = ".")

#subset the data

data_subset<- data_all[data_all$Date %in% c("1/2/2007", "2/2/2007"),]

# converting class of variable date and time from character to POSIXlt

data_subset$date_time<-paste(data_subset$Date,data_subset$Time)
data_subset$date_time<-strptime(data_subset$date_time,"%d/%m/%Y %H:%M:%S")

data_subset$Global_active_power<-as.numeric(data_subset$Global_active_power)
data_subset$Sub_metering_1<-as.numeric(data_subset$Sub_metering_1)
data_subset$Sub_metering_2<-as.numeric(data_subset$Sub_metering_2)
data_subset$Sub_metering_3<-as.numeric(data_subset$Sub_metering_3)
data_subset$Global_reactive_power<-as.numeric(data_subset$Global_reactive_power)
data_subset$Voltage<-as.numeric(data_subset$Voltage)

#plot4

png("plot4.png", width = 480, height = 480)

# graphing parameter set to create 4 graphs in 2 rows

par(mfrow= c(2,2))
#1st plot in 1st row
plot(data_subset$date_time, data_subset$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")

#2nd plot in 1st row
plot(data_subset$date_time, data_subset$Voltage, type = "l", xlab = "datetime", ylab = "voltage")

#1st plot in 2nd row

plot(data_subset$date_time, data_subset$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(data_subset$date_time, data_subset$Sub_metering_2, type = "l", col = "red")
lines(data_subset$date_time, data_subset$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("Black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# 2nd plot in 2nd row

plot(data_subset$date_time, data_subset$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
