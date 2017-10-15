#Firstly you will have to copy the "household_power_consumption.txt" file in your working directory. 
#Note that the dplyr library is loaded. It must be installed the "dplyr" package with install.packages("dplyr") (or use )
library(dplyr)
Datos <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")
Datos2 <- Datos %>% filter(Date %in% c("1/2/2007","2/2/2007"))
Datos2$Date <- as.Date(Datos2$Date, format="%d/%m/%Y")
png("plot1.png", width=480, height=480)
hist(Datos2$Global_active_power, col="Red", main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()
