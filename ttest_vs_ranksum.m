% Sample from normal distribution 1
mu1 = 50;
sigma1 = 10;
N = 1000;
samples1 = normrnd(mu1,sigma1,N,1);

% Sample from normal distribution 2
mu2 = .5;
sigma2 = .02;
samples2 = normrnd(mu2,sigma2,N,1);

% Parametric test of means
[h_ttest,p_ttest] = ttest2(samples1,samples2);

if h_ttest == 1
    disp(sprintf('Population means unequal. p = %d',p_ttest))
else
    disp(sprintf('Population means equal. p = %d',p_ttest))
end

% Non-parametric test of medians    
[p_ranksum,h_ranksum] = ranksum(samples1,samples2);

if h_ranksum == 1
    disp(sprintf('Population medians unequal. p = %d',p_ranksum))
else
    disp(sprintf('Population medians equal. p = %d',p_ranksum))
end

% Visualize the distributions
clf;
histogram(samples1,'EdgeColor','r','FaceColor','none');
hold on
histogram(samples2,'EdgeColor','g','FaceColor','none');
ylabel('Counts');
xlabel('Value');
legend('Sample 1','Sample 2');



