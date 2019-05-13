function question2()
fish = csvread('fische.csv');
% hist(fish);
sigma_seabass = 0.2;
mu_seabass = 1;
sigma_salmon = 0.3;
mu_salmon = 1.6;
s = size(fish);
n = 1;
% fplot(@(x) normpdf(x,mu_salmon, sigma_salmon),[-8 8])
barsche = [];
lachse = [];
seabass_counter = 0;
    function [y] = apost(x, omega)
        if omega == 1
            prob = normpdf(x,mu_seabass, sigma_seabass);
        else
            prob = normpdf(x,mu_salmon, sigma_salmon);
        end
        y = prob;
    end
for i = 1:s(1)
    x = fish(i);
    prob_seabass = normpdf(x,mu_seabass, sigma_seabass)/2;
    prob_salmon =normpdf(x,mu_salmon, sigma_salmon)/2;
    aposteriori = prob_seabass * 0.5/(prob_seabass * 0.5 + prob_salmon * 0.5);
    barsche = [barsche aposteriori];
    lachse = [lachse 1-aposteriori];
    if aposteriori > 0.5
        seabass_counter = seabass_counter +1;
    end
end
% seabass_counter = 622 / 62.2%
% salmon_counter = 1000-seabass_counter = 378 / 37.8%
% scatter(fish, barsche)
% xlim([0.4 2]);

% question 3:
schnittpunkt = fzero(@(x) normpdf(x,mu_seabass, sigma_seabass)- normpdf(x,mu_salmon, sigma_salmon), 1);

seabass_wrong = integral(@(x) normpdf(x,mu_seabass, sigma_seabass), schnittpunkt(1), Inf);
salmon_wrong = integral(@(x) normpdf(x,mu_salmon, sigma_salmon), -Inf, schnittpunkt(1));

risk_salmon = seabass_wrong * 0.5
risk_seabass = salmon_wrong * 1.2
    function[y] = cond_risk_salmon(x)
        if x < schnittpunkt
            y = 0;
        else
            y = normpdf(x, mu_seabass, sigma_seabass) * 0.5;
        end
    end
    function[y] = cond_risk_seabass(x)
        if x >= schnittpunkt
            y = 0;
        else
            y = normpdf(x, mu_salmon, sigma_salmon) * 1.2;
        end
    end
% fplot(@(x) cond_risk_salmon(x),[0 2]);

% fplot(@(x) cond_risk_seabass(x), [0 2]);
    function[y] = decision_function(x)
        if 0.5*apost(x,1) > 1.2*apost(x,2)
            y = 1;
        else
            y = 2;
        end
    end

r = [0 0];
for i = 1:s(1)
    x = fish(i);
    l = decision_function(x);
    r(l) = r(l) + 1;
end
r
end

