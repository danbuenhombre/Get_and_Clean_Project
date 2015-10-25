run_analysis <- function() {

# set working dir
# setwd("~/dataScience/getnclean/project/UCI HAR Dataset")

# load dplyr library
library(dplyr)
  
# column names for X_train.txt and X_test.txt are in features.txt
features <- read.table("./features.txt")
colnames(features) <- c("featureID", "feature")

# replace (), from column names
features$feature <- gsub("\\()", "", features$feature)
features$feature <- gsub(",", "-", features$feature)
features$feature <- gsub("\\(", "-", features$feature)
features$feature <- gsub(")", "", features$feature)

# activities are listed in activity_labels.txt
activities <- read.table("./activity_labels.txt")
colnames(activities) <- c("activityID", "activity")

# read train data
rawTrain <- read.table("./train/X_train.txt")
colnames(rawTrain) <- features$feature
# get only mean and std dev variables
rawTrain <- rawTrain[,grep("[Mm]ean|[Ss]td", names(rawTrain))]

# read subject list
subjectTrain <- read.table("./train/subject_train.txt")
colnames(subjectTrain) <- c("subjectID")

# read labels
labelTrain <- read.table("./train/y_train.txt")
colnames(labelTrain) <- c("activityID")
# merge label names on activityID
labelTrain <- merge(labelTrain, activities)

# add subject and label to final train data frame
train <- cbind(rawTrain, subjectTrain, labelTrain)

# read test data
rawTest <- read.table("./test/X_test.txt")
colnames(rawTest) <- features$feature
# get only mean and std dev variables
rawTest <- rawTest[,grep("[Mm]ean|[Ss]td", names(rawTest))]

# read subject list for test
subjectTest <- read.table("./test/subject_test.txt")
colnames(subjectTest) <- c("subjectID")

# read labels for test
labelTest <- read.table("./test/y_test.txt")
colnames(labelTest) <- c("activityID")
# merge label names on activityID
labelTest <- merge(labelTest, activities)
# add subject and label to final test data frame
test <- cbind(rawTest, subjectTest, labelTest)

# Combine the train and test frames, then remove the activityID column
finalOutputRaw <- rbind(train, test)
finalOutputRaw <- select(finalOutputRaw, -activityID)

# produce the final output by grouping by subjectID and activity, 
# then summarize each column with the mean function
finalOutput <- finalOutputRaw %>% group_by(subjectID, activity) %>% summarize_each(funs(mean))
finalOutput
}