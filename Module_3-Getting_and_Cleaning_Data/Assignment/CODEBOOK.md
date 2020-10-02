CODE BOOK for the ‘tidydataset’ data table
================
Mark Wan
10/2/2020

## **Overview**

This CODEBOOK provides information on ‘tidydataset’:  
1\. Variable names,  
2\. Variable class,  
3\. Variable min,  
4\. Variable max,  
5\. Feature selection details.

| Index | Variable                        | Class     |    Min |    Max |
| ----: | :------------------------------ | :-------- | -----: | -----: |
|     1 | y\_descriptive                  | character |    NaN |    NaN |
|     2 | subject                         | integer   |   1.00 |  30.00 |
|     3 | tBodyAcc.mean…X                 | numeric   |   0.24 |   0.28 |
|     4 | tBodyAcc.mean…Y                 | numeric   | \-0.03 | \-0.01 |
|     5 | tBodyAcc.mean…Z                 | numeric   | \-0.12 | \-0.10 |
|     6 | tBodyAcc.std…X                  | numeric   | \-1.00 |   0.08 |
|     7 | tBodyAcc.std…Y                  | numeric   | \-0.98 |   0.22 |
|     8 | tBodyAcc.std…Z                  | numeric   | \-0.98 | \-0.09 |
|     9 | tGravityAcc.mean…X              | numeric   |   0.44 |   0.91 |
|    10 | tGravityAcc.mean…Y              | numeric   | \-0.35 |   0.20 |
|    11 | tGravityAcc.mean…Z              | numeric   | \-0.28 |   0.27 |
|    12 | tGravityAcc.std…X               | numeric   | \-0.99 | \-0.94 |
|    13 | tGravityAcc.std…Y               | numeric   | \-0.98 | \-0.90 |
|    14 | tGravityAcc.std…Z               | numeric   | \-0.98 | \-0.88 |
|    15 | tBodyAccJerk.mean…X             | numeric   |   0.07 |   0.11 |
|    16 | tBodyAccJerk.mean…Y             | numeric   |   0.00 |   0.03 |
|    17 | tBodyAccJerk.mean…Z             | numeric   | \-0.03 |   0.00 |
|    18 | tBodyAccJerk.std…X              | numeric   | \-0.99 |   0.03 |
|    19 | tBodyAccJerk.std…Y              | numeric   | \-0.99 | \-0.03 |
|    20 | tBodyAccJerk.std…Z              | numeric   | \-0.99 | \-0.44 |
|    21 | tBodyGyro.mean…X                | numeric   | \-0.07 |   0.12 |
|    22 | tBodyGyro.mean…Y                | numeric   | \-0.17 | \-0.05 |
|    23 | tBodyGyro.mean…Z                | numeric   |   0.00 |   0.11 |
|    24 | tBodyGyro.std…X                 | numeric   | \-0.99 | \-0.38 |
|    25 | tBodyGyro.std…Y                 | numeric   | \-0.99 | \-0.40 |
|    26 | tBodyGyro.std…Z                 | numeric   | \-0.99 | \-0.13 |
|    27 | tBodyGyroJerk.mean…X            | numeric   | \-0.12 | \-0.07 |
|    28 | tBodyGyroJerk.mean…Y            | numeric   | \-0.06 | \-0.04 |
|    29 | tBodyGyroJerk.mean…Z            | numeric   | \-0.07 | \-0.05 |
|    30 | tBodyGyroJerk.std…X             | numeric   | \-0.99 | \-0.39 |
|    31 | tBodyGyroJerk.std…Y             | numeric   | \-0.99 | \-0.55 |
|    32 | tBodyGyroJerk.std…Z             | numeric   | \-0.99 | \-0.48 |
|    33 | tBodyAccMag.mean..              | numeric   | \-0.99 |   0.19 |
|    34 | tBodyAccMag.std..               | numeric   | \-0.99 | \-0.13 |
|    35 | tGravityAccMag.mean..           | numeric   | \-0.99 |   0.19 |
|    36 | tGravityAccMag.std..            | numeric   | \-0.99 | \-0.13 |
|    37 | tBodyAccJerkMag.mean..          | numeric   | \-0.99 | \-0.07 |
|    38 | tBodyAccJerkMag.std..           | numeric   | \-0.99 | \-0.04 |
|    39 | tBodyGyroMag.mean..             | numeric   | \-0.98 | \-0.14 |
|    40 | tBodyGyroMag.std..              | numeric   | \-0.98 | \-0.22 |
|    41 | tBodyGyroJerkMag.mean..         | numeric   | \-0.99 | \-0.54 |
|    42 | tBodyGyroJerkMag.std..          | numeric   | \-0.99 | \-0.57 |
|    43 | fBodyAcc.mean…X                 | numeric   | \-0.99 | \-0.04 |
|    44 | fBodyAcc.mean…Y                 | numeric   | \-0.98 |   0.12 |
|    45 | fBodyAcc.mean…Z                 | numeric   | \-0.99 | \-0.20 |
|    46 | fBodyAcc.std…X                  | numeric   | \-1.00 |   0.12 |
|    47 | fBodyAcc.std…Y                  | numeric   | \-0.98 |   0.19 |
|    48 | fBodyAcc.std…Z                  | numeric   | \-0.98 | \-0.11 |
|    49 | fBodyAcc.meanFreq…X             | numeric   | \-0.32 | \-0.02 |
|    50 | fBodyAcc.meanFreq…Y             | numeric   | \-0.15 |   0.13 |
|    51 | fBodyAcc.meanFreq…Z             | numeric   | \-0.11 |   0.29 |
|    52 | fBodyAccJerk.mean…X             | numeric   | \-0.99 |   0.01 |
|    53 | fBodyAccJerk.mean…Y             | numeric   | \-0.99 | \-0.04 |
|    54 | fBodyAccJerk.mean…Z             | numeric   | \-0.99 | \-0.39 |
|    55 | fBodyAccJerk.std…X              | numeric   | \-0.99 | \-0.04 |
|    56 | fBodyAccJerk.std…Y              | numeric   | \-0.99 | \-0.08 |
|    57 | fBodyAccJerk.std…Z              | numeric   | \-0.99 | \-0.50 |
|    58 | fBodyAccJerk.meanFreq…X         | numeric   | \-0.22 |   0.26 |
|    59 | fBodyAccJerk.meanFreq…Y         | numeric   | \-0.35 |   0.11 |
|    60 | fBodyAccJerk.meanFreq…Z         | numeric   | \-0.29 |   0.13 |
|    61 | fBodyGyro.mean…X                | numeric   | \-0.99 | \-0.24 |
|    62 | fBodyGyro.mean…Y                | numeric   | \-0.99 | \-0.48 |
|    63 | fBodyGyro.mean…Z                | numeric   | \-0.99 | \-0.16 |
|    64 | fBodyGyro.std…X                 | numeric   | \-0.99 | \-0.42 |
|    65 | fBodyGyro.std…Y                 | numeric   | \-0.98 | \-0.35 |
|    66 | fBodyGyro.std…Z                 | numeric   | \-0.99 | \-0.21 |
|    67 | fBodyGyro.meanFreq…X            | numeric   | \-0.24 |   0.03 |
|    68 | fBodyGyro.meanFreq…Y            | numeric   | \-0.38 |   0.07 |
|    69 | fBodyGyro.meanFreq…Z            | numeric   | \-0.21 |   0.10 |
|    70 | fBodyAccMag.mean..              | numeric   | \-0.99 | \-0.03 |
|    71 | fBodyAccMag.std..               | numeric   | \-0.99 | \-0.32 |
|    72 | fBodyAccMag.meanFreq..          | numeric   | \-0.06 |   0.32 |
|    73 | fBodyBodyAccJerkMag.mean..      | numeric   | \-0.99 |   0.00 |
|    74 | fBodyBodyAccJerkMag.std..       | numeric   | \-0.99 | \-0.10 |
|    75 | fBodyBodyAccJerkMag.meanFreq..  | numeric   |   0.08 |   0.43 |
|    76 | fBodyBodyGyroMag.mean..         | numeric   | \-0.99 | \-0.35 |
|    77 | fBodyBodyGyroMag.std..          | numeric   | \-0.98 | \-0.27 |
|    78 | fBodyBodyGyroMag.meanFreq..     | numeric   | \-0.22 |   0.15 |
|    79 | fBodyBodyGyroJerkMag.mean..     | numeric   | \-0.99 | \-0.58 |
|    80 | fBodyBodyGyroJerkMag.std..      | numeric   | \-0.99 | \-0.59 |
|    81 | fBodyBodyGyroJerkMag.meanFreq.. | numeric   | \-0.01 |   0.37 |

## **Feature Selection**

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
    
    The complete list of variables of each feature vector is available in 'features.txt'
