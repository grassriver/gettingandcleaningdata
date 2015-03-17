This file describes the variables, the data and work that I performed to clean up the data.

* testX: We read the "X_test.txt" and give it to variable "testX".
* trainX: We read the "X_train.txt" and give it to variable "trainX".
* names: We read the "features.txt" and give it to variable "names".
* mergedX: We combine testX and trainX and give it to variable "mergedX". mergedX is 10299 rows by 561 columns.
* We then name the mergedX by names.
* newMergedX: We select the columns whose names contained "mean()" and "std()" in mergedX. newMergedX is 10299 rows by 79 columns.
* subjectX: We read the "subject_test.txt" and give it to variable subjectX.
* subjectY: We read the "subject_train.txt" and give it to variable subjectY.
* mergedSubject: We combine subjectX and subjectY and give it to variable mergedSubject. It is 10299 rows by 1 column.
* testY: We read the "Y_test.txt" and give it to variable "testY".
* trainY: We read the "Y_train.txt" and give it to variable "trainY".
* mergedY: We combine testY and trainY and give it to variable "mergedY".
* We then use the for loop to replace the numbers in mergedY with descriptive activity names.
* We then name the mergedSubject column by "subject".
* We then name the mergedY column by "activities".
* merge: We merged "mergedSubject", "mergedY" and "newMergedX" and give it to variable "merge".
* activities: We create a matrix that contains "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING".
* means2: We create a 79 by 180 matrix with zeros.
* The for loops compute the means of each variable for each subject and each activity.
* subjectsandactivities: This variable in the for loop is a 180 rows by 2 columns matrix. The first column contains subject information and the second column contains the activity information.
* means3: It transposes "means2". "means3" is now a 180 rows by 79 columns matrix.
* tidy: We combine the "subjectandactivities" and "means3". Now the "tidy" variable is a 180 rows by 81 columns matrix.
* We then give the column names of "merge" to the variable "tidy".
* In the end, we create the "tidydata.txt" file by write.table() function.
