

library(ggplot2)

# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

# 24510 is Baltimore, see plot2.R
# Searching for ON-ROAD type in NEI
# Don't actually know it this is the intention, but searching for 'motor' in SCC only gave a subset (non-cars)
baltimore_NEI <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]
yearly_values <- aggregate(Emissions ~ year, baltimore_NEI, sum)

png("plot5.png", width=840, height=480)
g1 <- ggplot(yearly_values, aes(factor(year), Emissions))
g1 <- g1 + geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Emissions from type = ON-ROAD in Baltimore City')
print(g1)
dev.off()