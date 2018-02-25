install.packages("pryr")
library(pryr)
library(stats4)

#----Generate data and use both S3 and S4 generic function   #----
set.seed(2)
x <- rnorm(50)
x
print(x)
summary(x)
class(x)

show(x)
class(show)

#---- I am unable to create my own objects so I am copying some from 
###--- materials provided  ------###
###----------S3 object ---------------####

df <- data.frame(x = 1:10, y = letters[1:10])
df
otype(df)
df$y
df$x


##----------S4 object ---------------####

setClass("Person",
         slots = list(name = "character", age = "numeric"))
setClass("Employee",
         slots = list(boss = "Person"),
         contains = "Person")

alice <- new("Person", name = "Alice", age = 40)
john <- new("Employee", name = "John", age = 20, boss = alice)

alice@age
slot(john, "boss")
