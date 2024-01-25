# Load the xUCINET library
library(xUCINET)

# If you want to load the networks and store them into their own variables
# do the following

# Load the freindship dataset from the following url
# https://github.com/JaySquare87/DTA395-2Rollins/blob/main/Week%202/FriendshipNet.csv
friendship <- read.csv("https://raw.githubusercontent.com/JaySquare87/DTA395-2Rollins/main/Week%202/FriendshipNet.csv", header = TRUE)

# Load attribute dataset from the following url
# https://github.com/JaySquare87/DTA395-2Rollins/blob/main/Week%202/Attribute.csv
attribute <- read.csv("https://raw.githubusercontent.com/JaySquare87/DTA395-2Rollins/main/Week%202/Attribute.csv", header = TRUE)

# Load the communication dataset from the following url
# https://github.com/JaySquare87/DTA395-2Rollins/blob/main/Week%202/CommNet.csv
comm <- read.csv("https://raw.githubusercontent.com/JaySquare87/DTA395-2Rollins/main/Week%202/CommNet.csv", header = TRUE)

#-------------------------------------------------------------------------------

# The very basics of xUCINET

# Create the project and load the files using xUCINET
# You can use the xCreateProject() function to do that
# You can get more information about thi sfunction by typing ?xCreateProject
project <-xCreateProject(GeneralDescription="This is a small study among 5 people.",
                              NetworkName="friendship",
                              NETFILE="https://raw.githubusercontent.com/JaySquare87/DTA395-2Rollins/main/Week%202/FriendshipNet.csv",
                              FileType="csv",
                              InFormatType="AdjMat",
                              NetworkDescription="Friendship networks among 5 people with 3=Good friend, 2=Friend and 1=Acquaintance",
                              Mode=c("People"),
                              Directed=TRUE, 
                              Loops=FALSE,
                              Values="Ordinal",
                              Class="matrix",
                              References="No references")

# Add attributes to the project
# You can use the xAddAttributesToProject() function to do that
# You can get more information about this function by typing ?xAddAttributesToProject
project <-xAddAttributesToProject(ProjectName=project,
                                       ATTFILE1="https://raw.githubusercontent.com/JaySquare87/DTA395-2Rollins/main/Week%202/Attribute.csv",
                                       FileType="csv",
                                       Mode=c("People"),
                                       AttributesDescription=c("Age in years","Gender (1=Male, 2=Female)","Preferred music"))

# To add another network to the project
# You can use the xAddToProject() function to do that
# You can get more information about this function by typing ?xAddToProject
project <-xAddToProject(ProjectName=project,
                             NetworkName="Communication",
                             NETFILE1="https://raw.githubusercontent.com/JaySquare87/DTA395-2Rollins/main/Week%202/CommNet.csv",
                             FileType="csv",
                             NetworkDescription="Communication network",
                             Mode=c("People"),
                             Directed=FALSE,
                             Loops=FALSE,
                             Values="Binary",
                             Class="matrix")
