## step 1
# read test and training data sets
test.labels <- read.table("test/y_test.txt", col.names="label")
test.subjects <- read.table("test/subject_test.txt", col.names="subject")
test.data <- read.table("test/X_test.txt")
train.labels <- read.table("train/y_train.txt", col.names="label")
train.subjects <- read.table("train/subject_train.txt", col.names="subject")
train.data <- read.table("train/X_train.txt")

# merge the test and training data sets
data <- rbind(cbind(test.subjects, test.labels, test.data),
              cbind(train.subjects, train.labels, train.data))

## step 2
# read in the features
features <- read.table("features.txt", strip.white=TRUE, stringsAsFactors=FALSE)
# extract only the measurements on the mean and standard deviation 
features.mean.std <- features[grep("mean\\(\\)|std\\(\\)", features$V2), ]

# select only the means and standard deviations from data
data.mean.std <- data[, c(1, 2, features.mean.std$V1+2)]

## step 3
# read in labels 
labels <- read.table("activity_labels.txt", stringsAsFactors=FALSE)
# replace labels in data with label names
data.mean.std$label <- labels[data.mean.std$label, 2]

## step 4
# Make a list of the current column names and feature names
new.colnames <- c("subject", "label", features.mean.std$V2)
# tidy that list
new.colnames <- tolower(gsub("[^[:alpha:]]", "", new.colnames))
colnames(data.mean.std) <- new.colnames

## step 5
# average of each variable for each activity and each subject
aggr.data <- aggregate(data.mean.std[, 3:ncol(data.mean.std)],
                       by=list(subject = data.mean.std$subject, 
                               label = data.mean.std$label),
                       mean)

# write the data for course upload
write.table(format(aggr.data, scientific=T), "tidy2.txt",
            row.names=F, col.names=F, quote=2)