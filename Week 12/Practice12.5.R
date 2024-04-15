# Core-periphery Structures

# Load the xUCINET library
library(xUCINET)

# How to find the discrete core-periphery solution for Baker’s citation data 
# among social work journals using the function xBlockmodelOptimizing.(Figure 12.10)

MIDEAL<-matrix(c("com","dnc","dnc","dnc"),2,2)
SOL4<-xBlockmodelOptimizing(Baker_Journals$CoCitations>0, 
                            BlockTypes = MIDEAL, 
                            NOG=2, 
                            Options="Binary", 
                            NTRIALS=100)
SOL4

xBlockmodel(NET1=Baker_Journals$CoCitations>0, SOL4[, 1])
