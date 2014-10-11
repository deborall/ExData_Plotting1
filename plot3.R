library (plyr)
library (dplyr)
setwd("/Users/deborall/Documents/Statistical Programming/ExploratoryAnalysis")
data <- read.table("household_power_consumption.txt", sep = ";", header=TRUE)
data$Date  <- as.Date(as.character(data$Date), "%d/%m/%Y")

tdata <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02" & !is.na(Date))
tdata$DateTotal <- paste(tdata$Date, tdata$Time) 
tdata$DateTotalFmt <- as.POSIXlt(strptime(tdata$DateTotal, "%Y-%m-%d %H:%M:%S" ))
png("plot3.png", width=480, height = 480, unit = "px")

par(mfrow=c(1,1))

x <- tdata$DateTotalFmt
#Sub-metering plot
plot(y=as.numeric(tdata$Sub_metering_1),
     type="l",
     x=x,
     #axes=F,
     ylab="Energy sub metering",
     yaxs="i",
     ylim=c(0,40),
     xlab="",
     lab=c(4,3,10)
)

lines(y=as.numeric(tdata$Sub_metering_2), x=x, lwd=1, lty=1, col="red")
lines(y=as.numeric(tdata$Sub_metering_3), x=x, lwd=1, lty=1, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1, col=c("black", "red", "blue"))

dev.off()
