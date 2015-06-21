
# load lybraries
library("memisc") 
library("dplyr") 
library("psych") 
library("lmtest") 
library("sjPlot")
library("sgof")
library("ggplot2") 
library("foreign") 
library("car")
library("hexbin")
library("rlms") 
library("reshape2")
library("pander")

#1.Merges the training and the test sets to create one data set. =====================
# first of all load both of data sets

setwd("G:/32 КУРСЫ/08 Getting and Cleaning Data/Course Project/UCI HAR Dataset")

#load features description
features <- read.table("features.txt", header=FALSE)

# load data
#training set --------------------------------------------------------------------
#load
setwd("G:/32 КУРСЫ/08 Getting and Cleaning Data/Course Project/UCI HAR Dataset/train")

y_train <- read.table("y_train.txt", header=FALSE)
subject_train <- read.table("subject_train.txt", header=FALSE)
X_train  <- read.table("X_train.txt", header=FALSE)

# load test set -------------------------------------------------------------------
setwd("G:/32 КУРСЫ/08 Getting and Cleaning Data/Course Project/UCI HAR Dataset/test")
y_test <- read.table(file ="y_test.txt", header = FALSE)
subject_test  <- read.table(file ="subject_test.txt", header = FALSE)
X_test   <- read.table(file ="X_test.txt", header = FALSE)


# cleaning data set ======================================================================
# for train set -------------------------------------------------------------------------
X_data <- rbind(X_train, X_test)

X_subject <- rbind(subject_train, subject_test)

#add subject for each row from separate table - subject_train
X_data <- cbind(X_data, X_subject)
#X_train$subject <- subject_train

#add activity for each row from separate table - subject_train
X_activity <- rbind(y_train, y_test)
X_data <- cbind(X_data, X_activity)
#X_train$activity <- y_train$V1

m <- data.frame(rbind(c(0, "subject"), c(0, "activity"))) 
names(m) <- c("V1", "V2")
features <- rbind(features, m)
#labeling all column in data set
#X_names <- make.names(t(features$V2), unique = TRUE)
X_names <- t(features$V2)

#recoding duplicate names
#names(X_train) <- features
names(X_data) <- X_names


# let free memory 
subject_train <- c()
y_train <- c()
X_activity <- c()
X_subject <- c()
X_test <- c()
X_train <- c()
m <- c()
subject_test <- c()
y_test <- c()
X_names <- c()


#question 2 ------------------------------------------------------------------------
# 2.Extracts only the measurements on the mean and standard deviation for each measurement. 

X_to_extract <- grep("mean|std", features$V2)
X_to_extract <- c(c(562, 563), X_to_extract)
X_data2 <- X_data[X_to_extract]


#question 3 --------------------------------------------------------------------------
#3.Uses descriptive activity names to name the activities in the data set
#loading activity description
setwd("G:/32 КУРСЫ/08 Getting and Cleaning Data/Course Project/UCI HAR Dataset")
activity_labels <- read.table("activity_labels.txt", header=FALSE)

#creating temporary vector
X_data2$act2 <- X_data2$activity
#inserting data
X_data2$activity <- activity_labels$V2[X_data2$act2]
#removing temporary vector
X_data2 <- X_data2[-which(names(X_data2)=="act2")]

#question 4 --------------------------------------------------------------------------
#4.Appropriately labels the data set with descriptive variable names
#alreay made on Step 1

#question 5 --------------------------------------------------------------------------
#5.From the data set in step 4, creates a second, independent tidy data set with the average of each 
#variable for each activity and each subject.

#create new matrix for mean values
#starts from labeling - getting from main data set
a_labels <- names(X_data2)
for (i in 3:dim (X_data2)[2]) {
  a_labels[i] <- paste0(a_labels[i], ".setmean")  
}
#creating result matrix
X_data_mean <- matrix(ncol = dim (X_data2)[2])
X_data_mean <- data.frame(X_data_mean)
names(X_data_mean) <- a_labels
#create clear data set for next circle
date_clear <- X_data_mean
#setup of resul matrix
X_data_mean <- na.omit(X_data_mean)

#resul circle for mean of each column for each subject and activity
for (selected_subject in 1:30) {
    for (selected_activity in 1:6) {
      #setting up filter's data
      new_line <- date_clear
      new_line[1] <- selected_subject
      new_line[2] <- activity_labels$V2[selected_activity]
      #filtering full data set
      y <- filter(.data =X_data2, subject==selected_subject, activity==activity_labels$V2[selected_activity])
      #calculating mean
      for (j in 3:dim (y)[2]) {
          new_line[j] <- mean(y[[j]])
      }
      #combining with full result matrix
      X_data_mean <- rbind(X_data_mean, new_line)
    }
}

setwd("G:/32 КУРСЫ/08 Getting and Cleaning Data/Course Project")
# write a result to external file
write.table(file ="X_data_mean.txt", x = X_data_mean,  row.name=FALSE)




