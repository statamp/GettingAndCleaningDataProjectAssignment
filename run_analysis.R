#setwd("~/Documents/workspace/datascitoolbox/GettingAndCleaningData/")

# function to convert first letter to upper case
toFirstLetterUpper <- function(x) {
    sapply(x, function(elem) {
        paste0(toupper(substring(elem, 1, 1)), substring(elem, 2))
    },
    USE.NAMES=FALSE)
}

# download data if not done already
if (!file.exists("data")) {
    filename <- "assignment3_data.zip"
    dir.create("data")
    f <- download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
                       paste0("data/", filename), method="curl")
    write(date(), "data/downloaded_data_date.txt")
    unzip(paste("data",filename, sep="/"), exdir="data")
}
# load data
activity_labels <- read.table("data/UCI HAR Dataset/activity_labels.txt")
features <- read.table("data/UCI HAR Dataset/features.txt",
                       stringsAsFactors=FALSE)
subject_test <- read.table("data/UCI HAR Dataset/test/subject_test.txt")
X_test <- read.table("data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("data/UCI HAR Dataset/test/y_test.txt")
subject_train <- read.table("data/UCI HAR Dataset/train/subject_train.txt")
X_train <- read.table("data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("data/UCI HAR Dataset/train/y_train.txt")

# merge data
subject <- rbind(subject_test, subject_train)
X <- rbind(X_test, X_train)
y <- rbind(y_test, y_train)

# extract mean measurements
extract_cols <- grepl("mean[()]{2}", features[, 2]) | 
    grepl("std[()]{2}", features[, 2])
X <- X[, extract_cols]

# add descriptive activity names
X <- cbind(X, Activity=activity_labels[y[, 1], 2])
# test round trip
#w = function(x) which(x == activity_labels[,2])
#r = sapply(X3$activity, w)
#all(y == r)

# label with descriptive variable names
# could compose functions here but R does not seem to have a builtin compose
# function so manually compose
f1 <- function(x) gsub("^t", "Time", x)
f2 <- function(x) gsub("^f", "Frequency", x)
f3 <- function(x) gsub("Acc", "Accelerometer", x)
f4 <- function(x) {
    sapply(toFirstLetterUpper(strsplit(x, ".", fixed=TRUE)), 
           paste0, collapse="")
}
raw.names <- make.names(features[, 2])
descriptive.names <- f4(f3(f2(f1(raw.names))))
descriptive.names <- c(descriptive.names[extract_cols], "Activity")

# output data
names(X) <- descriptive.names
write.csv(X, file="UCIHARSubset.csv", row.names=FALSE)

# output average for each activity and each subject
# get the mean
f <- function(x) {
    colMeans(x[, -match("Activity", names(x))])
}

# group by Subject
s <- split(X, subject)
li <- lapply(s, f)
r1 <- do.call("rbind", li)
names(r1) <- descriptive.names[-match("Activity", descriptive.names)]
# write row.names as extra column so i can add a variable name
r1 <- cbind(Subject=row.names(r1), r1)
write.csv(r1, file="UCIHARSubjectTidy.csv", row.names=FALSE)

# group by Activity
s <- split(X, X$Activity)
li <- lapply(s, f)
r2 <-do.call("rbind", li)
names(r2) <- descriptive.names[-match("Activity", names(x))]
# write row.names as extra column so i can add a variable name
r2 <- cbind(Activity=row.names(r2), r2)
write.csv(r2, file="UCIHARActivityTidy.csv", row.names=FALSE)


