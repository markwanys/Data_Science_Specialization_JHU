library(dplyr)

# Read source file
power_con <- read.table("household_power_consumption.txt", sep=";",header=TRUE)

# Coerce data classes
power_con$Date <- as.Date(power_con$Date,format="%d/%m/%Y")
power_con$Time <- format(strptime(power_con$Time, "%H:%M:%S"),"%H:%M:%S")
power_con[,3:9] <- lapply(power_con[,3:9],as.numeric)

# Create datetime Column
power_con$datetime <- as.POSIXlt(paste(power_con$Date, power_con$Time))

# Subset to 2007-02-01 and 2007-02-02
power_con <- subset(power_con, Date=="2007-02-01" | Date=="2007-02-02")

# Filter non-na values and relevant plotting variables
nona_idx <- which(!is.na(power_con$Sub_metering_1)&!is.na(power_con$Sub_metering_2)&!is.na(power_con$Sub_metering_3)&!is.na(power_con$datetime)&!is.na(power_con$Global_active_power))
x <- power_con$datetime[nona_idx]
Global_active_power <- power_con$Global_active_power[nona_idx]
Sub_metering_1 <- power_con$Sub_metering_1[nona_idx]
Sub_metering_2 <- power_con$Sub_metering_2[nona_idx]
Sub_metering_3 <- power_con$Sub_metering_3[nona_idx]

# Generate Plot 4
par(mfcol=c(2,2),mar=c(2,2,2,2))

# Generate Plot 2
plot(x,Global_active_power,
     main="",
     xlab="",
     ylab = "Global Active Power (kilowatts)",
     type="l")

# Generate Plot 3
plot(x,Sub_metering_1,
     main="",
     xlab="",
     ylab = "Energy sub metering",
     type="l")
lines(x,Sub_metering_2,col="red")
lines(x,Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"), lty=1, bty = "n",cex=0.8,
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Generate Voltage plot
Voltage <- power_con$Voltage[nona_idx]
plot(x,Voltage,xlab="datetime",ylab="Voltage",type="o", pch=20,pt.cex=0.5)

# Generate Global_reactive_power plot
Global_reactive_power <- power_con$Global_reactive_power
plot(x,Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="o", pch=20, pt.cex=0.5)

# Copy plot to png graphics driver
dev.copy(png, file="plot4.png",width=480,height=480,units="px")
dev.off()