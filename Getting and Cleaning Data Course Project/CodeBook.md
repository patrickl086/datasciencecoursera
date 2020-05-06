Data Source
===========

The data was downloaded from
<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

Full description of the data can be found here:
<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

Data Description
================

The consists of sensor signals from a group of 30 volunteers (ages
between 19-48) while performing six activities (WALKING,
WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING)
wearing a smartphone (Samsung Galaxy S II) on the waist.

Data Processing
===============

For the purposes of the assignement the following steps were followed to
produce the "tidy\_data' table:

1.  Merged the training and the test sets to create one data set.

2.  Extracted only the measurements on the mean and standard deviation
    for each measurement.

3.  Updated activity names with those provided in the activity\_labels
    file as follows: 1 WALKING 2 WALKING\_UPSTAIRS 3 WALKING\_DOWNSTAIRS
    4 SITTING 5 STANDING 6 LAYING

4.  Updated variable names to make them more descriptive by removing
    abreviations, capitalizing the first letter on each word and
    removing unnecesary puntuation marks.

Updated variable names: 1 "TimeBodyAccelerometerMeanX"  
2 "TimeBodyAccelerometerMeanY"  
3 "TimeBodyAccelerometerMeanZ"  
4 "TimeGravityAccelerometerMeanX"  
5 "TimeGravityAccelerometerMeanY"  
6 "TimeGravityAccelerometerMeanZ"  
7 "TimeBodyAccelerometerJerkMeanX"  
8 "TimeBodyAccelerometerJerkMeanY"  
9 "TimeBodyAccelerometerJerkMeanZ"  
10 "TimeBodyGyroscopeMeanX"  
11 "TimeBodyGyroscopeMeanY"  
12 "TimeBodyGyroscopeMeanZ"  
13 "TimeBodyGyroscopeJerkMeanX"  
14 "TimeBodyGyroscopeJerkMeanY"  
15 "TimeBodyGyroscopeJerkMeanZ"  
16 "TimeBodyAccelerometerMagnitudeMean"  
17 "TimeGravityAccelerometerMagnitudeMean"  
18 "TimeBodyAccelerometerJerkMagnitudeMean"  
19 "TimeBodyGyroscopeMagnitudeMean"  
20 "TimeBodyGyroscopeJerkMagnitudeMean"  
21 "FrequencyBodyAccelerometerMeanX"  
22 "FrequencyBodyAccelerometerMeanY"  
23 "FrequencyBodyAccelerometerMeanZ"  
24 "FrequencyBodyAccelerometerMeanFreqX"  
25 "FrequencyBodyAccelerometerMeanFreqY"  
26 "FrequencyBodyAccelerometerMeanFreqZ"  
27 "FrequencyBodyAccelerometerJerkMeanX"  
28 "FrequencyBodyAccelerometerJerkMeanY"  
29 "FrequencyBodyAccelerometerJerkMeanZ"  
30 "FrequencyBodyAccelerometerJerkMeanFreqX"  
31 "FrequencyBodyAccelerometerJerkMeanFreqY"  
32 "FrequencyBodyAccelerometerJerkMeanFreqZ"  
33 "FrequencyBodyGyroscopeMeanX"  
34 "FrequencyBodyGyroscopeMeanY"  
35 "FrequencyBodyGyroscopeMeanZ"  
36 "FrequencyBodyGyroscopeMeanFreqX"  
37 "FrequencyBodyGyroscopeMeanFreqY"  
38 "FrequencyBodyGyroscopeMeanFreqZ"  
39 "FrequencyBodyAccelerometerMagnitudeMean"  
40 "FrequencyBodyAccelerometerMagnitudeMeanFreq"  
41 "FrequencyBodyAccelerometerJerkMagnitudeMean"  
42 "FrequencyBodyAccelerometerJerkMagnitudeMeanFreq" 43
"FrequencyBodyGyroscopeMagnitudeMean"  
44 "FrequencyBodyGyroscopeMagnitudeMeanFreq"  
45 "FrequencyBodyGyroscopeJerkMagnitudeMean"  
46 "FrequencyBodyGyroscopeJerkMagnitudeMeanFreq"  
47 "AngletBodyAccelerometerMeanGravity"  
48 "AngletBodyAccelerometerJerkMeanGravityMean"  
49 "AngletBodyGyroscopeMeanGravityMean"  
50 "AngletBodyGyroscopeJerkMeanGravityMean"  
51 "AngleXGravityMean"  
52 "AngleYGravityMean"  
53 "AngleZGravityMean"  
54 "TimeBodyAccelerometerSTDX"  
55 "TimeBodyAccelerometerSTDY"  
56 "TimeBodyAccelerometerSTDZ"  
57 "TimeGravityAccelerometerSTDX"  
58 "TimeGravityAccelerometerSTDY"  
59 "TimeGravityAccelerometerSTDZ"  
60 "TimeBodyAccelerometerJerkSTDX"  
61 "TimeBodyAccelerometerJerkSTDY"  
62 "TimeBodyAccelerometerJerkSTDZ"  
63 "TimeBodyGyroscopeSTDX"  
64 "TimeBodyGyroscopeSTDY"  
65 "TimeBodyGyroscopeSTDZ"  
66 "TimeBodyGyroscopeJerkSTDX"  
67 "TimeBodyGyroscopeJerkSTDY"  
68 "TimeBodyGyroscopeJerkSTDZ"  
69 "TimeBodyAccelerometerMagnitudeSTD"  
70 "TimeGravityAccelerometerMagnitudeSTD"  
71 "TimeBodyAccelerometerJerkMagnitudeSTD"  
72 "TimeBodyGyroscopeMagnitudeSTD"  
73 "TimeBodyGyroscopeJerkMagnitudeSTD"  
74 "FrequencyBodyAccelerometerSTDX"  
75 "FrequencyBodyAccelerometerSTDY"  
76 "FrequencyBodyAccelerometerSTDZ"  
77 "FrequencyBodyAccelerometerJerkSTDX"  
78 "FrequencyBodyAccelerometerJerkSTDY"  
79 "FrequencyBodyAccelerometerJerkSTDZ"  
80 "FrequencyBodyGyroscopeSTDX"  
81 "FrequencyBodyGyroscopeSTDY"  
82 "FrequencyBodyGyroscopeSTDZ"  
83 "FrequencyBodyAccelerometerMagnitudeSTD"  
84 "FrequencyBodyAccelerometerJerkMagnitudeSTD"  
85 "FrequencyBodyGyroscopeMagnitudeSTD"  
86 "FrequencyBodyGyroscopeJerkMagnitudeSTD"  
87 "activity"  
88 "subject"

5.  Grouped remaining variables by activity and subject and sumarized by
    mean. Final "Tidy Data" saved as "tidy\_data.txt"
