
library(ggplot2)
library(dplyr)



NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI_N_SCC <- merge(NEI, SCC, by="SCC")dataNEI <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]

dataNEI <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]

sumbyyear <- aggregate(Emissions ~ year, dataNEI, sum)



png("plot5.png")

mgs <- ggplot(sumbyyear, aes(factor(year), Emissions ,fill=year, label = round(Emissions,2)))

mgs <- mgs + geom_bar(stat="identity") + xlab("Year") + ylab(expression('Total PM2.5 Emissions')) + ggtitle("Emissions from motor vehicle from 1999-2008 in Baltimore City") + geom_label(aes(fill = year),colour = "white", fontface = "bold")

print(mgs)

dev.off()


#Mochamad Gilang Saputra