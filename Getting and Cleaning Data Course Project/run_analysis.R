# Peer-graded Assignment: Getting and Cleaning Data Course Project

# Loading required libraries
library(data.table)
library(dplyr)

# Downloading the dataset
url = 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'

if (!file.exists('./UCI HAR Dataset.zip')){
  download.file(url,'./UCI HAR Dataset.zip')
  unzip("UCI HAR Dataset.zip", exdir = getwd())
}

# Reading required dataframes
features = read.table('./UCI HAR Dataset/features.txt')

X_train <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names = features[,2]) 
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names = "activity")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names ="subject")


X_test <- read.table("./UCI HAR Dataset/test/X_test.txt",  col.names = features[,2])
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names = "activity")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names = "subject")


# Instructions:
# 1. Merging the training and the test sets to create one data set.
train_data <- cbind(X_train, y_train, subject_train)
test_data <- cbind(X_test, y_test, subject_test)
merged_data <- rbind(train_data, test_data)


# 2. Extracting measurements on the mean and standard deviation for each measurement.
filtered_data <- select(merged_data, contains("mean"),contains("std"),activity,subject)


# 3. Uses descriptive activity names to name the activities in the data set
labeled_data <- function(filtered_data)
{
  activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
  activity_labels[filtered_data,2]
}
data <- mutate(filtered_data, activity = labeled_data(filtered_data$activity))



# 4. Appropriately labels the data set with descriptive variable names.
names(data)

names(data) <- gsub("^t", "Time", names(data))
names(data) <- gsub("^f", "Frequency", names(data))
names(data) <- gsub("Acc", "Accelerometer", names(data))
names(data) <- gsub("Gyro", "Gyroscope", names(data))
names(data) <- gsub("Mag", "Magnitude", names(data))
names(data) <- gsub("BodyBody", "Body", names(data))
names(data) <- gsub("angle", "Angle", names(data))
names(data) <- gsub("gravity", "Gravity", names(data))
names(data) <- gsub("mean", "Mean", names(data))
names(data) <- gsub("std", "STD", names(data))
names(data) <- gsub("\\.", "", names(data))




# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidy_data <- data %>%
  group_by(activity, subject) %>%
  summarise_all(funs(mean))

write.table(tidy_data,"tidy_data.txt", row.names = FALSE)



