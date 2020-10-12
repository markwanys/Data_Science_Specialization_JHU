# Read source files
#NEI <- readRDS("summarySCC_PM25.rds")
#SCC <- readRDS("Source_Classification_Code.rds")

# Create idx to identify coal combustion
idx <- grep("coal",tolower(unique(SCC$EI.Sector)))
coal_comb <- SCC[idx,c("SCC")]

# Subset NEI for coal combustion
sub0 <- subset(NEI, SCC %in% coal_comb)

# Sum Emissions for each year
tl <- with(sub0, tapply(Emissions,year,sum,na.rm=TRUE))
tl_df <- data.frame(year=as.numeric(names(tl)),emissions=tl)

# Plot Emissions vs year
with(tl_df, plot(year, emissions,
                main="Coal Combustion PM2.5 Emissions \n Between 1999 & 2008",
                xlab="Year",ylab="PM2.5 Emission (tons)",pch=19))
model <- with(tl_df,lm(emissions~year))
abline(model, lwd=2, col="red")

# Copy to graphics device
dev.copy(png, file="plot4.png")
dev.off()