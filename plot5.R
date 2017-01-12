#check if ggplot is installed
if(!require("ggplot2")){install.packages(ggplot2)}
library(ggplot2)

#subset for data set containing only Baltimore
x<-subset(NEI,NEI$fips==24510)
x$year<-factor(x$year)

#Find SCC values for vehicles
valid.SCC<-SCC[grep(".*vehicle.*",SCC[,8],ignore.case=TRUE),1]

#further subset NEI set for vehicles emission
x<-x[x$SCC%in%valid.SCC,]

png(filename="plot5.png",width=500,height=500)

g<-ggplot(x,aes(year,Emissions))
print(g+geom_bar(stat="sum",aes(fill=year))+labs(x="Year",y=expression("PM"[2.5]*" emissions"),title="Baltimore PM2.5 emissions from vehicle sources")+theme(legend.position="none"))

dev.off()