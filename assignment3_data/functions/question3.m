function question3()
samples = csvread('samples.csv');
size(samples);
mu = 3;
mu_0 = -10;
sigma = 1;
squared_sigma_0 = 1;
    function[y] = squared_sigma_n(n)
        y = (squared_sigma_0* sigma^2)/((n*squared_sigma_0) + sigma^2);
    end

    function[y] = mu_n(xs)
        s = size(xs);
        n = s(1);
        mean_mu = 1/n * sum(xs);
        
        y = (n*squared_sigma_0/((n*squared_sigma_0) + sigma^2) * mean_mu) +(sigma^2/(n*squared_sigma_0 + sigma^2) * mu_0); 
    end

mus = [];
sigmas = [];

for i = 0:5
    x = 2^i*10;
    list = samples(1:x);
    mu_i = mu_n(list);
    squared_sigma_i = squared_sigma_n(x);
    mus = [mus mu_i];
    sigmas = [sigmas squared_sigma_i];
end
hold on;
yyaxis left
% fplot(@(x) normpdf(x, mus(1), sigmas(1)),[0 6]);
% fplot(@(x) normpdf(x, mus(2), sigmas(2)),[0 6]);
% fplot(@(x) normpdf(x, mus(3), sigmas(3)),[2 4]);
% fplot(@(x) normpdf(x, mus(4), sigmas(4)),[2.5 3.5]);
% fplot(@(x) normpdf(x, mus(5), sigmas(5)),[2.8 3.1]);
 fplot(@(x) normpdf(x, mus(6), sigmas(6)),[2.8 3.1]);
yyaxis right
fplot(@(x) normpdf(x, 3, 1),[0 6])
legend('mu Schätzer', 'echte Verteilung')
hold off;
end