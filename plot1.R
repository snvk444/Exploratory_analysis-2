getwd()
NEI <- readRDS("NEI_data/summarySCC_PM25.rds")
df1 <- data.frame(NEI$Emissions,NEI$year)
head(df1)

yearly_values <- aggregate(df1$NEI.Emissions ~ df1$NEI.year,df1, sum)

png("plot1.png",width=480,height=480,units="px",bg="transparent")

barplot(
  (yearly_values$`df1$NEI.Emissions`)/10^6,
  names.arg=yearly_values$`df1$NEI.year`,
  xlab="Year",
  ylab="PM2.5 Emissions in Tons - (10^6)",
  main="PM2.5 Emissions for each year from US data"
)

dev.off()