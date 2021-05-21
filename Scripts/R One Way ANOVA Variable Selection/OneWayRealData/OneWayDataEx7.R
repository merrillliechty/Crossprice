OneWayDataEx7 <- function(K)
{
  # browser()
  
  # Number of Levels
  if(K != 6)
  {
    print(paste("------------------------------------"))
    print(paste("Error Expecting Number of Level to be 6 - for data generation purposes"))
    break
  }
  # Means for each level
  tmu = rep(0,K)
  tmu[1] = 5.25
  tmu[2] = 4.93
  tmu[3] = 4.99
  tmu[4] = 6.74
  tmu[5] = 7.15
  tmu[6] = 6.81
  # Variance (same for all levels)
  tsig2 = 1
  
  # Read in data file
  tdData <- read.csv("../../../Data/data_ex7_ppt.csv", header = TRUE)
  y = tdData[[4]]
  xFactor = tdData[[1]]
  n <- length(y)
  
  mleEst = mleOneWay(y,xFactor,K,n)
  mleMu = mleEst[[1]]
  mleSig = mleEst[[2]]
  mleOver = mleEst[[3]]
  mleSSR = mleEst[[4]]

  nLevel = matrix(0, nrow = K, ncol = 1)
  tMuOver = 0
  
  for(i in 1:K)
  {
    nLevel[i] = sum(xFactor == i)
    tMuOver = tMuOver + tmu[i]*nLevel[i]
  }
  
  tMuOver = tMuOver/n
  
  outList = list(n,nLevel,K,y,xFactor,mleMu,mleSig,mleOver,mleSSR,tmu,tsig2,tMuOver)
  
  return(outList)
  
}