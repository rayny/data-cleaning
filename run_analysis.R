test <- read.table("test/X_test.txt", as.is = TRUE)
testSubject <- read.table("test/subject_test.txt", as.is = TRUE)
testActivity <- read.table("test/y_test.txt", as.is = TRUE)

training <- read.table("train/X_train.txt", as.is = TRUE)
trainSubject <- read.table("train/subject_train.txt", as.is = TRUE)
trainActivity <- read.table("train/y_train.txt", as.is = TRUE)

features <- read.table("features.txt", as.is = TRUE)
activityLabels <- read.table("activity_labels.txt", as.is = TRUE)

measurements <- rbind(test, training)
names(measurements) <- paste(features[[1]],"-", features[[2]], sep = "")

subjects <- rbind(testSubject, trainSubject)
activitys <- rbind(testActivity, trainActivity)

measurements$subject <- subjects[[1]]
measurements$activity <- activitys[[1]]

tidyDataset <-select(measurements, contains("mean()"), contains("std()"), subject, activity)

tidyDataset$activity <- as.factor(tidyDataset[["activity"]])
tidyDataset$activity <- mapvalues(tidyDataset$activity, from = activityLabels[[1]], to = activityLabels[[2]] )


column_names <- names(tidyDataset)

column_names<-gsub("-t",".Signal.",column_names)
column_names<-gsub("-f",".FastFourierTransform.",column_names)
column_names<-gsub("Body","BodyAcceleration.",column_names)
column_names<-gsub("Mag","EuclideanNorm.",column_names)
column_names<-gsub("Jerk","EuclideanNorm.",column_names)
column_names<-gsub("Acc","FromAccelerometer.",column_names)
column_names<-gsub("Gravity","GravityAcceleration.",column_names)
column_names<-gsub("Gyro","FromTheGyroscope.",column_names)
column_names<-gsub("Mag","EuclideanNorm.",column_names)
column_names<-gsub("mean()", "MeanValue.", column_names)
column_names<-gsub("std()", "StandardDeviation.", column_names)
column_names<-gsub("[-,\\(,\\)]","",column_names)

names(tidyDataset) <- column_names

