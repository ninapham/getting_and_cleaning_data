#  Getting and Cleaning Data - Final Project
This repository contains code and documentation files for the final project in the Coursera Data Science course "Getting and Cleaning Data".

The dataset used for this final project is [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

## Contents
The code assumes that all the data is present in the working directory.

**CodeBook.md** describes the variables, the data, and any transformations or work that was performed to clean up the data.

**run_analysis.R** contains R code used to perform the required analysis. The code does the following:
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 

This can be launched in RStudio by just importing the file.

**tidy_data.txt** is an independent tidy data set with the average of each variable for each activity and each subject.

