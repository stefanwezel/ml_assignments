function [result] = question4()
dice = csvread('wuerfel.csv');
histogram = hist(dice);
size_histogram = size(histogram);
sum_of_histogram = sum(histogram);
rho = zeros(1,size_histogram(2));   % rho = diskrete WK-Funktion
for i = 1:size_histogram(2)
    rho(i) = histogram(i)/sum_of_histogram;
end
% bar(rho);                     % plot fuer diskrete WK-Funktion rho
size_of_rho = size(rho);
F = zeros(1,size_of_rho(2));    % F = diskrete Verteilungsfunktion
for i = 1:size_of_rho(2)
    sum_of_rho = 0; 
    for j = 1:i
        sum_of_rho = sum_of_rho + rho(j);
    end
    F(i) = sum_of_rho;
end
% bar(F);                       % plot fuer diskrete Verteilungsfunktion F

size_of_F = size(F);
rndnumber = unifrnd(0,1);
result = 0;
for i = 1:size_of_F(2)
    if F(size_of_F(2) + 1 - i) < rndnumber
        
        result = size_of_F(2) + 1 - i + 1;
        break
    end
    if i == size_of_F(2)
        result = 1;
    end
end
% grid on                       % fuer plot mit grid
end