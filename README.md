---
title: "Codebook template"
author: "Dan Goodman"
date: "2015-10-23
output:
  html_document:
    keep_md: yes
---

## Project Description
This project was to take some sample wearable computing data, combine it into a single dataset, and then do a simple summary.

##Study design and data processing

###Collection of the raw data
The data set was manually retrieved from the source, then extracted into the working directory for the R script.

###Notes on the original (raw) data 
More information about the raw data can be found here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

##Creating the tidy datafile

###Guide to create the tidy data file
1.  Download the raw data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
2.  Move the zip file to a new directory (e.g. ~/project)
3.  Unzip the file
4.  Pull run_analyze.R from github and put in directory in step 2 above
5.  Open R Studio and set the working directory to the directory in step 2 above
6.  Source the run_analyze.R script
7.  Call run_analyze() function with no arguments and save to a variable (e.g.  > myData <- run_analyze() )
8.  Save the output to a file using write.table (e.g. > write.table(myData, file = "./finalout.txt") )

###Cleaning of the data
1.  Read features.txt which has the column names for the 561 raw data columns
2.  Assign columns names "featureID" and "feature" to the features data frame
3.  Replace parenthesis and comma characters in the feature names with "-"
4.  Read activity_labels.txt which has the descriptions for the activity ID references in the raw data
5.  Assign column names "activityID" and "activity" to the activities data frame
6.  Read train data from train/X_train.txt
7.  Assign columns names using the features data frame
8.  Subset the train data with just the columns with 'mean' and 'std' in the name
9.  Read train/subject_train.txt which has the subject IDs of the raw train data
10.  Assign a column name "subjectID"
11.  Read train/y_train.txt which has the activity ID for the train data set
12.  Assign a column name "activityID"
13.  Merge activities from step 5 with the activity IDs from step 12
14.  Create a final train data frame by combining (cbind) rawTran with the subject and activity data frames
15.  Read test data from test/X_test.txt
16.  Assign columns names using the features data frame
17.  Subset the test data with just the columns with 'mean' and 'std' in the name
18.  Read test/subject_test.txt which has the subject IDs of the raw test data
19.  Assign a column name "subjectID"
20.  Read test/y_test.txt which has the activity ID for the test data set
21.  Assign a column name "activityID"
22.  Merge activities from step 5 with the activity IDs from step 21
23.  Create a final test data frame by combining (cbind) rawTest with the subject and activity data frames
24.  Combine the final train and test datasets into one using rbind
25.  Remove the activityID column
26.  Create the final, tidy dataset by grouping by subjectID and activity, then calculating the mean of the other variables

##Description of the variables in the finaloutput.txt file
For the project, the tidy data set is comprised of the subjectID, activity and the mean of all of the mean and standard deviation variables in the source data set.

###subjectID
Because the source data are anonymous, an integer between 1 and 30 is used for each of the subjects.

###activity
This is a description of the activity the subject was performing when the data were collected.  Activities include the following:
1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING

###Sensor Signal Variables
The tidy data set includes only the mean and standard deviation (std) variables.  The following variable description was taken directly from the features_info.txt file included in the source data.
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'

##Sources
The source data were obtained from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
A description can be found here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

