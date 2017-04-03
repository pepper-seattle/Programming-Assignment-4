# download data
if(!file.exists("./R")){dir.create("./R")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./R/Dataset.zip")

# Unzip data to destination file
unzip(zipfile="./R/Dataset.zip",exdir="./R")

# read in data tables
x_train <- read.table("./R/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./R/UCI HAR Dataset/train/y_train.txt")
x_test <- read.table("./R/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./R/UCI HAR Dataset/test/y_test.txt")
subject_train <- read.table("./R/UCI HAR Dataset/train/subject_train.txt")
subject_test <- read.table("./R/UCI HAR Dataset/test/subject_test.txt")
features <- read.table('./R/UCI HAR Dataset/features.txt')
activity_labels <- read.table('./R/UCI HAR Dataset/activity_labels.txt')

# setup column names
colnames(x_train) <- features[,2] 
colnames(y_train) <-"activityId"
colnames(x_test) <- features[,2] 
colnames(y_test) <- "activityId"
colnames(subject_train) <- "subjectId"
colnames(subject_test) <- "subjectId"
colnames(activity_labels) <- c('activityId','activityType')

# merge train data
mrg_train <- cbind(y_train, subject_train, x_train)

# merge test data
mrg_test <- cbind(y_test, subject_test, x_test)

# merge train and test data
completeDataset <- rbind(mrg_train, mrg_test)

# create column name vector
colNames <- colnames(completeDataset)

# create mean and standard div vector

mean_n_std <- (grepl("activityId" , colNames) | 
                 grepl("subjectId" , colNames) | 
                 grepl("mean.." , colNames) | 
                 grepl("std.." , colNames) 
)

# subset for mean and std
mean_n_std_subset <- completeDataset[ , mean_n_std == TRUE]

# set descriptive variable names
activityNames_subset <- merge(mean_n_std_subset, activity_labels,
                              by='activityId',
                              all.x=TRUE)

# make second tidy data set
dataset_two <- aggregate(. ~subjectId + activityId, activityNames_subset, mean)
dataset_two <- dataset_two[order(dataset_two$subjectId, dataset_two$activityId),]

# write second data set to txt file
write.table(dataset_two, "dataset_two.txt", row.name=FALSE)