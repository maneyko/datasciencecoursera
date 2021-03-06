# plot2.R
# -------

NEI <- readRDS('data/summarySCC_PM25.rds')
NEI <- subset(NEI, fips == 24510)

x <- aggregate(NEI$Emissions, by=list(Category=NEI$year), FUN=sum)
colnames(x) <- c('year','Emissions')

png('plot2.png')
plot(x$year, x$Emissions,
     type='o',
     col='blue',
     xlab='year',
     ylab='Emissions',
     main='Emission of PM(2.5) per year of Baltimore City, Maryland')

dev.off()
