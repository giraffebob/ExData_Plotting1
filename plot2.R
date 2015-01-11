## plot2.R
## First load the data, form a useful DateTime column and select the required subset. "HPC.final" is the data we want.
HPC.columns <- c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
HPC <- read.csv("household_power_consumption.txt",sep=";",na.strings="?",colClasses=HPC.columns)
HPC$DateTime <- as.POSIXlt(paste(HPC$Date, HPC$Time), format="%d/%m/%Y %H:%M:%S")
HPC.final <- HPC[HPC$DateTime < "2007-02-03" & HPC$DateTime >= "2007-02-01",3:10]
## Here ends the data wrangling block (will be reused)

## This is a line plot. Set up the screen as if we were going to produce a scatterplot.
with(HPC.final,plot(DateTime,Global_active_power,type='n',xlab="",ylab="Global Active Power (kilowatts)"))
## Now ask for lines instead of points.
with(HPC.final,lines(DateTime,Global_active_power))

## Seems to match the picture. Now copy to a png file. Note that 480 pixels by 480 pixels is the default setting.
dev.copy(png,file="plot2.png")
dev.off()
## Done