
% Data set with 1000 points taken from normal distribution
mu = 10;
sigma = 5;
N=1000;

originalData = normrnd(mu,sigma,N,1);
histogram(originalData)

% Sample mean 
originalMean = mean(originalData)

% Sample SEM
originalSEM = std(originalData)/sqrt(length(originalData))

% Mean +/- SEM
meanPlusSEM = originalMean + originalSEM
meanMinusSEM = originalMean - originalSEM

disp(sprintf('SEM interval is between %.2f and %.2f',meanMinusSEM,meanPlusSEM))

% Bootstrapping
sampledMeans = zeros(1000,1);

for ii = 1:length(sampledMeans)
    sampledData = datasample(originalData,1000);
    sampledMeans(ii) = mean(sampledData);
end

hold on
histogram(sampledMeans)

% Calculate 95% confidence interval
sortedSampledMeans = sort(sampledMeans);
lowerBoundCI = sortedSampledMeans(25)
upperBoundCI = sortedSampledMeans(975)

disp(sprintf('95 pct confidence interval is between %.2f and %.2f',lowerBoundCI,upperBoundCI))

% Another way to calculate 95pct CI using percentile()
CIs = prctile(sampledMeans, [2.5 97.5])

    
