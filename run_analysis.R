#Course Project assignment
#create one R script called run_analysis.R that does the following. 
#Merges the training and the test sets to create one data set.
#Extracts only the measurements on the mean and standard deviation for each measurement. 
#Uses descriptive activity names to name the activities in the data set
#Appropriately labels the data set with descriptive variable names. 
#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


#Read test and train data files
Train_Data<-read.table("./UCI HAR Dataset/train/X_train.txt", head=FALSE)
Test_Data<-read.table("./UCI HAR Dataset/test/X_test.txt", head=FALSE)

#Read test and train subject files
Train_Subject<-read.table("./UCI HAR Dataset/train/subject_train.txt", head=FALSE)
Test_Subject<-read.table("./UCI HAR Dataset/test/subject_test.txt", head=FALSE)

#Read test and train labels files and activity labels
Train_Labels<-read.table("./UCI HAR Dataset/train/Y_train.txt", head=FALSE)
Test_Labels<-read.table("./UCI HAR Dataset/test/Y_test.txt", head=FALSE)
activity_labels<-read.table("./UCI HAR Dataset/activity_labels.txt", head=FALSE)

#Add column names to activity_labels
names(activity_labels) = c("Activity_Label","Activity_Name")

#Combine train and test labels and replace labels with activity names
Labels<- rbind(Train_Labels, Test_Labels)
names(Labels) = c("Activity_Label")
Labels_1<-merge(Labels,activity_labels,by="Activity_Label", all=TRUE)
Labels_1$Activity_Label <- NULL

#Combine train and test Subject and add column name
Subject <- rbind(Train_Subject, Test_Subject)
names(Subject)<-c("Subject")

#Combine train and test data
Data<- rbind(Train_Data, Test_Data)

#Read features file
features<-read.table("./UCI HAR Dataset/features.txt", head=FALSE)
#Add features names as column names to the Data file
names(Data)<-features$V2

#Extract only Mean and STD data from the data set
features_mean_std <<- grep(".*-mean.*|.*-std.*", features[,2])
Data_mean_std <- Data[ , features_mean_std]

#Check the name of the last column
#colnames(Data)[ncol(Data)]

#Combine Data with mean and STD, Labels and Subject in one data set
DataExtract<- cbind(Subject,Labels_1,Data_mean_std)

#Create tidy data set with the average of each variable for each activity and each subject
Tidy_data <- aggregate(DataExtract[, 3:ncol(DataExtract)], by=list(Activity_Name = DataExtract$Activity_Name, Subject = DataExtract$Subject), mean)

#Create a text file without row names
write.table(format(Tidy_data, scientific=T), "TidyData.txt", row.names=F)
