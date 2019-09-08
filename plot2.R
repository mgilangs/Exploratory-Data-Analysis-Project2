NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")



dataNEI  <- NEI[NEI$fips=="24510", ]

sumbyyear2 <- aggregate(Emissions ~ year, dataNEI, sum)


png('plot2.png')

x2 = barplot(height=sumbyyear2$Emissions/1000, names.arg=sumbyyear2$year, xlab="Years", ylab=expression('Total PM2.5 Emission (kilo)'),ylim=c(0,4),main=expression('Total PM2.5 in the Baltimore City, MD Emissions by Years (Kilo)'),col="black")

text(x = x2, y = round(sumbyyear2$Emissions/1000,2), label = round(sumbyyear2$Emissions/1000,2), pos = 3, cex = 0.8, col = "black")

dev.off()



###Mochamad Gilang Saputra