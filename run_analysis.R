#
# Script to tidy the unzipped data from rawdata.zip
# unzipped files are expected to be in folder `./data/UCI HAR Dataset/`
#
library(readr)
library(stringr)
library(dplyr)

# extract feature from features.txt
# and transform those into descriptive variable names
features <- read.table("./data/UCI HAR Dataset/features.txt", quote="\"", comment.char="")
features$rep <- str_replace_all(features$V2, pattern="\\-", replacement="_")
features$rep <- str_replace(features$rep, pattern="tBody", replacement="time_of_body_")
features$rep <- str_replace(features$rep, pattern="^f", replacement="freq_of_")
features$rep <- str_replace_all(features$rep, pattern="\\(\\)", replacement="")
features$rep <- str_replace(features$rep, pattern="Body", replacement="body_")
features$rep <- str_replace(features$rep, pattern="Acc", replacement="acceleration_")
features$rep <- str_replace(features$rep, pattern="tGravity", replacement="time_of_gravity_")
features$rep <- str_replace(features$rep, pattern="[jJ]erk", replacement="_jerk_")
features$rep <- str_replace(features$rep, pattern="[mM]ag", replacement="_mag_")
features$rep <- str_replace(features$rep, pattern="angle\\(", replacement="angle_between_")
features$rep <- str_replace(features$rep, pattern=",", replacement="_and_")
features$rep <- str_replace_all(features$rep, pattern="__", replacement="_")
features$rep <- str_replace_all(features$rep, pattern="\\)", replacement="")
features$rep <- tolower(features$rep)

features = tolower(features$rep)

# select features to retain in final/merged dataset
mean_std_features = grep(".(mean|std).", features)
features_retain = features[ mean_std_features ]

# extract activities from activity_labels.txt
# and make readable
activities <- read.table("./data/UCI HAR Dataset/activity_labels.txt", quote="\"", comment.char="")
activities$V2 <- tolower(activities$V2)
activities$V2 <- str_replace(activities$V2, pattern="_", replacement=" ")
activities <- activities$V2

#
# groom_datatset() 
#   1. ingest the data
#   2. assign descriptive variable names
#   3. drop excess variables
#   4. merge the activities and subjects
#
# parameters:
#   path_to_X:        filename of X values
#   path_to_Y:        filename of Y values (=activities)
#   path_to_subjects: filename of subjects
#
# returns:
#   data.frame
#
groom_datatset <- function(path_to_X,path_to_Y,path_to_subjects){
    X_data = read.table(path_to_X, quote="\"", comment.char="")
    
    # assign column names
    names(X_data) = features
    #remove excess columns
    df_tidy <- X_data[, features_retain]
    
    # merge subjects
    subjects <- read.table(path_to_subjects, quote="\"", comment.char="")
    subject <- subjects$V1
    df_tidy <- cbind(subject, df_tidy)
    
    # merge activities
    Y_data = read.table(path_to_Y, quote="\"", comment.char="")
    activity = activities[ Y_data$V1 ]
    df_tidy <- cbind(activity, df_tidy)
    
    df_tidy
}

# import test and train data and use groom_datatset() to transform into tidy datasets
df_test  <- groom_datatset("./data/UCI HAR Dataset/test/X_test.txt","./data/UCI HAR Dataset/test/Y_test.txt","./data/UCI HAR Dataset/test/subject_test.txt")
df_train <- groom_datatset("./data/UCI HAR Dataset/train/X_train.txt","./data/UCI HAR Dataset/train/Y_train.txt","./data/UCI HAR Dataset/train/subject_train.txt")

# merge df_test & df_train into 1 dataframe
df_merged = rbind(df_test,df_train)

# create a summary by calculating the mean of all variables, grouped by subject & activity
smry <- df_merged %>% group_by(subject,activity ) %>% summarise(across(everything(), list(mean))) %>% arrange(subject,activity)

# write merged and summary dataframes to disk in CSV format
write_csv(df_merged,'./data/analysis.csv')
write_csv(smry,'./data/summary.csv')
