#check if ggplot is installed
if(!require("ggplot2")){install.packages(ggplot2)}
library(ggplot2)
#subset for data set containing only Baltimore
x<-subset(NEI,NEI$fips==24510)
x$year<-factor(x$year)


png(filename="plot3.png",width=500,height=500)

g<-ggplot(x,aes(year,Emissions,fill=type))
print(g+geom_bar(stat="sum")+facet_grid(.~type)+labs(y=expression("PM"[2.5]*" emissions"),title="Baltimore PM2.5 by across years by source type")+theme(legend.position="none"))

dev.off()