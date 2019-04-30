
## Read the data and subset the two days of "2007-02-01","2007-02-02"
library(data.table)
library(lubridate)
epcall <- fread("household_power_consumption.txt",stringsAsFactors = F)
epc <- subset(epcall, dmy(epcall$Date)=="2007-02-01"|dmy(epcall$Date)=="2007-02-02")
rm(epcall)

##===== Plot3: Draw line graph of plot3. picture saved in the file plot3.png

## set the device of png. keep the defult png size set, as it is 480 pixels~480 pixels
## set background as transparent
png("plot3.png")
par(bg="transparent")

## get the x-axis variable of "time".
time <- dmy_hms(paste(epc$Date,epc$Time))

## get the 3 y-axis variables, by change the sub_metering value to numbers.
sm1<- as.numeric(epc$Sub_metering_1)
sm2<- as.numeric(epc$Sub_metering_2)
sm3<- as.numeric(epc$Sub_metering_3)

## Draw the plot with sub_metering_1 and add the sub_metering_2/3 by points.
plot(time,sm1,type="l",ylab="Energy sub metering",xlab="")
points(time,sm2,type="l",col="red")
points(time,sm3,type="l",col="blue")

## add the legend.
legend("topright",lty=1,col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

## close the device.
dev.off()


