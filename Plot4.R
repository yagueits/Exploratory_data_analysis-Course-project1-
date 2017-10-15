#Firstly you will have to copy the "household_power_consumption.txt" file in your working directory. 
#Note that the dplyr library is loaded. It must be installed the "dplyr" package with install.packages("dplyr") (or use )
library(dplyr)
Datos <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")
Datos2$Date <- as.Date(Datos2$Date, format="%d/%m/%Y")
Datos2 <- Datos %>% filter(Date %in% c("1/2/2007","2/2/2007"))
Datos2$DiaHora <- strptime(paste(Datos2$Date, Datos2$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
plot(Datos2$DiaHora, Datos2$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

plot(Datos2$DiaHora, Datos2$Voltage , type="l", xlab="", ylab="Global Active Power (kilowatts)")

plot(Datos2$DiaHora, Datos2$Sub_metering_1 , type="l",  ylab="Energy Submetering", xlab="")
lines(Datos2$DiaHora, Datos2$Sub_metering_2, type="l", col="red")
lines(Datos2$DiaHora, Datos2$Sub_metering_3, type="l", col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


plot(Datos2$DiaHora, Datos2$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
