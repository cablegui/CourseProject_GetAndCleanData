#Course 3 Getting and CLeaning data Course Project 1
# The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. 
# The goal is to prepare tidy data that can be used for later analysis. 
# You will be graded by your peers on a series of yes/no questions related to the project. 
# You will be required to submit: 
# 1) a tidy data set as described below, 
# 2) a link to a Github repository with your script for performing the analysis, and 
# 3) a code book that describes the variables, the data, and any transformations or work that you performed 
# to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. 
# This repo explains how all of the scripts work and how they are connected.  
# 
# One of the most exciting areas in all of data science right now is wearable computing - see for example this article .
# Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. 
# The data linked to from the course website represent data collected from the accelerometers 
# from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 
#     
#     http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
# 
# Here are the data for the project: 
#     
#     https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
# 
# You should create one R script called run_analysis.R that does the following. 
# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement. 
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive activity names. 
# Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

setwd("D:\\COURSERA\\DataSCientist\\Course3GettingandCleaningData")

#test data
subject_test <- read.table(file = "./data/UCI HAR Dataset/test/subject_test.txt", header= FALSE) # Has the subject number
colnames(subject_test) <- "subject" #Give meaningful name to column
test_x <- read.table(file = "./data/UCI HAR Dataset/test/X_test.txt", header= FALSE) # Has the 561 features.txt part
test_y <- read.table(file = "./data/UCI HAR Dataset/test/Y_test.txt", header= FALSE) #Has activity labels

#training data
subject_train <- read.table(file = "./data/UCI HAR Dataset/train/subject_train.txt", header= FALSE) # Has the subject number
colnames(subject_train) <- "subject" #Give meaningful name to column
train_x <- read.table(file = "./data/UCI HAR Dataset/train/X_train.txt", header= FALSE) # Has the 561 features.txt part
train_y <- read.table(file = "./data/UCI HAR Dataset/train/Y_train.txt", header= FALSE) #Has activity labels


#merge training and test datasets
subject = rbind(subject_train,subject_test) 
x = rbind(train_x, test_x)
y = rbind(train_y, test_y)




activity_labels <- read.table(file = "./data/UCI HAR Dataset/activity_labels.txt", header= FALSE) #Has description of the activity labels
feature_labels <- read.table(file = "./data/UCI HAR Dataset/features.txt", header= FALSE) #Has description of the activity labels

activity <- merge(y,activity_labels, by.x="V1", by.y = "V1") #merging activity number and activity label
colnames(activity) <- c("activity_no", "acitivity_label") # Give meaning ful names to the columns

colnames(x) <- make.names(feature_labels$V2) #put feature name on features and clean the names

tidyDataset1 = cbind(subject,activity,x) #Merge all information together


if(!file.exists("./output")) dir.create("./output")

#First tidy dataset
write.table(tidyDataset1, file = "./output/tidyDataset1.txt")





#Second tidy dataset 
dataset = cbind(subject,activity,x[,grep("(mean|std)",names(x))]) #Merge information with mean and std information
                
#Compute the average of each of the variables per subject and per activity
tidyDataset2 <- aggregate(dataset[,4:length(dataset)], by = list(dataset$subject, dataset$acitivity_label), mean) 

write.table(tidyDataset2, file = "./output/tidyDataset2.txt")


#Clean up
rm(activity, activity_labels,feature_labels)
rm(subject_train,subject_test)
rm(train_x,test_x)
rm(train_y, test_y)
rm(x,y)
rm(dataset)
rm(tidyDataset1)
rm(tidyDataset2)


