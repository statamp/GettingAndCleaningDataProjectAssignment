Getting and Cleaning Data (Coursera course in data science track)
-----------------------------------------------------------------

This repository is part of Coursera course Getting and Cleaning Data.
It fulfils the assignment for week 3.

Use the accompanying script run_analysis.R to generate two files,
UCIHARActivityTidy.csv and UCIHARSubjectTidy.csv. These contain a subset of the
UCI HAR dataset, with only the Mean and StdDev variables. The variables are
described in CodeBook.md.

This is the [original data](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones )

To run this script, source into R: source("run_analysis.R")

Steps taken to transform the data into a tidy subset were as follows.
These are the steps taken in run_analysis.R

1. Merge the data in the test and train datasets into one dataset. 
2. Extract variables that contained the words "mean()" or "std()". 
3. Add descriptive activity names, by substituting the activity names for their numbers 
4. Add more descriptive variable names: 
     * replace t[Variable Name] with Time[Variable Name] 
     * replace f[Variable Name] with Frequency[Variable Name] 
     * replace Acc with Accelerometer 
     * make variable names suitable to be used as R symbols (eg remove "-") and then remove '.', concatenating the parts of the name with capitalized first letters for each word
5. Output this subset of the dataset as csv file UCIHARSubset.csv
6. Find the mean of each variable, when grouped by activity and grouped by Subject. Output these in two tidy datasets named UCIHARSubjectTidy.csv and UCIHARActivityTidy.csv.
     
