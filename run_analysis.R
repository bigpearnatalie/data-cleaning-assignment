library(stringr)
library(dplyr)

#step 0 reading files first

x_train<-read.table("./train/X_train.txt")
y_train<-read.table("./train/y_train.txt")
subtrain<-read.table("./train/subject_train.txt")
x_test<-read.table("./test/X_test.txt")
y_test<-read.table("./test/y_test.txt")
subtest<-read.table("./test/subject_test.txt")


#step 1.1 merge train sets and test test
x_merge<-rbind(x_test,x_train)
y_merge<-rbind(y_test,y_train)
sub_merge<-rbind(subtest,subtrain)


#step 3 add descriptive activites, which is to replace y"123456" with "walking"etc.
lab<-read.table("./activity_labels.txt")
lab<-data.frame(lab)
lab[]<-lapply(lab,as.character)

y_len<-dim(y_merge)[1]
for (i in 1:y_len){
  l<-y_merge[i,1]
  y_merge[i,1]<-lab[l,2]
  
}


#step 1.2 a readable mergeda large sets with lables subjects info
MergedData<-cbind(sub_merge,y_merge,x_merge)

#step 4 load features and rename the merged data with feature names
descrip<-read.table("./features.txt")
descrip<-as.character(descrip$V2)
descrip<-c("subject","labels",descrip)
names(MergedData)<-descrip

dimes<-dim(MergedData)

#step 2 select only mean and std of measurements
#personally thinking it makes sense to select mean/std after given column feature names
result<- MergedData
for( name in descrip[3:dimes[2]]){
  
  if( str_detect(name,"mean")==FALSE && str_detect(name,"std")==FALSE){
    result[[name]]<-NULL
  }

}


#step 5 get averaged value of each subject on each activity
sub<-levels(result$subject)

name2<-names(result)
dimes2<-dim(result)

re_sub<-factor(result$subject)
subjects<-as.numeric(levels(re_sub))

averaged_result<-NULL
lab2<-lab[2]

  for (sub in subjects){
    
    sub_re<-filter(result,result$subject==sub)
    for (i in (1:dim(lab2)[1])){
      act<-as.character(lab2[i,1])
      sub_act_re<-filter(sub_re,sub_re$labels==act)
    
      a<-sapply(sub_act_re, mean)
      a[1]<-sub
      a[2]<-act
      averaged_result<-cbind(averaged_re,a)}
  }
  
  
