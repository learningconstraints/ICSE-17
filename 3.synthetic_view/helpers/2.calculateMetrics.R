#!RScript
# args[1] is the data procesed
# args[2] is the total number of configurations for the data processed

args=(commandArgs(TRUE))
processData <- function(data){
  #CALCULATE METRICS
  data$fpr=data$FP/as.numeric(args[2])
  data$fnr=data$FN/as.numeric(args[2])
  #data$fpr=data$FP/as.numeric(1000)
  #data$fnr=data$FN/as.numeric(1000)
  data$precision=data$TP/(data$TP+data$FP)
  data$recall=data$TP/(data$TP+data$FN)
  data$simplicity=data$TN/(data$TN+data$FP)
  data$paulmetric=data$TN/(data$TN+data$FN)
  data$accuracy = (data$TP+data$TN)/(data$TP+data$TN+data$FN+data$FP)
  return(data)
  }

#LOAD THE FILE(S)
data=read.table(args[1], header=T,sep=",");
#data=read.table("./data/0.5-LLVM.csv", header=T,sep=",");
data<-processData(data);
#This calculates the closest number
#which.min(abs(data$precision - 0.8))

cat(#0.8
max(data$fpr),";",(which.max(data$fpr)*100/NROW(data)),";",min(data$fpr),";",(which.min(data$fpr)*100/NROW(data)),";",mean(data$fpr),";",(which.min(abs(data$fpr - 0.8))*100/NROW(data)),";",(which.min(abs(data$fpr - 0.5))*100/NROW(data)),";",(which.min(abs(data$fpr - 0.2))*100/NROW(data)),";",
max(data$fnr),";",(which.max(data$fnr)*100/NROW(data)),";",min(data$fnr),";",(which.min(data$fnr)*100/NROW(data)),";",mean(data$fnr),";",(which.min(abs(data$fnr - 0.8))*100/NROW(data)),";",(which.min(abs(data$fnr - 0.5))*100/NROW(data)),";",(which.min(abs(data$fnr - 0.2))*100/NROW(data)),";",
max(data$precision),";",(which.max(data$precision)*100/NROW(data)),";",min(data$precision),";",(which.min(data$precision)*100/NROW(data)),";",mean(data$precision),";",(which.min(abs(data$precision - 0.8))*100/NROW(data)),";",(which.min(abs(data$precision - 0.5))*100/NROW(data)),";",(which.min(abs(data$precision - 0.2))*100/NROW(data)),";",
max(data$recall),";",(which.max(data$recall)*100/NROW(data)),";",min(data$recall),";",(which.min(data$recall)*100/NROW(data)),";",mean(data$recall),";",(which.min(abs(data$recall - 0.8))*100/NROW(data)),";",(which.min(abs(data$recall - 0.5))*100/NROW(data)),";",(which.min(abs(data$recall - 0.2))*100/NROW(data)),";",
max(data$simplicity),";",(which.max(data$simplicity)*100/NROW(data)),";",min(data$simplicity),";",(which.min(data$simplicity)*100/NROW(data)),";",mean(data$simplicity),";",(which.min(abs(data$simplicity - 0.8))*100/NROW(data)),";",(which.min(abs(data$simplicity - 0.5))*100/NROW(data)),";",(which.min(abs(data$simplicity - 0.2))*100/NROW(data)),";",
max(data$paulmetric),";",(which.max(data$paulmetric)*100/NROW(data)),";",min(data$paulmetric),";",(which.min(data$paulmetric)*100/NROW(data)),";",mean(data$paulmetric),";",(which.min(abs(data$paulmetric - 0.8))*100/NROW(data)),";",(which.min(abs(data$paulmetric - 0.5))*100/NROW(data)),";",(which.min(abs(data$paulmetric - 0.2))*100/NROW(data)),";",
max(data$accuracy),";",(which.max(data$accuracy)*100/NROW(data)),";",min(data$accuracy),";",(which.min(data$accuracy)*100/NROW(data)),";",mean(data$accuracy),";",(which.min(abs(data$accuracy - 0.8))*100/NROW(data)),";",(which.min(abs(data$accuracy - 0.5))*100/NROW(data)),";",(which.min(abs(data$accuracy - 0.2))*100/NROW(data)),";",
"\r\n",sep="")
