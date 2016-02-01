getwd()
NEI <- readRDS("NEI_data/summarySCC_PM25.rds")
# Subset NEI data by Baltimore's data.

library(ggplot2)
baltimore_data  <- NEI[NEI$fips=="24510", ]

yearly_Type_values_baltimore <- aggregate(Emissions ~ year + type, baltimore_data, sum)

png("plot3.png", width=640, height=480)
pl1 <- ggplot(yearly_Type_values_baltimore, aes(year, Emissions, color = type))
pl1 <- pl1 + geom_line() + xlab("year") + ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Yearly Emissions in Baltimore City')
print(pl1)
dev.off()