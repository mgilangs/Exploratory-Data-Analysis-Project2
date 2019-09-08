
library(ggplot2)
library(dplyr)


NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI_N_SCC <- merge(NEI, SCC, by="SCC")

coalMatches  <- grepl("coal", NEI_N_SCC$Short.Name, ignore.case=TRUE)
subsetNEI_N_SCC <- NEI_N_SCC[coalMatches, ]

sumbyyear <- aggregate(Emissions ~ year, subsetNEI_N_SCC, sum)



png("plot4.png")

mgs <- ggplot(sumbyyear, aes(factor(year), Emissions/1000, fill=year, label = round(Emissions/1000,2)))

mgs <- mgs + geom_bar(stat="identity") + xlab("Year") + ylab(expression('Total PM2.5 Emissions (kilo)')) + ggtitle("Emissions from Coal Combustion-Related from 1999-2008 (kilo)") + geom_label(aes(fill = year),colour = "white", fontface = "bold")

print(mgs)

dev.off()

###Mochamad Gilang Saputra