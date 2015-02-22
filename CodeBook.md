#  Getting and Cleaning Data - Final Project

## Variables
The features used come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.
These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz.
Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.
Similarly, the acceleration signal was then separated into body and gravity acceleration signals
(tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.
 
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ).
Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm
(tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).
 
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing
fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).
 
These signals were used to estimate variables of the feature vector for each pattern: 
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
 
tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroJerkMag
 
The set of variables that were estimated from these signals are:
 
mean(): Mean value
std(): Standard deviation


## Data
The dataset used for this final project is [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

## Transformations

* Merges the training and the test sets to create one data set.
	* rbind was used to join training and test sets together
		* xtrain and xtest were rbind-ed together to create x
		* ytrain and ytest were rbind-ed together to create y
		* subtrain and subtest were rbind-ed together to create sub
* Extracts only the measurements on the mean and standard deviation for each measurement. 
	* the grep function was used to get all features that contain mean and std from the x data frame to create data
	* column names were assigned to xdata
* Uses descriptive activity names to name the activities in the data set
	* numbers were replaced with its corresponding activity name 
	* column name activity was given to the y dataframe
* Appropriately labels the data set with descriptive variable names. 
	* column name subject was given to the sub data frame
	* sub, y, and data were rbind-ed into a dataframe called alldata
* Create a second, independent tidy data set with the average of each variable for each activity and each subject.
	* the averages for each variable by activity was calculated and formed the averages dataframe