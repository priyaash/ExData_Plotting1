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


#plot2 as png file
png("plot3.png", width = 480, height = 480)

plot(data_subset$date_time, data_subset$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(data_subset$date_time, data_subset$Sub_metering_2, type = "l", col = "red")
lines(data_subset$date_time, data_subset$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("Black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
