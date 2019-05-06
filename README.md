# Final Project Assignment - how the script works?
The script does the following stages:
1. Downloads te zip file from web
2. extract the zip file to local computer
3. Reads to a separate data frame the following files:
a. train data set
b. test data set
c. train activity labels
d.  test activity labels
e. train subject number
f.  test subject number
4. Binds data frames per following order:
a. datasets 3.a and 3.b by rows
b. datasets 3.c and 3.d by rows
c. datasets 3.e and 3.f by rows
d. datasets 4.1 and 4.2 and 4.3 by columns
5. Reads the features list file into a character variable, and change it to a data frame	
6. Does some text editing on the features data frame:
a.	replaces "-" with "_"
b.	replaces "," with "_"
c.	removes parentesis
d.	add 2 last features "activity_lable" and "subject"
7. sets the features data frame to be the header ("names") of the combined data frame from 4.5 above
8. take care of duplicate names - by adding to the the suffix _DUP (so the wont be any duplicates)
9. extract from the data frame of 8 - only columns which have "mean" or "std" in their name.
10. Replace activity lables values from numbers to the real activity name
11. Generating from above dataset a new data set with the average of each variable for each activity and each subject.






