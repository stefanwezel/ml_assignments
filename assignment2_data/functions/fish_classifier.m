function fish_classifier()
% question 2:
fish = csvread('fische.csv');
% histogram(fish, 20);
sigma_seabass = 0.2;
mu_seabass = 1;
sigma_salmon = 0.3;
mu_salmon = 1.6;
s = size(fish);
% fplot(@(x) normpdf(x,mu_salmon, sigma_salmon),[-8 8])
seabass = [];
salmon = [];
seabass_counter = 0;
apriori_hypothesis = 0.5;


	function [y] = likelihood(x, mu, s)
		y = normpdf(x, mu, s) * 2;
	end
	

    function [y] = evidence(x)
        y = normpdf(x,mu_seabass, sigma_seabass) + normpdf(x,mu_salmon, sigma_salmon);
    end

    function [y] = apost(x, omega)
        if omega == 1
            prob = (likelihood(x, mu_seabass, sigma_seabass) * apriori_hypothesis)/evidence(x);
        else
            prob = (likelihood(x, mu_salmon, sigma_salmon) * apriori_hypothesis)/evidence(x);
        end
        y = prob;
    end
for i = 1:s(1)
    x = fish(i);
    aposteriori_salmon = apost(x,2);
    aposteriori_seabass = apost(x,1);
    if aposteriori_seabass > aposteriori_salmon
        seabass_counter = seabass_counter + 1;
    end
    seabass = [seabass aposteriori_seabass];
    salmon = [salmon aposteriori_salmon];
end
% seabass_counter = 622 / 62.2%
% salmon_counter = 1000-seabass_counter = 378 / 37.8%
% scatter(fish, salmon)
% xlim([0.4 2]);

% question 3:
schnittpunkt = fzero(@(x) normpdf(x,mu_seabass, sigma_seabass)- normpdf(x,mu_salmon, sigma_salmon), 1);

seabass_wrong = integral(@(x) normpdf(x,mu_seabass, sigma_seabass), schnittpunkt(1), Inf);
salmon_wrong = integral(@(x) normpdf(x,mu_salmon, sigma_salmon), -Inf, schnittpunkt(1));

risk_salmon = seabass_wrong * 0.5;
risk_seabass = salmon_wrong * 1.2;
    function[y] = cond_risk_salmon(x)
        y = normpdf(x, mu_seabass, sigma_seabass) * 0.5;
    end
    function[y] = cond_risk_seabass(x)
         y = normpdf(x, mu_salmon, sigma_salmon) * 1.2;
    end
cond_risk = fplot(@(x) cond_risk_salmon(x),[0 3]);
xlabel('fish length');
ylabel('conditional risk');
saveas(cond_risk, 'cond_risk_salmon.png');
cond_risk = fplot(@(x) cond_risk_seabass(x), [0 3]);
xlabel('fish length');
ylabel('conditional risk');
saveas(cond_risk, 'cond_risk_seabass.png');
    function[y] = decision_function(x)
        if 0.5*apost(x,1) > 1.2*apost(x,2)
            y = 1;
        else
            y = 2;
        end
    end

seabass_salmon = [0 0];
for i = 1:s(1)
    x = fish(i);
    l = decision_function(x);
    seabass_salmon(l) = seabass_salmon(l) + 1;
end
% seabass_salmon = [550 450] => 550 seabass | 450 Salmons
end
