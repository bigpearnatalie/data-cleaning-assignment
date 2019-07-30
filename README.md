# data-cleaning-assignment
For Coursera Data Science Specially Course 3 assignment


   TO fulfill the required assignment, the R script called run_analysis.R should perform the following tasks:

    Merges the training and the test sets to create one data set.
    Extracts only the measurements on the mean and standard deviation for each measurement.
    Uses descriptive activity names to name the activities in the data set
    Appropriately labels the data set with descriptive variable names.
    From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


step 0 reading files first
step 1.1 merge train sets and test test
step 3 add descriptive activites, which is to replace y"123456" with "walking"etc.
step 1.2 a readable mergeda large sets with lables subjects info
step 4 load features and rename the merged data with feature names
step 2 select only mean and std of measurements. Personally thinking it makes sense to select mean/std after given column feature names
step 5 get averaged value of each subject on each activity, using filter to select the subject and activity, then use sapply to calculate the mean of each measurement.
