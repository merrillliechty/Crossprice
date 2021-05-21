# One Way ANOVA - Variable Dimension
# Clear Work Space
rm(list=ls(all=TRUE))
# Load package
# Load Functions
source("loadOneWayFunctions.R")
loadOneWayFunctions()

K = 6
startList = OneWaySetUp(K)
OneWayDataEx6(K)
dataList =  OneWayDataEx6(K)

analysisList = OneWayAnalysis(startList,dataList)

OneWaySummary(startList,dataList,analysisList)


