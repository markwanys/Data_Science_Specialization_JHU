# Read source files
#NEI <- readRDS("summarySCC_PM25.rds")
#SCC <- readRDS("Source_Classification_Code.rds")

# Filter to Baltimore City, Maryland (fips == "24510")
sub0 <- subset(NEI,fips==24510)

# tapply to get total vs year
tl <- with(sub0,tapply(Emissions, list(type,year),sum,na.rm=TRUE))

# Create dataframe for totals
tl_df<-data.frame(t(tl))
tl_df$year<-as.numeric(rownames(tl_df))
rownames(tl_df)<-1:4

# Load tidyr and tidy up tl_df
library(tidyr)
tl_df<-gather(tl_df,type,emission,-year)

# Plot PM2.5 vs year for each emission type
library(ggplot2)
library(stats)
a <- ggplot(tl_df,aes(x=year,y=emission))
  a+geom_point()+facet_grid(.~type)+geom_smooth(method="lm",col="red",formula=y~x,se=FALSE)+
    labs(x="Year",y="PM2.5 Emission (tons)",title="PM2.5 Emissions Between 1999 & 2008 grouped by Source Type")
  
# Copy to graphics device
dev.copy(png, file="plot3.png")
dev.off()