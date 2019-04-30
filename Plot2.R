## Read the data and subset the two days of "2007-02-01","2007-02-02"
library(data.table)
library(lubridate)
epcall <- fread("household_power_consumption.txt",stringsAsFactors = F)
epc <- subset(epcall, dmy(epcall$Date)=="2007-02-01"|dmy(epcall$Date)=="2007-02-02")
rm(epcall)

##===== Plot2: Draw line graph of plot2. picture saved in the file plot2.png

## set the device of png. keep the defult png size set, as it is 480 pixels~480 pixels
## set background as transparent
png("plot2.png")
par(bg="transparent")

## get the x-axis variable of "time".
time <- dmy_hms(paste(epc$Date,epc$Time))

## get the y-axis variables, by change the Global_active_power value to numbers.
gap <- as.numeric(epc$Global_active_power)

## Draw the plot with ylab and no xlab.
par(bg="transparent")
plot(time,gap,type="l",ylab="Global Active Power (kilowatts)",xlab="")

## close the device.
dev.off()


