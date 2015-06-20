# Getting and Cleaning Data

## Data

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S Smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


## Project

Create one R script called run_analysis.R that does the following:

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## Project Steps

### Read files
* Read test and train files with data, subject and labels.
* Read activity labels file and add column names.
* Read features file.

### Combine files
* Combine train and test labels files and replace labels with activity names using activity labels file.
* Combine train and test Subject files and add column name.
* Combine train and test data sets. Read features file and add features names as column names to the data set.

### Extract
* Extract only mean and standard deviation measurements from the data set.

### Merge all data
* Add Labels and Subjects to the data with mean and standard deviation measurements.

### Create tidy data set
* Create data set with the average of each variable for each activity and each subject.
* Create a text file "TidyData.txt" without row names.



