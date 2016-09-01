#!RScript
# args[1] is the data procesed
# args[2] is the total number of configurations for the data processed
library(ggplot2)
library(plyr)
library(reshape2)
library(tools)

args=(commandArgs(TRUE))
processData <- function(data){
  #CALCULATE METRICS
  data$fpr=data$FP/as.numeric(args[2])
  data$fnr=data$FN/as.numeric(args[2])
#  data$fpr=data$FP/as.numeric(1000)
#  data$fnr=data$FN/as.numeric(1000)
  data<-melt(data, id.vars = c("FN","FP","TN","TP","sr","t"))
  return(data)
  }

#LOAD THE FILE(S)
data=read.table(args[1], header=T,sep=",");
#data=read.table("../data/0.5-Apache.csv", header=T,sep=",");

data<-processData(data);

plot<-ggplot(data,aes(sr,value),group=variable)+geom_line(aes(linetype=variable))+ theme_bw()+
  xlab("Number of configurations in the training set") +
  ylab("Metric Value")+
  theme(legend.position="none")

ggsave(plot,file=paste(basename(file_path_sans_ext(args[1])), ".pdf", sep = ""), width=11, height=11)