# Read source files
#NEI <- readRDS("summarySCC_PM25.rds")
#SCC <- readRDS("Source_Classification_Code.rds")

# Subset NEI for motor vehicle combustion and Baltimore City (fips==24510)
sub0 <- subset(NEI, type=="ON-ROAD" & fips==24510)
tl <- with(sub0,tapply(Emissions, year,sum,na.rm=TRUE))
tl_df <- data.frame(year=as.numeric(names(tl)),emissions=tl)

# Plot Emissions vs year
with(tl_df, plot(year, emissions,
                 main="Baltimore Motor Vehicle \n Combustion PM2.5 Emissions \n Between 1999 & 2008",
                 xlab="Year",ylab="PM2.5 Emission (tons)",pch=19))
model <- with(tl_df,lm(emissions~year))
abline(model, lwd=2, col="red")

# Copy to graphics device
dev.copy(png, file="plot5.png")
dev.off()