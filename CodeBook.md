---
title: "CodeBook"
author: "ABRAMOV Andrey"
date: "Sunday, June 21, 2015"
output: html_document
keep_md: yes
---


## Project Description

The purpose of this project is to demonstrate  ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. The next data will be submitted: 
  1) a tidy data set as described below, 
  2) a link to a Github repository with your script for performing the analysis, and 
  3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md (this file). 

To reach the mentioned goal wearable computing data has been used. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## Project Data Description

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.
 

##Study design and data processing

Data processing follow the next Steps:

 - Merges the training and the test sets to create one data set.
 - Extracts only the measurements on the mean and standard deviation for each measurement. 
 - Uses descriptive activity names to name the activities in the data set
 - Appropriately labels the data set with descriptive variable names. 
 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Step 4 and Step 1 has been combined at Step 1 at the result file.

###Collection of the raw data

Incoming data for analysis has been downloaded from the next url:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

###Guide to create the tidy data file

Creating process follow the next global Steps:

 - download and unpack  all incoming data by mentioned link above
 - loading tables into memory
 - combining two global data set with training and test data into one set. 
 - labeling all columns 
 - adding activity and subject descritpion column
 - selecting column containing only mean and standard deviation data from the combined data set
 - selecting each subject and activity for calculation of the mean for each column
 - safe result to external file


##Description of the variables in the X_data_mean.txt file


Short description of the variable describes in the 'X_data_mean.txt' could be found in 'Variables_description.xlsx'.


##Sources

Incoming data for analysis has been downloaded from the next url:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Analysis R-file can be accessed by:
https://github.com/ANDREY700/Getting-and-Cleaning-Data-Course-Project
