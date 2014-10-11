library (plyr)
library (dplyr)
setwd("/Users/deborall/Documents/Statistical Programming/ExploratoryAnalysis")
data <- read.table("household_power_consumption.txt", sep = ";", header=TRUE)
data$Date  <- as.Date(as.character(data$Date), "%d/%m/%Y")

tdata <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02" & !is.na(Date))
tdata$DateTotal <- paste(tdata$Date, tdata$Time) 
tdata$DateTotalFmt <- as.POSIXlt(strptime(tdata$DateTotal, "%Y-%m-%d %H:%M:%S" ))
png("plot1.png", width=480, height = 480, unit = "px")

hist(as.numeric(tdata$Global_active_power)/1000, 
     xlab="Global Active Power (kilowatts)", 
     col="red", main="Global Active Power",
     xlim=c(0,6), breaks="Sturges",
     ylim=c(0,1200),
     lab=c(7,4,10)
     
     )
#ev.off()
