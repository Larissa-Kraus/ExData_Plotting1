## Plot 2

# Load data
househouldPowerConsumption<-read.table("household_power_consumption.txt", header= TRUE, sep= ";",na.strings = "?")

# Convert characters of "date" to dates
househouldPowerConsumption$Date<-as.Date(househouldPowerConsumption$Date, "%d/%m/%Y")

# subsetting for the days to explore
subset_data<-subset(househouldPowerConsumption, Date>= "2007-02-01"& Date<= "2007-02-02")

# Converting time and adding to dates to get time and date in one coloumn
datetime <- paste(as.Date(subset_data$Date), subset_data$Time)
subset_data$Date<- as.POSIXct(datetime)

# Plotting
png(file="plot2.png",width=480, height=480)
plot(subset_data$Date,subset_data$Global_active_power, type = "l", ylab="Global Active Power (kilowatts)", xlab = " ")
# The lable of the x-axis is in german, sorry! I was not able to change that
dev.off()
