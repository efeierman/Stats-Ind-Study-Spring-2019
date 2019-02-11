# Binomial Distribution Exercises on NGG Canvas page

# Exercise 1

  dbinom(0:10,10,0.2) # dbinom is density function

# Exercise 2 
  
  dbinom(8,14,0.1)
  
  # Would not expect this result. Probability that 8 quanta are released is very small (~.00002)
    
  dbinom(8,14,0.7)
      
  # Result not likely. Probability that 8 quanta are released is .13
      
  deciles = c(0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1.0)  
  dbinom(8,14,deciles)
  deciles[which.max(dbinom(8,14,deciles))]
  
  # Pr most likely 0.6
  
# Exercise 3

  dbinom(8+5,14+14,0.1) # why do we simply add? Stated independence
      
  probabilitiesQ3 = dbinom(8+5,14+14,deciles)
  deciles[which(max(probabilitiesQ3) == probabilitiesQ3)] 
  
  # Pr most likely 0.5 given the two measurements
  
  TwoObservations = data.frame(
    QuantaReleased = c(5,8)
  )

  1 - (var(TwoObservations) / mean(TwoObservations$QuantaReleased))
      
# Exercise 4
      
  NumberReleases = c(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14)
  Count = c(0,0,3,10,19,26,16,16,5,5,0,0,0,0,0)
  
  barplot(NumberReleases * Count, names.arg = NumberReleases, main = "Histogram of Release Events", xlab = "# of quanta released")
      
  TotalReleases = sum(NumberReleases * Count)
  probabilitiesQ4 = dbinom(TotalReleases,14 * 100,deciles) # how do you determine p value out of infinite values
  PrQ4 = deciles[which(max(probabilitiesQ4) == probabilitiesQ4)] 
      
  # Pr most likely 0.4 given these measurements (assuming all 1 measurement)
  
  # Use a fitting procedure to find the best-fitting value of p to three decimal places.
  
# Exercise 5
      
  # H0: p=0.3
      
  probabilitiesQ5 = dbinom(7,14,deciles)
  probabilitiesQ5
  PrQ5 = deciles[which(max(probabilitiesQ5) == probabilitiesQ5)]

  # Pr most likely 0.5
      
  binom.test(7,14,0.3) # Exact Binomial Test
  
  # p = 0.14, therefore can not conclude that temp has an effect
  
  dbinom(7,14,0.3)  # why do you get diff answers between exact binomial and dbinom  
  
  # p = .06

      
# Bonus Exercise
  
  getwd()    
  expts = read.csv("~/Google Drive/R/Binomial Distribution/JohnsonWernig.csv")
  str(expts)
  expts  
  
  sums = c(sum(expts[,2]), sum(expts[,3]),sum(expts[,4]),sum(expts[,5]),sum(expts[,6]),sum(expts[,7])) 
  barplot(sums,names.arg = c(0,1,2,3,4,5), main = "Histogram of Release Events", xlab = "# of quanta released", ylab = "Count")
  
  PossibleReleases = c(0,1,2,3,4,5)
  
  TotalObs = sum(expts[,2:7])
  mean = sum((sums * PossibleReleases))/TotalObs

  