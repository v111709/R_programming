###Create a dataframe
library(data.table)
DF = data.frame(x=c("b","b","b","a","a"),v=rnorm(5))
DF
?rnorm
###Create a data table - needs to include the package
DT = data.table(x=c("b","b","b","a","a"),v=rnorm(5))
?data.table
DT
### Convert from data.frame to Data Table
CARS = data.table(cars)
head(CARS)
tables()
sapply(DT,class)
DT
###Select Row 2
DT[2,]
###Select rows where columns x === "b"
DT[x=="b",]
cat(try(DT["b",],silent=TRUE))
##SET the data.table Key
setkey(DT,x)
DT

### Check to see if the data.table has a key
haskey(DT)
tables()
##Displays all default rows in the group
DT["b",]
DT["a",]
DT["b"]  #the coma is optional
 ##mult argument (short for multiple) allows the first or last row of the group to be returned
DT["b",mult="first"]
DT["b",mult="last"]
## create a new data.frame large enough to show vector scan vs. binary search
grpsize = ceiling(1e7/26^2)  #10 million rows, 676 groups
grpsize
tt=system.time(DF <- data.frame(
              x=rep(LETTERS,each=26*grpsize),
               y=rep(letters,each=grpsize),
               v=runif(grpsize*26^2),
               stringsAsFactors=FALSE))
tt
head(DF,3)
?head
###returns last 3 rows
tail(DF,3)
###returns dimension of an object
?dim
dim(DF) ### 3 column table and inserted 10,000,068 rows
#Extract an arbitrary group from DF
tt=system.time(ans1 <- DF[DF$x=="R" & DF$y=="h",]) ##vector Scan
tt
ans1
head(ans1,3)
dim(ans1)
###convert to a data.table and extract the same group:
DT = data.table(DF)
DT
####DT = as.data.frame.table(DF)
system.time(setkey(DT,x,y)) ###one-off cost, usually
###binary search
ss=system.time(ans2 <- DT[list("R","h")]) 
head(ans2,3)
dim(ans2)
identical(ans1$v,ans2$v)
