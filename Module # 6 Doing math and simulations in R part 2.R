#--  Consider
A=matrix(c(2,0,1,3), ncol=2)
B=matrix(c(5,2,4,-1), ncol=2)
A
B
#----- Find A + B

A+B
#----- Find A - B

A-B

#----- Build matrix of size 4 with the following values in the diagonal 4,1,2,3

C <- diag(c(4,1,2,3))
C

#----- Generate the following matrix - 1 method

D <- diag(3,5,5)
D[1,2:5] <- 1 
D
D[2:5,1] <- 2
D
#----- Generate the following matrix - 2nd method

D <- diag(3,5,5)

j <- 1

for (i in 2:5) {
  D[j,i] <- 1
  D[i,j] <- 2
  
}
D

#---- End