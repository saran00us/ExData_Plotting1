## read the downloaded dataset
setwd("/Users/saran/explore")
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="household_power_consumption.zip",method="curl")
unzip(zipfile="./household_power_consumption.zip")
data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";",stringsAsFactors=FALSE, dec=".")
## select just the 2 dates data
twodaydata <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
Globalactivepower <- as.numeric(twodaydata$Global_active_power)
Submetering1 <- as.numeric(twodaydata$Sub_metering_1)
Submetering2 <- as.numeric(twodaydata$Sub_metering_2)
Submetering3 <- as.numeric(twodaydata$Sub_metering_3)
datetime <- strptime(paste(twodaydata$Date,twodaydata$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
##write the graph into the file
png("plot3.png")
plot(datetime,Submetering1,type="l",xlab="",ylab="Energy sub metering")
lines(datetime,Submetering2,type="l",col="red")
lines(datetime,Submetering3,type="l",col="blue")
legend("topright",border="black",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=3,
       col=c("black","red","blue"))
dev.off()