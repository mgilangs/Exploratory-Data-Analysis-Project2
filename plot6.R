
library(ggplot2)
library(dplyr)



NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI_N_SCC <- merge(NEI, SCC, by="SCC")dataNEI <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]


dataNEI <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",  ]

sumbyyearnfips <- aggregate(Emissions ~ year + fips, dataNEI, sum)

sumbyyearnfips$fips[sumbyyearnfips$fips=="24510"] <- "Baltimore, MD"

sumbyyearnfips$fips[sumbyyearnfips$fips=="06037"] <- "Los Angeles, CA"


png("plot6.png")

mgs <- ggplot(sumbyyearnfips, aes(factor(year), Emissions, fill=year,label = round(Emissions,2)))

mgs <- mgs + facet_grid(. ~ fips)

#mgs <- mgs + facet_grid(fips~., scales="free")

mgs <- mgs + geom_bar(stat="identity")+ xlab("Year") + ylab(expression('Total PM2.5 Emissions')) + ggtitle(expression("Motor vehicle emission variation in Baltimore and Los Angeles")) + geom_label(aes(fill = year),colour = "white", fontface = "bold")

print(mgs)

dev.off()


###Mochamad Gilang Saputra