# plot4.R
# -------

NEI <- readRDS('summarySCC_PM25.rds')
SCC <- readRDS('Source_Classification_Code.rds')

coal_mask <- grepl('Coal', SCC$SCC.Level.Three)
coal <- SCC[coal_mask, ]
coal <- subset(NEI, NEI$SCC == coal$SCC)

x <- aggregate(coal$Emissions, by=list(year=coal$year), FUN=sum)
colnames(x) <- c('year', 'Emissions')

png('plot4.png')
plot(x$year, x$Emissions,
     type='o',
     col='blue',
     xlab='year',
     ylab='Emissions',
     main='Emission of PM(2.5) per year of Coal Combustors')

dev.off()
