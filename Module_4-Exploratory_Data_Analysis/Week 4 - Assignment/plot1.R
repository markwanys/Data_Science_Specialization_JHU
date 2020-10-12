# Read source files
#NEI <- readRDS("summarySCC_PM25.rds")
#SCC <- readRDS("Source_Classification_Code.rds")

# tapply to get total vs year
tl <- with(NEI,tapply(Emissions, year,sum,na.rm=TRUE))

# Create dataframe for totals
tl_df<-data.frame(year=names(tl),total=tl)
tl_df$year<-as.numeric(tl_df$year)

# Plot PM2.5 vs year
with(tl_df,plot(year,total,
                pch=19,xlim=c(1999,2008),main="US PM2.5 Emissions Between 1999 & 2008",xlab="Year",ylab="PM2.5 Emission (tons)"))
model <- lm(total~year,data=tl_df)
abline(model,lwd=2,col="red")

# Copy to graphics device
dev.copy(png, file="plot1.png")
dev.off()
