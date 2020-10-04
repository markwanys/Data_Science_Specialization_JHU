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
gap <- subset(power_con,!is.na(Global_active_power))$Global_active_power

# Generate Plot 1
hist(gap,col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab = "Frequency",
     ylim=c(0,1200))

# Copy plot to png graphics driver
dev.copy(png, file="plot1.png",width=480,height=480,units="px")
dev.off()