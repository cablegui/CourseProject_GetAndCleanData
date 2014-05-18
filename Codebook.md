##a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md.

####Variables used
**subject_test** - Test data subject number 
**test_x** - Test data feature measurements
**test_y** - Test data activity numbers  
**subject_train** - Training data subject number
**train_x** - Training data feature measurements
**train_y** - Training data activity numbers

**subject** - Merged subject_test and subject_train
**x** - Merged test and traing feature measurements
**y** - Merged test and training activity numbers

**activity_labels** - Activity labels .. WALKING, SITTING, .....
**feature_labels** - Feature label names tBodyAccJerk-arCoeff()-X,1, tBodyGyro-std()-Y ........

**activity** - merged activity number in y and activity labels in activity_labels variables

**tidyDataset1** - Merged data of subject number, activity labels and feature measurements

**dataset** - Hold mean and std feature measurements and merged with subject number and activity labels

**tidyDataset2** - hold average of all data per subject number and activity label

####Transformations and clean up performed

1. The column names of variable x (feature names) is cleaned using function make.names
2. dataset holds mean and std feature measurements. Selection of columns performed using grep. 
3. tidyDataset2 contains the average of data per subject and activity label using aggregat function