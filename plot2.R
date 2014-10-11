library (plyr)
library (dplyr)
setwd("/Users/deborall/Documents/Statistical Programming/ExploratoryAnalysis")
data <- read.table("household_power_consumption.txt", sep = ";", header=TRUE)
data$Date  <- as.Date(as.character(data$Date), "%d/%m/%Y")

tdata <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02" & !is.na(Date))
tdata$DateTotal <- paste(tdata$Date, tdata$Time) 
tdata$DateTotalFmt <- as.POSIXlt(strptime(tdata$DateTotal, "%Y-%m-%d %H:%M:%S" ))
png("plot2.png", width=480, height = 480, unit = "px")

par(mfrow=c(1,1))


# draw an axis on the left 
y <- as.numeric(tdata$Global_active_power)/1000
x <- tdata$DateTotalFmt


plot(y=y, 
     ylim=c(0,6), type="l", x=x,
     ylab="Global Active Power (Kilowatts)",
     xlab="",
     lab=c(3,3,10)
     #yaxs="i"
     
)
dev.off()
