## plot3.R
## First load the data, form a useful DateTime column and select the required subset. "HPC.final" is the data we want.
HPC.columns <- c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
HPC <- read.csv("household_power_consumption.txt",sep=";",na.strings="?",colClasses=HPC.columns)
HPC$DateTime <- as.POSIXlt(paste(HPC$Date, HPC$Time), format="%d/%m/%Y %H:%M:%S")
HPC.final <- HPC[HPC$DateTime < "2007-02-03" & HPC$DateTime >= "2007-02-01",3:10]
## Here ends the data wrangling block (will be reused)

## This plot is a multiple line plot. First set up a blank.
with(HPC.final,plot(DateTime,Sub_metering_1,type='n',xlab="",ylab='Energy sub metering'))
## Add lines one at a time
with(HPC.final,lines(DateTime,Sub_metering_1,col="black"))
with(HPC.final,lines(DateTime,Sub_metering_2,col="red"))
with(HPC.final,lines(DateTime,Sub_metering_3,col="blue"))
## Finally, add a legend
## The extra spaces are to fix a bug where the png version was cutting off the ends.
legend("topright",lwd=1,col=c("black","red","blue"),legend=c("Sub_metering_1   ","Sub_metering_2   ","Sub_metering_3   "))
## Seems to match the picture. Now copy to a png file. Note that 480 pixels by 480 pixels is the default setting.
dev.copy(png,file="plot3.png")
dev.off()
## Done