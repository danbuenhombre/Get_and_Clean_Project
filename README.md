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

##Description of the variables in the tiny_data.txt file
General description of the file including:
 - Dimensions of the dataset
 - Summary of the data
 - Variables present in the dataset

(you can easily use Rcode for this, just load the dataset and provide the information directly form the tidy data file)

###Variable 1 (repeat this section for all variables in the dataset)
Short description of what the variable describes.

Some information on the variable including:
 - Class of the variable
 - Unique values/levels of the variable
 - Unit of measurement (if no unit of measurement list this as well)
 - In case names follow some schema, describe how entries were constructed (for example time-body-gyroscope-z has 4 levels of descriptors. Describe these 4 levels). 

(you can easily use Rcode for this, just load the dataset and provide the information directly form the tidy data file)

####Notes on variable 1:
If available, some additional notes on the variable not covered elsewehere. If no notes are present leave this section out.

##Sources
Sources you used if any, otherise leave out.

##Annex
If you used any code in the codebook that had the echo=FALSE attribute post this here (make sure you set the results parameter to 'hide' as you do not want the results to show again)

