NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


sumbyyear <- aggregate(Emissions ~ year, NEI, sum)


png('plot1.png')

x1=barplot(height=sumbyyear$Emissions/1000, names.arg=sumbyyear$year, xlab="Years", ylab=expression('Total PM2.5 Emission (kilo)'),ylim=c(0,8000),main=expression('Total PM2.5 Emissions by Years (kilo)'),col="black")

text(x = x1, y = round(sumbyyear$Emissions/1000,2), label = round(sumbyyear$Emissions/1000,2), pos = 3, cex = 0.8, col = "black")

dev.off()

###Mochamad Gilang Saputra