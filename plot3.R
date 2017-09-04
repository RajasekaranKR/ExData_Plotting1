##Load the Household Power Consumption  data file
##Read the data
##Subset the data for first 2 days of Feb 2007
datafile<-"./data/household_power_consumption/household_power_consumption.txt"
data<-read.table(datafile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData<-data[data$Date %in% c("1/2/2007", "2/2/2007"),]
##str(subSetData)
datetime<-strptime(paste(subSetData$Date,subSetData$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
globalActivePower<-as.numeric(subSetData$Global_active_power)
submetering1<-as.numeric(subSetData$Sub_metering_1)
submetering2<-as.numeric(subSetData$Sub_metering_2)
submetering3<-as.numeric(subSetData$Sub_metering_3)
##Plot Energy Submetering in png device
png("plot3.png", width=480, height=480)
plot(datetime, submetering1, type="l", xlab="", ylab="Energy Submetering")
lines(datetime,submetering2,type="l",col="red")
lines(datetime,submetering3,type="l",col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),lty=1,lwd=2,col=c("black","red","blue"))
dev.off()