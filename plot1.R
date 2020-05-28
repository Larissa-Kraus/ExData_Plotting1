#Plot 1


# Load data
househouldPowerConsumption<-read.table("household_power_consumption.txt", header= TRUE, sep= ";",na.strings = "?")

# Convert characters of "date" to dates
househouldPowerConsumption$Date<-as.Date(househouldPowerConsumption$Date, "%d/%m/%Y")

# subsetting for the days to explore
subset_data<-subset(househouldPowerConsumption, Date>= "2007-02-01"& Date<= "2007-02-02")

#Plot 1 and save as png
png(file="plot1.png",width=480, height=480)
hist(subset_data$Global_active_power, col="red", xlab= "Global Active Power (kilowatts)", main="Global Active Power")
dev.off()
