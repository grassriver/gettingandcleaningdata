testX<-read.table("./test/X_test.txt")
trainX<-read.table("./train/X_train.txt")
names<-read.table("features.txt")
mergedX<-rbind(testX,trainX)
colnames(mergedX)<-names[,2]
newMergedX<-mergedX[,grepl("mean()|std()",names(mergedX))]
subjectX<-read.table("./test/subject_test.txt")
subjectY<-read.table("./train/subject_train.txt")
mergedSubject<-rbind(subjectX,subjectY)
testY<-read.table("./test/Y_test.txt")
trainY<-read.table("./train/Y_train.txt")
mergedY<-rbind(testY,trainY)
i=1
for (i in 1:10299){
        if (mergedY[i,1]==1){
                mergedY[i,1]<-"WALKING"
        } else if (mergedY[i,1]==2){
                mergedY[i,1]<-"WALKING_UPSTAIRS"
        } else if (mergedY[i,1]==3){
                mergedY[i,1]<-"WALKING_DOWNSTAIRS"
        } else if (mergedY[i,1]==4){
                mergedY[i,1]<-"SITTING"
        } else if (mergedY[i,1]==5){
                mergedY[i,1]<-"STANDING"
        } else if (mergedY[i,1]==6){
                mergedY[i,1]<-"LAYING"
        }
}
colnames(mergedSubject)<-c("subject")
colnames(mergedY)<-c("activities")
merge<-cbind(mergedSubject,mergedY,newMergedX)
activities<-matrix(c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"),6,1)

j=1
means2<-matrix(0,79,180)
subjectsandactivities<-matrix(0,180,2)
for (j in 1:30){
        for (k in 1:6){
        merge1<-merge[merge$subject==j&merge$activities==activities[k,1],]
        subjectsandactivities[(j-1)*6+k,1]<-j
        subjectsandactivities[(j-1)*6+k,2]<-activities[k,1]
        means<-colMeans(merge1[,3:81])
        means1<-as.matrix(means)
        means2[,(j-1)*6+k]<-means1[,1]
        }
}
means3<-t(means2)
tidy<-cbind(subjectsandactivities,means3)
colnames(tidy)<-colnames(merge)
write.table(tidy,"tidydata.txt",row.names=FALSE)