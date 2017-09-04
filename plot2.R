##Load the Household Power Consumption  data file
##Read the data
##Subset the data for first 2 days of Feb 2007
datafile<-"./data/household_power_consumption/household_power_consumption.txt"
data<-read.table(datafile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData<-data[data$Date %in% c("1/2/2007", "2/2/2007"),]
##str(subSetData)
datetime<-strptime(paste(subSetData$Date,subSetData$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
globalActivePower<-as.numeric(subSetData$Global_active_power)
##Plot Global Active Power in png device
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power(kilowatts)")
dev.off()