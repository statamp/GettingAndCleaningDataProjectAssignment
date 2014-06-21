Code Book for Project Assignment
================================

This code book has been edited from the original code book in the UCI HAR data.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals TimeAccelerometerXYZ and TimeGyroXYZ. These time domain signals (prefix 'Time' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (TimeBodyAccelerometerXYZ and TimeGravityAccelerometerXYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (TimeBodyAccelerometerJerkXYZ and TimeBodyGyroJerkXYZ). Also the magnitude of these threedimensional signals were calculated using the Euclidean norm (TimeBodyAccelerometerMag, TimeGravityAccelerometerMag, TimeBodyAccelerometerJerkMag, TimeBodyGyroMag, TimeBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing FrequencyBodyAccelerometerXYZ, FrequencyBodyAccelerometerJerkXYZ, FrequencyBodyGyroXYZ, FrequencyBodyAccelerometerJerkMag, FrequencyBodyGyroMag, FrequencyBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'XYZ' is used to denote 3axial signals in the X, Y and Z directions.

TimeBodyAccelerometerXYZ
TimeGravityAccelerometerXYZ
TimeBodyAccelerometerJerkXYZ
TimeBodyGyroXYZ
TimeBodyGyroJerkXYZ
TimeBodyAccelerometerMag
TimeGravityAccelerometerMag
TimeBodyAccelerometerJerkMag
TimeBodyGyroMag
TimeBodyGyroJerkMag
FrequencyBodyAccelerometerXYZ
FrequencyBodyAccelerometerJerkXYZ
FrequencyBodyGyroXYZ
FrequencyBodyAccelerometerMag
FrequencyBodyAccelerometerJerkMag
FrequencyBodyGyroMag
FrequencyBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

Mean: Mean value
Std: Standard deviation
