# Regular equivalence

# Load the xUCINET library
library(xUCINET)
# How to construct a regular blocking of the taro exchange network by Schwimmer 
# (1973) using the xBlockOptimizing() function (similar to Figure 12.7)
# To allow for regular equivalence, we use blocks of type (“reg”,“nul”):


SOL2<-xBlockmodelOptimizing(NET1=Schwimmer_PapuanVillage$TaroExchange,
                            NOG=3,
                            Options="Binary",
                            BlockTypes=c("reg","nul"), 
                            NTRIALS=100)
SOL2

# Plot the regular equivalence blockmodel
xBlockmodel(NET1=Schwimmer_PapuanVillage$TaroExchange,SOL2[,1])

# Calculate the density
xDensity(NET1=Schwimmer_PapuanVillage$TaroExchange,ROWS=SOL2[,1],COLS=SOL2[,1])

# REGE
#How to obtain the REGE coefficients capturing regular equivalence for Sampson’s 
# esteem and disesteem network among monks on the Sampson data (matrix 12.6)
#How to use features in R to find the maximal clusters that (based on the REGE 
# matrix obtained in Problem 2) keep the Outcasts separate (Figure 12.8)

SMED_REGE<-xREGE(list(Sampson_Monastery$Esteem,Sampson_Monastery$Disesteem))
SMED_REGE

# Submitting the output to the clustering procedure and asking for a solution 
# with 9 blocks (including 4 isolates), we get:
SOL3<-xHierarchicalClustering(SMED_REGE, 
                              Input="Similarities",
                              Method="single",
                              NOC=9)
SOL3
# We obtain the following clusters:
# {Romuald} - indeterminate
# {Louis}
# {Bonaventure, Ambrose,Hugh, Boniface, Mark, Albert}
# {Berthold, Victor} - indeterminate and Loyal Opposition
# {Peter, Gregory}
# {Winfrid}
# {John-Bosco}
# {Amand} - indeterminate
# {Basil, Elias, Simplicius} - the Outcasts

# We can now represent the blocks for both esteem and disesteem (note that these contain values):

xBlockmodel(NET1=Sampson_Monastery$Esteem, SOL3)
xDensity(NET1=Sampson_Monastery$Esteem,ROWS=SOL3[,1],COLS=SOL3[,1])
