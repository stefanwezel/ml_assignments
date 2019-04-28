function [result] = question4()
dice = csvread('wuerfel.csv');
h = hist(dice);
s = size(h);
su = sum(h);
y = [];
for x = s(1):s(2)
    y = [y h(x)/su];
end
bar(y)
z = [];
si = size(y);
for i = 1:si(2)
    s = 0; 
    for j = 1:i
        s = s + y(j);
    end
    z = [z s];
end
% bar(z);

rndnumber = unifrnd(0,1);
result = 0;
for i = 1:10
    if z(11 - i) < rndnumber
        
        result = 12-i;
        break
    end
    if i == 10
        result = 1;
    end
end
    

grid on
end