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
nona_idx <- which(!is.na(power_con$Global_active_power)&!is.na(power_con$datetime))
x <- power_con$datetime[nona_idx]
y <- power_con$Global_active_power[nona_idx]

# Generate Plot 2
plot(x,y,
     main="",
     xlab="",
     ylab = "Global Active Power (kilowatts)",
     type="l")

# Copy plot to png graphics driver
dev.copy(png, file="plot2.png",width=480,height=480,units="px")
dev.off()