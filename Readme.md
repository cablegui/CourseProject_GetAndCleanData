###This repo explains how all of the scripts work and how they are connected.

####Description of the working of run_Analysis.R

1. Set the working directory
2. Test data
..1. Collect subject number test data
..2. Collect 561 features measurements of subject test data
..3. Collect the activity label numbers of subject test data
3. Training data
..1. Colect subject number training data
..2. Collect 561 features measurements of subject training data
..3. Collect the activity label numbers of subject training data
4. Merging
..1. Merge subject number training and test datasets. This is the subject number data set
..2. Merge 561 feature training and test data set. This is the feature data set
..3. Merge activity label numbers of subject training and test data sets. This is the activity label data set
5. Read activity label names
6. Read feature names
7. Merge activity label numbers with activity labels
8. Make proper names of the feature names
9. Apply clean feature names to merged 561 feature data set
10. Merge subject number, activity labels and feature dataset together
11. Write output as tidy data set 1
12. Remove all features from feature data set except mean and std using grep
13. Apply aggregate function over all data with list of factors as subject number and activity label.
14. Write resulting table as tidy data set 2
 