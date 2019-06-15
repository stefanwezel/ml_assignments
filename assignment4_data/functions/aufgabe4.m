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
