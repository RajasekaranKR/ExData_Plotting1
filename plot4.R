##Load the Household Power Consumption  data file
##Read the data
##Subset the data for first 2 days of Feb 2007
datafile<-"./data/household_power_consumption/household_power_consumption.txt"
data<-read.table(datafile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData<-data[data$Date %in% c("1/2/2007", "2/2/2007"),]
##str(subSetData)
datetime<-strptime(paste(subSetData$Date,subSetData$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
globalActivePower<-as.numeric(subSetData$Global_active_power)
globalReactivePower<-as.numeric(subSetData$Global_reactive_power)
voltage<-as.numeric(subSetData$Voltage)
submetering1<-as.numeric(subSetData$Sub_metering_1)
submetering2<-as.numeric(subSetData$Sub_metering_2)
submetering3<-as.numeric(subSetData$Sub_metering_3)
##Plot multiple plots in png device
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, voltage, type="l", xlab="", ylab="Voltage")
plot(datetime, submetering1, type="l", xlab="", ylab="Energy Submetering")
lines(datetime,submetering2,type="l",col="red")
lines(datetime,submetering3,type="l",col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),lty=,lwd=2.5,col=c("black","red","blue"),bty="0")
plot(datetime, globalReactivePower, type="l", xlab="", ylab="Global_reactive_power")
dev.off()