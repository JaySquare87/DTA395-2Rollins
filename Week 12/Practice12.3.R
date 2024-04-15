# Optimization

# Load the xUCINET library
library(xUCINET)

#We first use the xBlockmodelOptimizing function to check if there is a single 
# best 4-cluster solution. The types of blocks allowed are: BlockTypes=c(“com”,“nul”). 
# We allow for 400 tries to find the optimal solution(s).

SOL1<-xBlockmodelOptimizing(NET1=Sampson_Monastery$LikeT3>0,
                            NOG=4,
                            Options="Binary",
                            BlockTypes=c("com","nul"), 
                            NTRIALS=100)

SOL1

# We find that multiple best solutions are available, which all have 40 errors. 
# We proceed with the blockmodel representation of our network for the first 
# partition, as well as calculate the densities for each block for this first solution.
xBlockmodel(NET1=Sampson_Monastery$LikeT3>0,SOL1[,1])
