### -------------Module 5 Assignemnt ---------------###
A=matrix(1:100,nrow=6)
B=matrix(1:100,nrow=6)
###-----------unable to create above matrix since 100 or 1000 is not multiplier of 6
###------ nor is it a square matrix, so I changed to a multiplier of 100 and 900
A=matrix(1:100,nrow=10)
B=matrix(1:900,nrow=30)
A
B

solve(A)
solve(B)

det(A)
det(B)
###-----------unable to do the inverse matrix for either since determinant is 0

###-----------so creating my own matrix instead ---------###
A=matrix(c(1,3,5,7,9,2,4,6,8),nrow=3)
A
det(A)
solve(A)

B=matrix(c(1,5,8,10,5,6,7,8,2,4,6,8,10,1,2,3),nrow=4)
B
det(B)
solve(B)
####-----------------end ---------------------------###