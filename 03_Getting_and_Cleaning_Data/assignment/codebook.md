# Code Book #

Full description of all variables and data sets is included at the UC Irvine
page:

<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

## Full Code Description ##

### Task 1 ###

*Initialize tables*

- Read ``UCI HAR Dataset/train/X_train.txt``
- Read ``UCI HAR Dataset/test/X_test.txt``
- Read ``UCI HAR Dataset/train/y_train.txt``
- Read ``UCI HAR Dataset/test/y_test.txt``
- Read ``UCI HAR Dataset/train/subject_train.txt``
- Read ``UCI HAR Dataset/test/subject_test.txt``
- Merge ``X_train`` and ``X_test``
- Merge ``y_train`` and ``y_test``
- Merge ``subject_train`` and ``subject_test``


### Task 2 ###

*Extract mean and standard deviation on each measurement*

- Read ``UCI HAR Dataset/features.txt``
- Set column names of merged ``X`` to features
- Set column names of merged ``y`` to ``'activity_id'``
- Set column names of merged ``subject`` to ``'subject'``
- Subset ``X`` to just columns that contain ``'-mean'`` and ``'-std'``


### Task 3 ###

*Use descriptive activity names to name the activities in the data set*

- Read ``UCI HAR Dataset/activity_labels.txt``
- Set column names of ``UCI HAR Dataset/activity_labels.txt`` to
  ``c('activity_id', 'activity')``
- Merge ``y`` with labeled ``activity_labels`` data set


### Task 4 ###

*Appropriately label data set with descriptive variable names*

- Use ``cbind`` to bind selected X values (mean and std) to ``activity_labels``
- Write this out to table ``labeled.txt``


### Task 5 ###

*Create a separate tidy data set with the average of each variable for each
activity and each subject*

- Use ``cbind`` to bind ``labeled.txt`` and subjects
- Create a ``melt`` data set

  - Use ``dcast`` on melted data set to take the mean of relevant columns

- Write result out to table ``tidy.txt``
