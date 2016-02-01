NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
library(ggplot2)

vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehicles_SCC <- SCC[vehicles,]$SCC
vehicles_NEI <- NEI[NEI$SCC %in% vehiclesSCC,]

vehicles_Baltimore_NEI <- vehicles_NEI[vehicles_NEI$fips=="24510",]
vehicles_Baltimore_NEI$city <- "Baltimore City"

vehicles_LA_NEI <- vehicles_NEI[vehicles_NEI$fips=="06037",]
vehicles_LA_NEI$city <- "Los Angeles County"

NEI01 <- rbind(vehicles_Baltimore_NEI,vehicles_LA_NEI)

png("plot6.png",width=480,height=480,units="px",bg="transparent")


ggp1 <- ggplot(NEI01, aes(x=factor(year), y=Emissions, fill=city)) +
  geom_bar(aes(fill=year),stat="identity") +
  facet_grid(scales="free", space="free", .~city) +
  guides(fill=FALSE) + theme_bw() +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission")) + 
  labs(title=expression("Motor Vehicle Source Emissions in Baltimore & LA, 1999-2008"))

print(ggp1)

dev.off()