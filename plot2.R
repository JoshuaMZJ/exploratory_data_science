source("read.R") # read in both data sets

png(filename="plot2.png")

x<-with(subset(NEI,fips==24510),tapply(Emissions,year,sum))
barplot(x,main="Baltimore city emissions from 1999 to 2008",xlab="Year",ylab=expression("PM"[2.5]))


dev.off()