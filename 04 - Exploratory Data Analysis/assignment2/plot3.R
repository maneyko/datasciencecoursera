# plot3.R
# -------

library(ggplot2)

NEI <- readRDS('data/summarySCC_PM25.rds')
DATA <- subset(NEI, fips == 24510)

x <- aggregate(DATA$Emissions, by=list(year=DATA$year, type=DATA$type), FUN=sum)
colnames(x) <- c('year', 'type', 'Emissions')

qplot(year, Emissions,
      data=x,
      facets=.~type,
      geom='line',
      color=type,
      main='Emission of PM(2.5) per type - Baltimore city')

ggsave('plot3.png')
