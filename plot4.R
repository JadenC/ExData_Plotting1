> data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)
> subsetdata <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

> globalactivepower <-as.numeric(subsetdata$Global_active_power)
> datetime <-strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
> submetering1 <- as.numeric(subsetdata$Sub_metering_1)
> submetering2 <- as.numeric(subsetdata$Sub_metering_2)
> submetering3 <- as.numeric(subsetdata$Sub_metering_3)
> globalreactivepower <- as.numeric(subsetdata$Global_reactive_power)
> voltage <- as.numeric(subsetdata$Voltage)

> png("plot4.png", width=480, height=480)
> par(mfrow = c(2, 2)) 

> plot(datetime, globalactivepower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
> plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
> plot(datetime, submetering1, type="l", ylab="Energy Submetering", xlab="")
> lines(datetime, submetering2, type="l", col="red")
> lines(datetime, submetering3, type="l", col="blue")
> legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
> plot(datetime, globalreactivepower, type="l", xlab="datetime", ylab="Global_reactive_power")
> dev.off()
