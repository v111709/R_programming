install.packages("pryr")
require(pryr)
require(ISLR)
require(boot)
install.packages("plyr")
library(data.table)
library(plyr)

#----Read file from computer via prompt
Student <- read.csv(file.choose(),header=T)
Student
StudentAverage = ddply(Student,"Sex",transform,Grade.Average=mean(Grade))

sex = Student$Sex
mean(Sex)

#----Read file from internet location using the data.table package
Student2 <- fread("https://instructure-uploads.s3.amazonaws.com/account_130000000086643/attachments/52433435/Dataset.txt?response-content-disposition=inline%3B%20filename%3D%22Dataset-1.txt%22%3B%20filename%2A%3DUTF-8%27%27Dataset%252D1.txt&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJFNFXH2V2O7RPCAA%2F20180303%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20180303T130529Z&X-Amz-Expires=86400&X-Amz-SignedHeaders=host&X-Amz-Signature=04acd6bf66d51ef500e31ca88c754e41e710eee255c2110bdd26d6650a19a482")
Student2

Student2Average = ddply(Student2,"Sex",transform,Grade.Average=mean(Grade))
Student2Average

#---- print to a file
write.table(Student2Average,"SortedAverage")

#---- print to a file and generate a CSV file
write.table(Student2Average,"SortedAverageCSV",sep=",")

#---- select the names that contain the letter "i"
Student2Filtered <- subset(Student2,grepl("[iI]",Student2$Name))
Student2Filtered

#---- print this a file and generate a CSV file
write.table(Student2Filtered,"FilteredNamesCSV",sep=",")
