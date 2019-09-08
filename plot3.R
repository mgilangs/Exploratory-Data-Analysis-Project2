library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


dataNEI  <- NEI[NEI$fips=="24510", ]

sumbyyearntype <- aggregate(Emissions ~ year + type, dataNEI, sum)



png("plot3.png")

mgs <- ggplot(sumbyyearntype, aes(year, Emissions, color = type))

mgs <- mgs + geom_line() + xlab("Year") +  ylab(expression('Total PM2.5 Emissions')) + ggtitle('Total Emissions in Baltimore City by Source Types from 1999 to 2008')

print(mgs)

dev.off()

###Mochamad Gilang Saputra