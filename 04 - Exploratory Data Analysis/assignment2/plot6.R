# plot6.R
# -------

library(ggplot2)

NEI <- readRDS('summarySCC_PM25.rds')
DATA <- subset(NEI, fips == '24510' | fips == '06037')

on_road <- subset(DATA, type == 'ON-ROAD')
x <- aggregate(on_road$Emissions,
               by=list(year=on_road$year, fips=on_road$fips),
               FUN=sum)

x$fips[x$fips == '24510'] <- 'Baltimore'
x$fips[x$fips == '06037'] <- 'Los Angeles'
colnames(x) <- c('year', 'city', 'Emissions')

qplot(year, Emissions,
      data=x,
      facets=.~city,
      color=city,
      geom='line')

ggsave('plot6.png')
