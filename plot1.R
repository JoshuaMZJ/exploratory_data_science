source("read.R") # read in both data sets

png(filename="plot1.png")

#Total up emissions by year and assign to 'y'.
tapply(NEI$Emissions,NEI$year,sum) 

#plot y.
barplot(y,main="PM25 emissions over the years",xlab="Year",ylab="PM25 emission")


dev.off()