# Read source files
#NEI <- readRDS("summarySCC_PM25.rds")
#SCC <- readRDS("Source_Classification_Code.rds")

# Subset NEI for Baltimore City (24510) and Los Angeles (06037) and On-Road
NEI$fips <- as.numeric(NEI$fips)
sub0 <- subset(NEI, (fips==24510 | fips==06037) & type=="ON-ROAD")

# Create dataframe for totals
tl <- with(sub0,tapply(Emissions, list(fips,year),sum,na.rm=TRUE))
tl_df <- data.frame(tl)

# Load tidyr and tidy up tl_df
library(tidyr)
tl_df$City<-rownames(tl_df)
tl_df <- gather(tl_df,Year,Emissions,-City)
tl_df$Year <- as.numeric(sapply(strsplit(tl_df$Year,"X"),function(x) x[2]))

# Subset for Baltimore and LA cities
tl_df_B <- subset(tl_df,City==24510)
tl_df_LA <- subset(tl_df,City==6037)

# Plot graphs
ylim_interval <- 15*50    # to standardize y-range
par(mfrow=c(1,2), mar=c(5.1,4,4,1))
with(tl_df_B,plot(Year,Emissions,pch=19, main="Baltimore City",
                  ylab="PM2.5 Emissions (tons)", ylim=c(min(Emissions),min(Emissions)+ylim_interval)))
model <- with(tl_df_B,lm(Emissions~Year))
abline(model,col="red",lwd=2)

with(tl_df_LA,plot(Year,Emissions,pch=19, main="Los Angeles",
                   ylab="PM2.5 Emissions (tons)",ylim=c(min(Emissions),min(Emissions)+ylim_interval)))
model <- with(tl_df_LA,lm(Emissions~Year))
abline(model,col="red",lwd=2)

# Copy to graphics device
dev.copy(png, file="plot6.png")
dev.off()
