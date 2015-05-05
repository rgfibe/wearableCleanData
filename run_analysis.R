# Load feature data and
# 4. Appropriately labels the data set with descriptive variable names. 
feature_names = read.table('features.txt')[,2]
X_test = read.table('./test/X_test.txt', col.names = feature_names)
X_train = read.table('./train/X_train.txt', col.names = feature_names)

# Add numerical activity labels to data sets
y_test = read.table('./test/y_test.txt')
y_train = read.table('./train/y_train.txt')
X_test$activity = y_test[,1]
X_train$activity = y_train[,1]

# Add numerical subject labels to data sets
subject_test = read.table('./test/subject_test.txt')
subject_train = read.table('./train/subject_train.txt')
X_test$subject = subject_test[,1]
X_train$subject = subject_train[,1]

# 1. Merges the training and the test sets to create one data set.
full_data = rbind(X_test, X_train)

# Turn numeric subject and activity labels into factors, to help split the data later
full_data$subject = as.factor(full_data$subject)

# 3. Uses descriptive activity names to name the activities in the data set
full_data$activity = as.factor(full_data$activity)
activity_labels = read.table('activity_labels.txt')[,2]
levels(full_data$activity) = activity_labels

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
mean_std_data = full_data[, grep("mean|std", names(full_data))]

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
split_data = split(mean_std_data, list(full_data$activity, full_data$subject))

tidy_data = data.frame()
add_row_average_variables = function(activity_subject_entry) {
    new_row = colMeans(activity_subject_entry)
    tidy_data <<- rbind(tidy_data, new_row)
}
lapply(split_data, add_row_average_variables)

# Each column name is one variable that has been averaged
# (tBodyAcc.mean...X, ..., fBodyBodyGyroJerkMag.std..)
colnames(tidy_data) = colnames(mean_std_data)

# Each row name is one activity (WALKING, ..., LAYING) combined with one subject (1, ..., 30)
# So row names go from WALKING.1 (subject 1 is walking) to LAYING.30 (subject 30 is laying).
rownames(tidy_data) = names(split_data)

# Save table without row names to upload to Coursera
write.table(tidy_data, file = 'tidy_data.txt', row.name = FALSE)
