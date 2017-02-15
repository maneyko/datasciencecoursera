# Week 4 Programming Assignment
# =============================

# Uses `melt` and `dcast`
library(reshape2)


# Task 1
# ------
# Merge test and train data sets

# Initialize tables
X_train <- read.table('UCI HAR Dataset/train/X_train.txt')
X_test <- read.table('UCI HAR Dataset/test/X_test.txt')
y_train <- read.table('UCI HAR Dataset/train/y_train.txt')
y_test <- read.table('UCI HAR Dataset/test/y_test.txt')
subject_train <- read.table('UCI HAR Dataset/train/subject_train.txt')
subject_test <- read.table('UCI HAR Dataset/test/subject_test.txt')

# Merge tables
X <- rbind(X_train, X_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)


# Task 2
# ------
# Extract mean and standard deviation on each measurement

features <- read.table('UCI HAR Dataset/features.txt')[, 'V2']

# Set column names for data sets
colnames(X) <- features
colnames(y) <- 'activity_id'
colnames(subject) <- 'subject'

# Extract measurements on mean and standard deviation
feature_means <- grep('-mean\\(\\)', features, value=TRUE)
feature_stds <- grep('-std\\(\\)', features, value=TRUE)
select_features <- c(feature_means, feature_stds)
X_select <- X[, select_features]


# Task 3
# ------
# Use descriptive activity names to name the activities in the data set

activity_labels <- read.table('UCI HAR Dataset/activity_labels.txt')
colnames(activity_labels) <- c('activity_id', 'activity')

y_labeled <- merge(y, activity_labels)


# Task 4
# ------
# Appropriately label data set with descriptive variable names

labeled <- cbind(X_select, y_labeled['activity'])
write.table(labeled, 'labeled.txt', row.name=FALSE)


# Task 5
# ------
# Create a separate tidy data set with the average of each variable for
# each activity and each subject

tidy <- cbind(labeled, subject)

tidy.melt <- melt(tidy, id=c('subject', 'activity'))
tidy.cast <- dcast(tidy.melt, activity + subject ~ variable, mean)

write.table(tidy.cast, 'tidy.txt', row.name=FALSE)
