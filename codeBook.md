About this project:
1. Project data obtained from:
	https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Source of the above data is available here:
	http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
3. Run the run_analysis.R script (includes a download function for the above data) to obtain the project data sets

About run_analysis.R
The run_analysis.R file contains instructions as well as code which will produce two tidy data sets based on the data linked above.

1. Step 1 - Obtain and merge training and test data sets 
2. Step 2 - Create column names and mean/standard deviation measurements
3. Step 3/4 - Set descriptive variable names
4. Step 5 - Create second tidy data set with average of each variable for each activity and subject
	a. dataset_two.txt contains the output from this code step

Variables:
1. completeDataset contains the merged data from x_train, y_train, x_test, y_test, subject_train, and subject_test (tables created from the downloaded data set)
2. mean_n_std_subset is the subset of the completeDataset with mean and standard deviation for each column by activityId and subjectId
3. activityNames_subset applies descriptive variable names to the data
4. dataset_two is an independent tidy data set from the main tidy data set with the average of each variable, activity, and subject