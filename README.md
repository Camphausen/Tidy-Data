# Tidy-Data
First for step 1 the coad reads in the test and training sets, then it merges the tst and training data steps.
For step 2 the features are read in and then only the measurements on the mean and standard deviation are extracted and then selected.
For step 3 the labels are read in and the the labels are replaced with label names.
For step 4 a list of the current column names and features is made.
For step 5 the average of each variable for each activity and subject is made and the data is exported in a txt file named tidy.txt
Code Book:
read.table used to read in the test and train tables as well as features and labels.
rbind used to merge the data sets.
new.colnames is the name given to the list with the current column names and features.
tidy.txt is the name given to the output file.
