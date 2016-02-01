getwd()
NEI <- readRDS("NEI_data/summarySCC_PM25.rds")
# Subset NEI data by Baltimore's data.
baltimore_data <- NEI[NEI$fips=="24510",]

# Aggregate using sum the Baltimore emissions data by year
yearly_values_Baltimore <- aggregate(Emissions ~ year, baltimore_data,sum)

png("plot2.png",width=480,height=480,units="px",bg="transparent")

barplot(
  yearly_values_Baltimore$Emissions,
  names.arg=yearly_values_Baltimore$year,
  xlab="Year",
  ylab="PM2.5 Emissions (Tons)",
  main="PM2.5 Emissions related to Baltimore City Sources"
)

dev.off()