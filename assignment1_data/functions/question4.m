function [] = question4()
dice = csvread('wuerfel.csv');
h = hist(dice);
s = size(h);
su = sum(h);
y = [];
for x = s(1):s(2)
    y = [y h(x)/su];
end
bar(y)
grid on
sum(y);
end