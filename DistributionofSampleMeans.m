% For each distribution, maniuplate N and number of sample means to
% observe how these parameters change the distribution. Notice how the 
% more sample means taken, the more each distribution of sample
% means taken, the more each distribution of sample means begins to look
% like a Gaussian.

% Distribution of sample means from Gaussian

mu = 10;
sigma = 5;
N = 10000;

gaussianSampleMeans = zeros(100,1);

for ii = 1:length(gaussianSampleMeans)
    gaussianSamples = normrnd(mu,sigma,N,1);
    gaussianSampleMeans(ii) = mean(gaussianSamples);
end

histogram(gaussianSampleMeans)

% Distribution of sample means from Poisson

lambda = 1;
N = 100;

poissonSampleMeans = zeros(10000,1);

for ii = 1:length(poissonSampleMeans)
    poissonSamples = poissrnd(lambda,N,1);
    poissonSampleMeans(ii) = mean(poissonSamples);
end

histogram(poissonSampleMeans)

% Distribution of sample means from exponential

mu = 10;
N = 100;

exponentialSampleMeans = zeros(100,1);

for ii = 1:length(exponentialSampleMeans)
    exponentialSamples = exprnd(mu,N,1);
    exponentialSampleMeans(ii) = mean(exponentialSamples);
end

histogram(exponentialSampleMeans)