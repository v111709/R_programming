assignment2 <- c(16, 18, 14, 22, 27, 17, 19, 17, 17, 22, 20, 22)

myMean <- function(assignment) {
  return(sum(assignment)/length(assignment)) 
}

results <-myMean(assignment2)
results

a <- 10

myfunc <- function(x) {
  a <- 1+1 + x
  return(a)
}

a
b <- myfunc(2)
b


