#library(xUCINET)

test_that("xReciprocity", {
  #A simple example
  NET1<-matrix(c(0,0,1,1,
                 1,0,0,1,
                 1,0,0,1,
                 NA,0,1,1),4,4,byrow=TRUE)
  #SOLUTIONS
  SOL1<-matrix(c(5,5/6*100,3/5,2,2,1,.5,2/3),8,1,byrow=TRUE)
  rownames(SOL1)<-c("Valid Dyads","%Valid Dyads","Density (valid dyads)","Mutual","Asymmetric","Null","DyadReciprocity","ArcReciprocity")
  colnames(SOL1)<-c("Value")

  expect_equal(xReciprocity(NET1), SOL1)

  #Wrong input should give error
  NET2<-matrix(c(0,0,1,
                 1,0,0,
                 1,0,0,
                 NA,0,1),4,3,byrow=TRUE)
  expect_error(xReciprocity(NET2), class="error")
  NET3<-c(0,0,8,1,NA)
  expect_error(xReciprocity(NET3), class="error")
})
#> Test passed
