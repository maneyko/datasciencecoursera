Programming Assignment
======================

First, download the data for the project:

<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

Then run the script `run_analysis.R` to:

1.  Merge the training and test sets to create one data set
2.  Extract only the measurements on the mean and standard deviation for
    each measurement
3.  Use descriptive activity names to name the activities in the data
    set
4.  Appropriately label the data set with descriptive variable names
5.  Create a second, independent tidy data set with the average of each
    variable for each activity and each subject

(Script description from [assignment description][1])

Running The Script
------------------
The R script has a dependency ``reshape2`` for the ``melt`` and ``dcast``
functions.

```bash
wget -O data.zip https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
unzip data.zip
Rscript -e "install.packages('reshape2', repo='https://cloud.r-project.org')"
Rscript run_analysis.R
```

[1]: https://www.coursera.org/learn/data-cleaning/peer/FIZtT/getting-and-cleaning-data-course-project
