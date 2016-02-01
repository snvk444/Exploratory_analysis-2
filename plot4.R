getwd()
NEI <- readRDS("NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("NEI_data/Source_Classification_Code.rds")


# Subset coal combustion related NEI data
combustion <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coal <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
Combustion_coal <- (combustion & coal)
combustionSCC <- SCC[Combustion_coal,]$SCC
combustionNEI <- NEI[NEI$SCC %in% combustionSCC,]

png("plot4.png",width=480,height=480,units="px",bg="transparent")

library(ggplot2)

ggpl2 <- ggplot(combustion,aes(factor(year),Emissions/10^5)) +
  geom_bar(stat="identity",fill="grey",width=0.75) +
  theme_bw() +  guides(fill=FALSE) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  labs(title=expression("PM"[2.5]*" Coal Combustion - US from 1999-2008"))

print(ggpl2)

dev.off()