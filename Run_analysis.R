# 1. Loading required libraries -----
library(curl)
library(readr)
library(dplyr)
library(stringr)


# Recording current date
dateDownloaded <- base::date()


# 2. Downoloading data -----

dlMethod <- "curl" # sets default for OSX / Linux
if(substr(Sys.getenv("OS"),1,7) == "Windows") dlMethod <- "wininet"
if(!file.exists("activity.zip")) {
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
                "activity.zip",  # stores file in R working directory
                method=dlMethod # use OS-appropriate method
                )
}

rm(dlMethod)


# 3. Unpacking data from a zip archive -----
if(!dir.exists("data")) {
  unzip("activity.zip", exdir = "data")
}


# 4. Read datasets -----
X_train <- read_table("data/UCI HAR Dataset/train/X_train.txt", col_names = FALSE)
y_train <- read_table("data/UCI HAR Dataset/train/y_train.txt", col_names = "label")
X_test <- read_table("data/UCI HAR Dataset/test/X_test.txt", col_names = FALSE)
y_test <- read_table("data/UCI HAR Dataset/test/y_test.txt", col_names = "label")


# 5. Merge datasets -----
# 5.1. Merge y dataset
y_data <- bind_rows(y_train, y_test)

# Rename columns in y dataset
act_labels <- read_table("data/UCI HAR Dataset/activity_labels.txt", 
                         col_names = c("label", "activity_type"))

# Make activity_type a factor variable with right levels, as in activity_labels.txt
act_labels$activity_type <- factor(act_labels$activity_type,
                                   levels = c(act_labels$activity_type))
# Add decrypted activity type by merging two data frames
y_data <- left_join(y_data, act_labels, by="label")

# drop label, column
y_data$label <- NULL

# 5.2. Merge X dataset
X_data <- bind_rows(X_train, X_test)

# Get column names - use read_table2, because of 
features <- read_table2("data/UCI HAR Dataset/features.txt", col_names = c("col_number", "col_name"))
column_names <- features$col_name
rm(features)

# Rename columns in X dataset
colnames(X_data) <- column_names

# 5.3. Merge X and y datasets
data <- bind_cols(X_data, y_data)


# 6. Adding subject variable to dataset ----

# Read subjects
subject_train <- read_table("data/UCI HAR Dataset/train/subject_train.txt", col_names = FALSE)
subject_test <- read_table("data/UCI HAR Dataset/test/subject_test.txt", col_names = FALSE)

# Combine train and test subject
subject <- bind_rows(subject_train, subject_test)

rm(subject_train)
rm(subject_test)

# Change subject to factor variable
subject <- subject$X1 %>% as.factor()

# Add subject column to the main dataset
data$subject <- subject


# 7. Extract only the measurements on the mean and standard deviation for each measurement ------

all_columns <- names(data)

# Find all mean columns
mns_index <- grepl("[Mm]ean", all_names)
mns_columns <- all_names[mns_index]

# Find all standard deviation columns
stds_index <- grepl("std", all_names)
stds_columns <- all_names[stds_index]

# Create a vector for all requiered columns
selected_columns <- c(mns_columns, stds_columns, "activity_type", "subject")

# Subset to get the final data set
data_final <- data[, selected_columns]


# 8. Create tidy dataset with the average of each variable for each activity and each subject ----
tidy_data <- aggregate(. ~ subject + activity_type, data = data_final, mean) %>% arrange(subject, activity_type)


# 9. Write tidy dataset to a file ----
write.table(tidy_data, file="tidy_data.txt", row.names = FALSE, quote = FALSE)


# 10. Code to read the tidy data file ----
tidy <- read_table2("tidy_data.txt")
tidy$subject <- factor(tidy$subject)
tidy$activity_type <- factor(tidy$activity_type)
