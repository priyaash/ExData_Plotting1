getwd()

#load the data

data_all<- read.table("household_power_consumption.txt", header = TRUE, sep = ";",stringsAsFactors = FALSE, dec = ".")

#subset the data

data_subset<- data_all[data_all$Date %in% c("1/2/2007", "2/2/2007"),]

# converting class of variable date and time from character to POSIXlt

data_subset$date_time<-paste(data_subset$Date,data_subset$Time)
data_subset$Global_active_power<-as.numeric(data_subset$Global_active_power)
data_subset$date_time<-strptime(data_subset$date_time,"%d/%m/%Y %H:%M:%S")

#plot2 as png file
png("plot2.png", width = 480, height = 480)
plot(data_subset$date_time, data_subset$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")
dev.off()
