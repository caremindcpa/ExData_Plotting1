
## Read the data and subset the two days of "2007-02-01","2007-02-02"
library(data.table)
library(lubridate)
epcall <- fread("household_power_consumption.txt",stringsAsFactors = F)
epc <- subset(epcall, dmy(epcall$Date)=="2007-02-01"|dmy(epcall$Date)=="2007-02-02")
rm(epcall)

##===== Plot4: Draw the graph of plot4 which containing 4 small pictures, saved in the file plot4.png

## set the device "plot4.png",keep the defult png size set, as it is 480 pixels~480 pixels
png("plot4.png")

## get the x-axis variable "time".  and set the layout as 2X2; background as transparent.
time <- dmy_hms(paste(epc$Date,epc$Time))
par(mfrow=c(2,2),bg="transparent")

## draw the 1st graph of Global_active_power~time, with ylab and no xlab.
gap <- as.numeric(epc$Global_active_power)
plot(time,gap,type="l",ylab="Global Active Power",xlab="")

## draw the 2nd graph of Voltage~time, with ylab and xlab.
vol <- as.numeric(epc$Voltage)
plot(time,vol,type="l",ylab="Voltage",xlab="datetime")

## draw the 3rd graph of the 3 sub_metering~time, using defferent line color. set the legend size and no legend box boarder.
sm1<- as.numeric(epc$Sub_metering_1)
sm2<- as.numeric(epc$Sub_metering_2)
sm3<- as.numeric(epc$Sub_metering_3)
plot(time,sm1,type="l",ylab="Energy sub metering",xlab="")
points(time,sm2,type="l",col="red")
points(time,sm3,type="l",col="blue")
legend("topright",lty=1,col=c("black","red","blue"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")

## draw the 4th graph of the Global_reactive_power~time. with xlab and ylab.
grp <- as.numeric(epc$Global_reactive_power)
plot(time,grp,type="l",ylab="Global_reactive_power",xlab="datetime")
## close the device "plot4.png"
dev.off()
