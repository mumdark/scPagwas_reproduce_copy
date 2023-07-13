
setwd("/share/pub/dengcy/GWAS_Multiomics/Revise_2023.4.11/TimeMemoryTest")
TimeMemo<-read.table("TimeMemoryTest.txt")
TimeMemo<-as.data.frame(matrix(TimeMemo,ncol=4,byrow=T))
colnames(TimeMemo)<-c("gwasN","singleN","Time","Memory")
TimeMemo$gwasN<-as.numeric(TimeMemo$gwasN)
TimeMemo$gwasN<-format(TimeMemo$gwasN,scientific=F)
TimeMemo$gwasN<-factor(TimeMemo$gwasN,levels=c(" 100000"," 200000"," 300000"," 400000"," 500000"," 600000"," 700000"," 800000"," 900000","1000000"))
TimeMemo$singleN<-as.numeric(TimeMemo$singleN)
TimeMemo$Time<-as.numeric(TimeMemo$Time)
TimeMemo$Memory<-as.numeric(TimeMemo$Memory)
write.csv(TimeMemo,file="TimeMemoryTest.csv")
write.csv(TimeMemo,file="TimeMemoryTest2.csv")
#####
TimeMemo1<-read.csv("TimeMemoryTest.csv")
TimeMemo2<-read.csv("TimeMemoryTest2.csv")
TimeMemo<-rbind(TimeMemo1,TimeMemo2)
write.csv(TimeMemo,file="TimeMemoryTest_cbind.csv")
library(ggplot2)
TimeMemo$gwasN<-format(TimeMemo$gwasN,scientific=F)
TimeMemo$gwasN<-factor(TimeMemo$gwasN,levels=c(" 100000"," 200000"," 300000"," 400000"," 500000"," 600000"," 700000"," 800000"," 900000","1000000","2000000","3000000","4000000","5000000"))
ggplot(TimeMemo,aes(x=singleN,y=Time,color=gwasN))+geom_line()+geom_point(size=1)+theme_bw()+theme(legend.position="right")+labs(x="Number of cells",y="Time(s)",color="Number of SNPs")
ggsave("TimeMemoryTest_Time.pdf",width=8,height=6)
ggsave("TimeMemoryTest_Time.png",width=8,height=6)


library(ggplot2)
ggplot(TimeMemo,aes(x=singleN,y=Memory,color=gwasN))+geom_line()+geom_point(size=1)+theme_bw()+theme(legend.position="right")+labs(x="Number of cells",y="Memory(MB)",color="Number of SNPs")
ggsave("TimeMemoryTest_Memory.pdf",width=8,height=6)
ggsave("TimeMemoryTest_Memory.png",width=8,height=6)
TimeMemo_100w<-subset(TimeMemo,gwasN=="1000000")
ggplot(TimeMemo_100w,aes(x=singleN,y=Memory,color=gwasN))+geom_line()+geom_point(size=1)+theme_bw()+theme(legend.position="right")+labs(x="Number of cells",y="Memory(MB)",color="Number of SNPs")
ggsave("TimeMemoryTest_Memory_100w.pdf",width=8,height=6)
ggsave("TimeMemoryTest_Memory_100w.png",width=8,height=6)
