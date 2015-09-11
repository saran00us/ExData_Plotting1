## read the downloaded dataset
setwd("/Users/saran/explore")
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="household_power_consumption.zip",method="curl")
unzip(zipfile="./household_power_consumption.zip")
data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";",stringsAsFactors=FALSE, dec=".")
## select just the 2 dates data
twodaydata <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
Globalactivepower <- as.numeric(twodaydata$Global_active_power)
datetime <- strptime(paste(twodaydata$Date,twodaydata$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
##write the graph into the file
png("plot2.png")
plot(datetime,Globalactivepower,type="l",xlab="",ylab="Global Active Power (Kilowatts)")
dev.off()