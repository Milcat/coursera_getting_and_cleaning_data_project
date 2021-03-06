library(dplyr)
library(plyr)
library(reshape2)

# downloading the zip file from the web:
fileurl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl,destfile = "data.zip")

# unzip/extracting the f=downloaded file
unzip("data.zip")

# reading the train data file to a data frame:
train_file<-"UCI HAR Dataset/train/X_train.txt"
train_df<-read.table(train_file)

# reading the test data file to a data frame:
test_file<-"UCI HAR Dataset/test/X_test.txt"
test_df<-read.table(test_file)

# reading the train label file to a data frame:
train_label_file<-"UCI HAR Dataset/train/y_train.txt"
train_label_df<-read.table(train_label_file)

# reading the test label file to a data frame:
test_label_file<-"UCI HAR Dataset/test/y_test.txt"
test_label_df<-read.table(test_label_file)

# reading the train subject file to a data frame:
train_subject_file<-"UCI HAR Dataset/train/subject_train.txt"
train_subject_df<-read.table(train_subject_file)


# reading the test subject file to a data frame:
test_subject_file<-"UCI HAR Dataset/test/subject_test.txt"
test_subject_df<-read.table(test_subject_file)

#binding the train and test data sets to one:
all_df<-rbind(train_df,test_df)

# adding to the data set - the activity label (num between 1-6) and subject (num between 1-30)
label_df<-rbind(train_label_df,test_label_df)
subject_df<-rbind(train_subject_df,test_subject_df)
all_df<-cbind(all_df,label_df,subject_df)

# read the features list file into a character variable:
feature_file<-"UCI HAR Dataset/features.txt"
features<-read.table(feature_file)

#change features to a data.frame variable (and ranspose rows and columns:
features<-as.data.frame(features)
features<-t(features)

#remove parentesis from features, change "-" with "_", etc
feat<-features[2,]
feat<-gsub("-","_",feat)
feat<-gsub(",","_",feat)
feat<-gsub("[\\(\\)]","",feat)

# add to features list - the last 2 columns: activity_label and subject:
feat[562]<-"activity_lable"
feat[563]<-"subject"

# set the feat - to be the names/header of the all_df data frame:
names(all_df)<-feat

# duplicate names to be replaced by new names (since some columns have trplicates ten doing this twice)
dup_col<-which(duplicated(names(all_df)))
for (i in dup_col) {
        y<-names(all_df)[i]
        x<-paste(y,"_DUP",sep="")
        names(all_df)[i]<-x
}
dup_col<-which(duplicated(names(all_df)))
for (i in dup_col) {
        y<-names(all_df)[i]
        x<-paste(y,"_DUP",sep="")
        names(all_df)[i]<-x
}

# extract from data frame - only columns whic are mean or std:
meanstd_names<-grep("mean|std|activity_lable|subject",names(all_df),value=TRUE)
meanstd_df<-select(all_df,meanstd_names)

# replace activity_lables from numbers to content:
meanstd_df$activity_lable[meanstd_df$activity_lable==1]<-"WALKING"
meanstd_df$activity_lable[meanstd_df$activity_lable==2]<-"WALKING_UPSTAIRS"
meanstd_df$activity_lable[meanstd_df$activity_lable==3]<-"WALKING_DOWNSTAIRS"
meanstd_df$activity_lable[meanstd_df$activity_lable==4]<-"SITTING"
meanstd_df$activity_lable[meanstd_df$activity_lable==5]<-"STANDING"
meanstd_df$activity_lable[meanstd_df$activity_lable==6]<-"LAYING"
        

# generating from above dataset a data set with the average of each variable for each activity and each subject:
meanstd_df2<-melt(meanstd_df, id = c("activity_lable","subject"))
meanstd_df3<-dcast(meanstd_df2, activity_lable+subject~variable,mean)




