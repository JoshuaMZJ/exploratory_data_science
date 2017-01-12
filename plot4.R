#check if ggplot is installed
if(!require("ggplot2")){install.packages(ggplot2)}
library(ggplot2)

#From Source Classification Code table, find out the SCC codes for coal combustion related emissions.

comb_coal<-intersect(SCC[grep(".*coal.*",SCC$Short.Name,ignore.case=TRUE),3],SCC[grep(".*comb.*",SCC$Short.Name,ignore.case=TRUE),3])
valid.SCC<-SCC[SCC[,3]%in%comb_coal,1]

#Extract set of NEI that have valid SCC
NEI_2<-NEI[NEI$SCC%in%valid.SCC,]
NEI_2$year<-factor(NEI_2$year)

png(filename="plot4.png",width=500,height=500)

g<-ggplot(NEI_2,aes(year,Emissions,fill=year))
print(g+geom_bar(stat="sum")+labs(y=expression("PM"[2.5]*" emissions"),title="Emissions through coal combustion activities in US")+theme(legend.position="none"))

dev.off()