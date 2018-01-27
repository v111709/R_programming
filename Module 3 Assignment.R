#--------module # 3 Assignment -------------#
library(Hmisc)
library(psych)
library(PerformanceAnalytics)

Name <- c("Jeb","Donald", "Ted", "Marco", "Carly", "Hillary", "Bernie")
ABC_poll_rslts <- c(4,62,51,21,2, 14,15)
NBC_poll_rslts <- c(12,75,43,19,1,21,19)

#------defining into matrix

poll_results <- cbind(Name, ABC_poll_rslts, NBC_poll_rslts)
poll_results

#------defining into data frame

poll_results.df <- data.frame(Name, ABC_poll_rslts, NBC_poll_rslts)
poll_results.df

#--- mean(grades.df)----  cannot use mean function on a data.frame
colMeans(poll_results.df[,2:3])

colMeans(poll_results.df[,c(2,3)]) #------------  same as above
summary(poll_results.df)
describe(poll_results.df)
#----plot(colMeans(poll_results.df[,c(2,3)]))

poll_data <- read.csv("Poll_Data.csv", header = T)

ggplot(data=poll_data, aes(x=Name, y=Result, fill=Company)) +
  geom_bar(stat="identity", position=position_dodge())


#----converting from df to matrix and vice versa

a <- c(1,2,3)
b <- c(10,20,30)
c <- c(100,200,300)
d <- c(1000,2000,3000)

C.df <- data.frame(a,b,c,d)
C.df

B <- matrix(c(1,10,100,1000,1,10,100,1000,1,10,100,1000,1,10,100,1000),nrow=4)
B
as.matrix(C.df)%*%B

C <- matrix(c(1,10,100,1000,2,20,200,2000,3,30,300,3000 ),nrow=3,ncol=4,byrow=T)
C 
?colnames
colnames(C) <- c("a", "b", "c","d")

### ---- mean(C) does not work; use this function instead
colMeans(as.data.frame(C))




