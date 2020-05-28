### Plot 4

## Load data
househouldPowerConsumption<-read.table("household_power_consumption.txt", header= TRUE, sep= ";",na.strings = "?")

## Convert characters of "date" to dates
househouldPowerConsumption$Date<-as.Date(househouldPowerConsumption$Date, "%d/%m/%Y")

## subsetting for the days to explore
subset_data<-subset(househouldPowerConsumption, Date>= "2007-02-01"& Date<= "2007-02-02")

## Converting time and adding to dates to get time and date in one coloumn
datetime <- paste(as.Date(subset_data$Date), subset_data$Time)
subset_data$Date<- as.POSIXct(datetime)


## Plotting
png(file="plot4.png",width=480, height=480)

par(mfrow=c(2,2),mar=c(5,4,2,2))

# Subplot 1
plot(subset_data$Date,subset_data$Global_active_power, type = "l", ylab="Global Active Power", xlab = " ")

# Subplot 2
plot(subset_data$Date,subset_data$Voltage, type = "l", ylab="Voltage", xlab = "datetime")

# Subplot 3
with(subset_data,plot(Sub_metering_1~Date, type="l",ylab= "Energy sub metering", xlab=" ",col="black"))
lines(subset_data$Sub_metering_2~subset_data$Date, col="red")
lines(subset_data$Sub_metering_3~subset_data$Date, col="blue")
legend("topright", col=c("black","blue","red"),lty=1, lwd=2, legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3")) 

# Subplot 4
plot(subset_data$Date,subset_data$Global_reactive_power, type = "l", ylab="Global_reactive_power", xlab = "datetime")

# Again sorry about the german labels for the days! I was not able to change that


dev.off()
