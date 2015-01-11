## plot4.R
## First load the data, form a useful DateTime column and select the required subset. "HPC.final" is the data we want.
HPC.columns <- c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
HPC <- read.csv("household_power_consumption.txt",sep=";",na.strings="?",colClasses=HPC.columns)
HPC$DateTime <- as.POSIXlt(paste(HPC$Date, HPC$Time), format="%d/%m/%Y %H:%M:%S")
HPC.final <- HPC[HPC$DateTime < "2007-02-03" & HPC$DateTime >= "2007-02-01",3:10]
## Here ends the data wrangling block (will be reused)

## This plot is a matrix of four line plots
## Set up the matrix first.
par(mfrow=c(2,2),mar=c(4,4,2,1))
## Use a block of commands in a with to produce four plots in order
## Would comment this better, but I'm way out of time!
with(HPC.final,{
  plot(DateTime,Global_active_power,type='n',xlab="",ylab="Global Active Power")
  lines(DateTime,Global_active_power)
  plot(DateTime,Voltage,type='n',xlab="datetime",ylab="Voltage")
  lines(DateTime,Voltage)
  plot(DateTime,Sub_metering_1,type='n',xlab="",ylab='Energy sub metering')
  lines(DateTime,Sub_metering_1,col="black")
  lines(DateTime,Sub_metering_2,col="red")
  lines(DateTime,Sub_metering_3,col="blue")
  legend("topright",lwd=1,bty="n",col=c("black","red","blue"),legend=c("Sub_metering_1   ","Sub_metering_2   ","Sub_metering_3   "))
  plot(DateTime,Global_reactive_power,type='n',xlab="datetime")
  lines(DateTime,Global_reactive_power)

})
## Seems to match the picture. Now copy to a png file. Note that 480 pixels by 480 pixels is the default setting.
dev.copy(png,file="plot4.png")
dev.off()
## Done