#!RScript
# args[1] is the data procesed
# args[2] is the total number of configurations for the data processed
library(ggplot2)
library(plyr)
library(reshape2)
library(tools)

processData <- function(data,nconfigurations){
  
  #Adding a helper colum
  data$index <- 1
  data$index <- ave(data$index, cumsum(c(F, diff(data$sr) > 0)), FUN=seq_along)
  data$freq<-ave( as.numeric(data[[1]]), data[["sr"]] , FUN=length)
  data$index= data$index * 100 / data$freq
  
  #CALCULATE METRICS
  #data$fpr=data$FP/as.numeric(args[2])
  #data$fnr=data$FN/as.numeric(args[2])
  data$Accuracy = (data$TP+data$TN)/(data$TP+data$TN+data$FN+data$FP)
  data$Specificity=data$TN/(data$TN+data$FP)
  #  data$safeness=  data$specificity-data$sr
  #  data$prec0=data$TN/(data$TN + data$FN)
  data$FPR=data$FP/as.numeric(nconfigurations)
  data$FNR=data$FN/as.numeric(nconfigurations)
    data$Precision=data$TP/(data$TP + data$FP)
  #  data$rec0 = data$TN / (data$TN + data$FP) # Recall of class 0
  data$Recall = data$TP / (data$TP+ data$FN) # Recall of class 1
  data$NPV=data$TN/(data$TN+data$FN)

  data$configpercentage=data$sr*100/nconfigurations
  
  #This melting is because the data wasn't in the proper csv style
  data<-melt(data, id.vars = c("FN","FP","TN","TP","sr","t","index","freq","dataset","configpercentage"))
  
  return(data)
}

#LOAD THE FILE(S)
#data=read.table(args[1], header=T,sep=",");
#data=read.table("../data/0.5-Apache.csv", header=T,sep=",");
confs=read.table("./helpers/configurationsNo.csv", header=T,sep=",");

for(c in c("20","50","80")){
  #Reads the datasets
  datasets = data.frame()
  temp = list.files(path = paste("./data_clustered/",paste(c,"/",sep=""),sep=""),pattern="*.csv")
  for (i in 1:length(temp)) {
    tmp= read.csv(paste(paste("./data_clustered/",paste(c,"/",sep=""),sep=""),temp[i],sep=""))
    tmp$dataset <- temp[i]
    confno=confs[which(confs$file == temp[i]),]$configurations
    tmp<-processData(tmp,confno);
    datasets=rbind(datasets,tmp)
    
  }
  
  for (v in unique(datasets$variable)){
    datatmp=datasets[which(datasets$variable == v),]
    
    #Generate the plot
    plot<-ggplot(datatmp,aes(configpercentage,value),group=dataset)+geom_line(aes(linetype=dataset))+ theme_bw()+
      xlab(paste("Percentage of configurations in the training set for a threshold of ", "%",sep=c)) + 
      ylab(paste(v," Value",sep=""))+
      theme(axis.text = element_text(size = rel(2)),axis.title= element_text(size = rel(2)))+
      theme(legend.position="none")
    #savetheplot
    ggsave(plot,file=paste(c, ".pdf", sep = paste("-",v,sep="")), width=11, height=11)
  }
}






