#Mustafa Anjrini on 19.09.2024

rm(list = ls())

back_fitting<- function(response, data){
  # number of rows
  b<-dim(data)[2] 
  #checking which column is the response
  r<-which(colnames(data)==response) 
  # changing the order of the columns in the data frame
  # in order to have the response as a first column
  if (r!=1) {
    df<-data.frame(cbind(data[,r],data[,1:(r-1)],data[,(r+1):b]))
    names(df)[1]<-"y"
  }else{
    df<-data
    names(df)[1]<-"y"
  }
  
  # saving the column of the response in the vector y
  y<-df[,1]
  
  # creating a vector for calculating the coefficients
  m<-rep(0,b)
  # estimating the initial values of the iteration
  m[2:b]<- seq(2,b)
  # running the iteration i from 1:1000 to get a convergence 
  # running the iteration j: updating the values inside the same row
  for (i in 1:1000) {
    for (j in 2:b) {
      df[,"y"]<-y-as.matrix(df[,c(-1,-j)])%*%m[c(-1,-j)]
      df1<-df[,c(1,j)]
      old1<-round(m[1],5)
      m[c(1,j)]<-lm(y~.,data = df1)$coefficients
     
    }
    # exit if the values of two consecutive rows are the same
    if (round(m[1],5)==old1) {
      break
      
    }
    
    # returning an error if the method did not converage
    if (i==1000) {
      stop("the method did not converage")
    }
   
  }
  # return the coefficients as well as the number of iterations
  return(list(m,c("the number of iterations needed:",(i-1)*(b-1))))
}

#example 1
set.seed(17)

y<- runif(100)+rnorm(100)*2
x1<-runif(100)+rnorm(100)*3
x2<-runif(100)+rnorm(100)*4
x3<-runif(100)+rnorm(100)*5

df<- data.frame(y,x1,x2,x3)
# getting the coefficients using the function of R
lm(y~.,data = df)
# getting the coefficients using our implementation
back_fitting("y",df)


##########
#example 2

library(ISLR2)
df<- Boston
names(df)
coef(lm(zn~.,data = df))

back_fitting(response = "zn",data = df)
