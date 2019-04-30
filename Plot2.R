
## Read the data and subset the two days of "2007-02-01","2007-02-02"
library(data.table)
library(lubridate)
epcall <- fread("household_power_consumption.txt",stringsAsFactors = F)
epc <- subset(epcall, dmy(epcall$Date)=="2007-02-01"|dmy(epcall$Date)=="2007-02-02")
rm(epcall)

##===== Plot1: Draw histogram plot of plot1. picture saved in the file plot1.png

## set the device of png. keep the defult png size set, as it is 480 pixels~480 pixels
## set background as transparent
png("plot1.png")
par(bg="transparent")

## get the y-axis variables, by change the Global_active_power value to numbers.
gap <- as.numeric(epc$Global_active_power)

## Draw the histogram with xlab and main title.
par(bg="transparent")
hist(gap,col="red",
     xlab="Global Active Power (kilowatts)",main="Global Active Power")
## close the device.
dev.off()
