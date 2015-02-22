##############################################################################################
# 1. Merges the training and the test sets to create one data set.
##############################################################################################

# Load data
features <- read.table("~/UCI HAR Dataset/features.txt")
activities <- read.table("~/UCI HAR Dataset/activity_labels.txt")

xtrain <- read.table("~/UCI HAR Dataset/train/X_train.txt")
ytrain <- read.table("~/UCI HAR Dataset/train/y_train.txt")
subtrain <- read.table("~/UCI HAR Dataset/train/subject_train.txt")

xtest <- read.table("~/UCI HAR Dataset/test/X_test.txt")
ytest <- read.table("~/UCI HAR Dataset/test/y_test.txt")
subtest <- read.table("~/UCI HAR Dataset/test/subject_test.txt")

# Create X, Y and subject data
x <- rbind(xtrain, xtest)
y <- rbind(ytrain, ytest)
sub <- rbind(subtrain, subtest)

##############################################################################################
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
##############################################################################################

# Get variables containing mean() or standard deviation() in column name
mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])

# Subset columns with mean or standard deviation calculation
xdata <- x[, mean_and_std_features]

# Add column names
names(xdata) <- features[mean_and_std_features, 2]

##############################################################################################
# 3. Uses descriptive activity names to name the activities in the data set.
##############################################################################################

# Replace numbers with its corresponding activity name
y[, 1] <- activities[y[, 1], 2]

# Add column name
names(y) <- "activity"

##############################################################################################
# 4. Appropriately labels the data set with descriptive variable names.
##############################################################################################

# Add column name
names(sub) <- "subject"

# Bind all the data together
alldata <- cbind(sub, y, xdata)

##############################################################################################
# 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject.
##############################################################################################

# Compute averages for columns 3-68 for each subject and activity 
library(plyr)
averages <- ddply(alldata, .(subject, activity), function(x) colMeans(x[, 3:68]))

# Writes data into text file in working directory
write.table(averages, "tidy_data.txt", row.name=FALSE)
