# Final Project Assignment - how the script works?
The script does the following stages:
1. Downloads te zip file from web
2. extract the zip file to local computer
3. Reads to a separate data frame the following files:\n
 3.1 train data set\n
 3.2 test data set\n
 3.3 train activity labels\n
 3.4  test activity labels\n
 3.5 train subject number\n
 3.6  test subject number\n
4. Binds data frames per following order:\n
 4.1 datasets 3.1 and 3.2 by rows\n
 4.2 datasets 3.3 and 3.4 by rows\n
 4.3 datasets 3.5 and 3.6 by rows\n
 4.5 datasets 4.1 and 4.2 and 4.3 by columns
5. Reads the features list file into a character variable, and change it to a data frame	
6. Does some text editing on the features data frame:
 6.1	replaces "-" with "_"
 6.2	replaces "," with "_"
 6.3	removes parentesis
 6.4	add 2 last features "activity_lable" and "subject"
7. sets the features data frame to be the header ("names") of the combined data frame from 4.5 above
8. take care of duplicate names - by adding to the the suffix _DUP (so the wont be any duplicates)
9. extract from the data frame of 8 - only columns which have "mean" or "std" in their name.
10. Replace activity lables values from numbers to the real activity name
11. Generating from above dataset a new data set with the average of each variable for each activity and each subject.






