library(data.table)
library(ggplot2)
library(sm)

c1 <- rainbow(10)
c2 <- rainbow(10, alpha=0.2)

Frequency <- c(0.6,0.3,0.4,0.4,0.2,0.6,0.3,0.4,0.9,0.2)
BP <- c(103,87,32,42,59,109,78,205,135,176)
First <- c(1,1,1,1,0,0,0,0,NA,1)
Second <- c(0,0,1,1,0,0,1,1,1,1)
FinalDecision <- c(0,1,0,1,0,1,0,1,1,1)

hospital_DF = data.frame(Frequency, BP, First, Second, FinalDecision)
hospital_DF

boxplot(BP~FinalDecision,data=hospital_DF, col=c("#FF000099", "#FF6D0099"),
  main="Daily MD Ratings", xlab="Ratings", ylab="Blood Pressure" )

?hist

hist(hospital_DF$BP,col="orange", border="pink",xlab="Blood Pressure",ylab = NULL, 
     main="Histogram of Patients Blood Pressure") 

