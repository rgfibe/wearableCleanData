Clean wearable data from:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Download from url below, unzip, and set resulting directory as the working directory.

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Then run run_analysis.R. The code will:

\# Load feature data and
\# 4. Appropriately labels the data set with descriptive variable names. 

\# Add numerical activity labels to data sets

\# Add numerical subject labels to data sets

\# 1. Merges the training and the test sets to create one data set.

\# Turn numeric subject and activity labels into factors, to help split the data later

\# 3. Uses descriptive activity names to name the activities in the data set

\# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

\# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for 
\# Each column name is one variable that has been averaged
\# (tBodyAcc.mean...X, ..., fBodyBodyGyroJerkMag.std..)

\# Each row name is one activity (WALKING, ..., LAYING) combined with one subject (1, ..., 30)
\# So row names go from WALKING.1 (subject 1 is walking) to LAYING.30 (subject 30 is laying).

\# Save table without row names to upload to Coursera
