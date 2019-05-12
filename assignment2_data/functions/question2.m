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
% schnittpunkt = solve(@(x) (normpdf(x,mu_seabass, sigma_seabass) == normpdf(x,mu_salmon, sigma_salmon)));

schnittpunkt = 1.279466;
normpdf(schnittpunkt,mu_seabass, sigma_seabass)
normpdf(schnittpunkt,mu_salmon, sigma_salmon)
seabass_wrong = integral(@(x) normpdf(x,mu_seabass, sigma_seabass), schnittpunkt(1), Inf)
salmon_wrong = integral(@(x) normpdf(x,mu_salmon, sigma_salmon), -Inf, schnittpunkt(1))

risk = seabass_wrong * 0.5 + salmon_wrong * 1.2
end

