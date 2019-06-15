clear all; close all; clc;

% Linear Discriminant Analysis - general case

% args: numPoints, variance, stretchFactor, alpha
c1 = createPointCloud( 100, 3, 1, 45);
c2 = createPointCloud( 100, 3, 1, 45);

% shift second pointset 6 units to the right.
c2(:, 2) = c2(:, 2) + 6;

figure;
title('original');
hold on;
plot(c1(:, 1), c1(:, 2)', 'og'); 
plot(c2(:, 1), c2(:, 2)', 'xr');


mu1 = [0 0];
mu2 = [0 0];
mu = [0 0];
for i = 1:100
    mu1(1) = mu1(1) + c1(i,1)/100;
    mu1(2) = mu1(2) + c1(i,2)/100;
    mu2(1) = mu2(1) + c2(i,1)/100;
    mu2(2) = mu2(2) + c2(i,2)/100;
end
mu(1) = (mu1(1) + mu2(1))/2;
mu(2) = (mu1(2) + mu2(2))/2;


ScatterW1 = 0;
ScatterW2 = 0;
for i = 1:100
    diff1 = [c1(i,1) c1(i,2)] - mu1;
    diff2 = [c2(i,1) c2(i,2)] - mu2;
    ScatterW1 = ScatterW1 + diff1' * diff1;
    ScatterW2 = ScatterW2 + diff2' * diff2;
end

ScatterW = ScatterW1 + ScatterW2

ScatterB = (mu1 - mu2) * (mu1-mu2)';

proj = inv(ScatterW) * (mu1-mu2)';
proj

% j = (proj*ScatterB'*proj')/(proj *ScatterW'*proj')

% a = proj(2)/proj(1);
% plot(proj(1), proj(2), 'xb')
% plot(0,0,'ob')
fplot(@(x) proj'*x)