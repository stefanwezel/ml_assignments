function [] = question2()

mu = -2;    % 0 in a)
sigma = 2;  % 1 in a)
fplot(@(x) normpdf(x,mu,sigma), [-8 8]);

grid on;
end