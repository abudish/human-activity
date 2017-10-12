CodeBook for '03-Getting and Cleaning Data' course project from Coursera Data Science Specialization (Johns Hopkins University)
================
Andrey Budish
Wednesday, October 11, 2017

-   [1. Project goal](#project-goal)
-   [2. Initial Dataset Description](#initial-dataset-description)
-   [3. Initial dataset features (variables)](#initial-dataset-features-variables)
-   [4. Data proccessing to make tidy dataset](#data-proccessing-to-make-tidy-dataset)
-   [5. Tidy data description](#tidy-data-description)

### 1. Project goal

The purpose of this project is to demonstrate student's ability to collect, work with, and clean a data set. The result is a tidy dataset that follows [tidy data principles](http://vita.had.co.nz/papers/tidy-data.pdf).

### 2. Initial Dataset Description

**Abstract:** *Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.*

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

A video of the experiment including an example of the 6 recorded activities with one of the participants can be seen in the following link: [video](http://www.youtube.com/watch?v=XOEN9W05_4A)

**For each record in the dataset it is provided: **
+ Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
+ Triaxial Angular velocity from the gyroscope.
+ A 561-feature vector with time and frequency domain variables.
+ Its activity label.
+ An identifier of the subject who carried out the experiment.

**The dataset includes the following files: **

-   'README.txt'

-   'features\_info.txt': Shows information about the variables used on the feature vector.

-   'features.txt': List of all features.

-   'activity\_labels.txt': Links the class labels with their activity name.

-   'train/X\_train.txt': Training set.

-   'train/y\_train.txt': Training labels.

-   'test/X\_test.txt': Test set.

-   'test/y\_test.txt': Test labels.

**The following files are available for the train and test data. Their descriptions are equivalent. **

-   'train/subject\_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

-   'train/Inertial Signals/total\_acc\_x\_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total\_acc\_x\_train.txt' and 'total\_acc\_z\_train.txt' files for the Y and Z axis.

-   'train/Inertial Signals/body\_acc\_x\_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.

-   'train/Inertial Signals/body\_gyro\_x\_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

**Notes: **
- Features are normalized and bounded within \[-1,1\].
- Each feature vector is a row on the text file.

The dataset is taken from [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
The zip archive of the dataset can be downloaded using [this link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

### 3. Initial dataset features (variables)

**Feature Selection**
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for each pattern:
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are:

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values.
iqr(): Interquartile range
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal
kurtosis(): kurtosis of the frequency domain signal
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in ['features.txt'](https://github.com/abudish/human-activity/blob/master/data/UCI%20HAR%20Dataset/features.txt)

### 4. Data proccessing to make tidy dataset

To make this tidy dataset, `Run_analysis.R` script was created that does the next steps:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

To create a `tidy_data.txt` file, one should run `Run_analisis.R` - [link to the script](https://github.com/abudish/human-activity/blob/master/Run_analysis.R)
What this script does is described in detail in the [ReadMe.md](https://github.com/abudish/human-activity/blob/master/README.md)

### 5. Tidy data description

After running `Run_analisis.R`, a tidy dataset file is created `tidy_data.txt`.
The file can be read using this commands:

``` r
# Just copy paste this commands into the console and hit Enter
address <- "https://s3.amazonaws.com/coursera-uploads/peer-review/59282c066c1e4e06adbc8f39a16b599b/tidy_data.txt"
address <- sub("^https", "http", address)
require(dplyr)
tidy_url <- read.table(url(address), header = TRUE) %>% as.tbl()
```

Tidy dataset has next dimensions: 15480 observations and 4 variables.
Variables are: `subject, activity_type, sensor_measurment` and `average_value`.
**There are 30 subjects, performing 6 types of activites, with 86 different sensor measurement for each of the activity.**

**Each observation (row) is an average value of a specific sensor measurment, of a particular individual performing one of the activities.**

``` r
# First 10 rows of the tidy data
tidy_url
  # A tibble: 15,480 x 4
     subject      activity_type             sensor_measurement average_value
       <int>             <fctr>                         <fctr>         <dbl>
   1       1            WALKING time_body_accelerometer_mean_x     0.2773308
   2       1   WALKING_UPSTAIRS time_body_accelerometer_mean_x     0.2554617
   3       1 WALKING_DOWNSTAIRS time_body_accelerometer_mean_x     0.2891883
   4       1            SITTING time_body_accelerometer_mean_x     0.2612376
   5       1           STANDING time_body_accelerometer_mean_x     0.2789176
   6       1             LAYING time_body_accelerometer_mean_x     0.2215982
   7       2            WALKING time_body_accelerometer_mean_x     0.2764266
   8       2   WALKING_UPSTAIRS time_body_accelerometer_mean_x     0.2471648
   9       2 WALKING_DOWNSTAIRS time_body_accelerometer_mean_x     0.2776153
  10       2            SITTING time_body_accelerometer_mean_x     0.2770874
  # ... with 15,470 more rows

# Unique subjects
tidy_url$subject %>% unique()
 [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30

# Unique activities
tidy_url$activity_type %>% unique()
 [1] WALKING            WALKING_UPSTAIRS   WALKING_DOWNSTAIRS SITTING            STANDING           LAYING            
 Levels: LAYING SITTING STANDING WALKING WALKING_DOWNSTAIRS WALKING_UPSTAIRS
 
# Unique sensor measurements(renamed for readability)
tidy_url$sensor_measurement %>% unique()
   [1] time_body_accelerometer_mean_x                       time_body_accelerometer_mean_y                       time_body_accelerometer_mean_z                      
   [4] time_gravity_accelerometer_mean_x                    time_gravity_accelerometer_mean_y                    time_gravity_accelerometer_mean_z                   
   [7] time_body_accelerometer_jerk_mean_x                  time_body_accelerometer_jerk_mean_y                  time_body_accelerometer_jerk_mean_z                 
  [10] time_body_gyroscope_mean_x                           time_body_gyroscope_mean_y                           time_body_gyroscope_mean_z                          
  [13] time_body_gyroscope_jerk_mean_x                      time_body_gyroscope_jerk_mean_y                      time_body_gyroscope_jerk_mean_z                     
  [16] time_body_accelerometer_magnitude_mean               time_gravity_accelerometer_magnitude_mean            time_body_accelerometer_jerk_magnitude_mean         
  [19] time_body_gyroscope_magnitude_mean                   time_body_gyroscope_jerk_magnitude_mean              frequency_body_accelerometer_mean_x                 
  [22] frequency_body_accelerometer_mean_y                  frequency_body_accelerometer_mean_z                  frequency_body_accelerometer_meanfreq_x             
  [25] frequency_body_accelerometer_meanfreq_y              frequency_body_accelerometer_meanfreq_z              frequency_body_accelerometer_jerk_mean_x            
  [28] frequency_body_accelerometer_jerk_mean_y             frequency_body_accelerometer_jerk_mean_z             frequency_body_accelerometer_jerk_meanfreq_x        
  [31] frequency_body_accelerometer_jerk_meanfreq_y         frequency_body_accelerometer_jerk_meanfreq_z         frequency_body_gyroscope_mean_x                     
  [34] frequency_body_gyroscope_mean_y                      frequency_body_gyroscope_mean_z                      frequency_body_gyroscope_meanfreq_x                 
  [37] frequency_body_gyroscope_meanfreq_y                  frequency_body_gyroscope_meanfreq_z                  frequency_body_accelerometer_magnitude_mean         
  [40] frequency_body_accelerometer_magnitude_meanfreq      frequency_body_accelerometer_jerk_magnitude_mean     frequency_body_accelerometer_jerk_magnitude_meanfreq
  [43] frequency_body_gyroscope_magnitude_mean              frequency_body_gyroscope_magnitude_meanfreq          frequency_body_gyroscope_jerk_magnitude_mean        
  [46] frequency_body_gyroscope_jerk_magnitude_meanfreq     angle_time_body_accelerometer_mean_gravity           angle_time_body_accelerometer_jerkmean_gravitymean  
  [49] angle_time_body_gyroscope_mean_gravitymean           angle_time_body_gyroscope_jerkmean_gravitymean       angle_x_gravitymean                                 
  [52] angle_y_gravitymean                                  angle_z_gravitymean                                  time_body_accelerometer_std_x                       
  [55] time_body_accelerometer_std_y                        time_body_accelerometer_std_z                        time_gravity_accelerometer_std_x                    
  [58] time_gravity_accelerometer_std_y                     time_gravity_accelerometer_std_z                     time_body_accelerometer_jerk_std_x                  
  [61] time_body_accelerometer_jerk_std_y                   time_body_accelerometer_jerk_std_z                   time_body_gyroscope_std_x                           
  [64] time_body_gyroscope_std_y                            time_body_gyroscope_std_z                            time_body_gyroscope_jerk_std_x                      
  [67] time_body_gyroscope_jerk_std_y                       time_body_gyroscope_jerk_std_z                       time_body_accelerometer_magnitude_std               
  [70] time_gravity_accelerometer_magnitude_std             time_body_accelerometer_jerk_magnitude_std           time_body_gyroscope_magnitude_std                   
  [73] time_body_gyroscope_jerk_magnitude_std               frequency_body_accelerometer_std_x                   frequency_body_accelerometer_std_y                  
  [76] frequency_body_accelerometer_std_z                   frequency_body_accelerometer_jerk_std_x              frequency_body_accelerometer_jerk_std_y             
  [79] frequency_body_accelerometer_jerk_std_z              frequency_body_gyroscope_std_x                       frequency_body_gyroscope_std_y                      
  [82] frequency_body_gyroscope_std_z                       frequency_body_accelerometer_magnitude_std           frequency_body_accelerometer_jerk_magnitude_std     
  [85] frequency_body_gyroscope_magnitude_std               frequency_body_gyroscope_jerk_magnitude_std         
  86 Levels: angle_time_body_accelerometer_jerkmean_gravitymean angle_time_body_accelerometer_mean_gravity ... time_gravity_accelerometer_std_z
```
