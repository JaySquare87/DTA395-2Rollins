#library(xUCINET)

test_that("xDensity without attributes", {
  #A simple example
  NET1<-matrix(c(0,0,8,1,
                 6,0,0,2,
                 7,0,0,3,
                 NA,0,1,1),4,4,byrow=TRUE)
  expect_equal(xDensity(NET1, Option="Sum"), 28)
  expect_equal(xDensity(NET1, Option="Mean"), 28/11)
  expect_equal(xDensity(NET1, Diagonal=TRUE, Option="Mean"), 29/15)
  expect_error(xDensity(NET1, Option="Random"), class="error")
  #Wrong input
  NET2<-c(0,0,8,1,NA)
  expect_error(xDensity(NET2), class="error")
})

test_that("TEST 1 - xDensity on two-mode network", {
  #INPUT
  NET2<-matrix(c(0,1,0 ,2,1,5,
                 0,0,0 ,1,1,1,
                 0,0,0 ,1,1,1,
                 1,5,NA,0,1,0),4,6,byrow=TRUE)
  expect_equal(xDensity(NET2), 22/23)
  A1<-matrix(c("Female","Female","Male","Male"),1,4)
  A1B<-c("Female","Female","Male","Male")
  A1C<-c("Female","Female","Female","Female")
  A2<-c("A","A","A","B","B","C")
  A2C<-c("A","A","A","A","A","A")
  #-------------------------------------------------------
  #SOLUTIONS
  SOL1<-matrix(c(1,5,6,6,3,1),2,3,byrow=TRUE)
  rownames(SOL1)<-c("Female","Male")
  colnames(SOL1)<-c("A","B","C")

  SOL2<-matrix(c(.25,1.5,0,1,1,1.75),1,6,byrow=TRUE)
  rownames(SOL2)<-c("All")
  colnames(SOL2)<-c(1:6)

  SOL3<-matrix(c(1,10/11),2,1,byrow=TRUE)
  rownames(SOL3)<-c("Female","Male")
  colnames(SOL3)<-c("All")

  SOL4<-matrix(c(1.5,0.5,0.5,1.4),4,1,byrow=TRUE)
  rownames(SOL4)<-c(1:4)
  colnames(SOL4)<-c("A")

  SOL5<-c(22/23)
  names(SOL5)<-c("A")

  SOL6<-c(7/11,1,1.75)
  names(SOL6)<-c("A","B","C")

  SOL7<-matrix(c(.25,1.5,0,1,1,1.75),1,6)
  colnames(SOL7)<-c(1:6)
  rownames(SOL7)<-c("Female")
  #-------------------------------------------------------
  #TEST
  expect_equal(xDensity(NET2, ROWS="All", COLS="All", Option="Sum"), 22)
  expect_equal(xDensity(NET2, ROWS="All", COLS="All", Option="Mean"), 22/23)
  expect_equal(xDensity(NET2, ROWS="Unique", COLS="Unique", Option="Mean"), NET2)
  expect_equal(xDensity(NET2, ROWS=A1, COLS=A2, Option="Sum"), SOL1)
  expect_error(xDensity(NET2, ROWS="Unique", COLS=A1), class="error")
  expect_error(xDensity(NET2, ROWS=A2, COLS="All"), class="error")
  expect_equal(xDensity(NET2, ROWS="All", COLS="Unique", Option="Mean"), SOL2)
  expect_equal(xDensity(NET2, ROWS=A1B, COLS="All"), SOL3)
  expect_equal(xDensity(NET2, ROWS="Unique", COLS=A2C),SOL4)
  expect_equal(xDensity(NET2, ROWS=A1C, COLS=A2C),SOL5)
  expect_equal(xDensity(NET2, ROWS=A1C, COLS=A2),SOL6)
  expect_equal(xDensity(NET2, ROWS=A1C, COLS="Unique"),SOL7)
})
#> Test passed
