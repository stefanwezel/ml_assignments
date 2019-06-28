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
plot(c1(:, 1), c1(:, 2), 'og'); 
plot(c2(:, 1), c2(:, 2), 'xr');

% transpose data to fit lecture
c1 = c1';
c2 = c2';

% calculate mus
mu = [0 0];

mu1 = sum(c1, 2)/100;
mu2 = sum(c2, 2)/100;
mu(1) = (mu1(1) + mu2(1))/2;
mu(2) = (mu1(2) + mu2(2))/2;

% Within scatter
ScatterW1 = 0;
ScatterW2 = 0;
diff1 = c1 - mu1;
diff2 = c2 - mu2;
for i = 1:100
    ScatterW1 = ScatterW1 + diff1(i) * diff1(i)';
    ScatterW2 = ScatterW2 + diff2(i) * diff2(i)';
end
ScatterW = ScatterW1 + ScatterW2;

% Between scatter
ScatterB = (mu1 - mu2) * (mu1-mu2)';

% projection matrix
proj = inv(ScatterW) * ScatterB;

% project onto new space
c1_new = c1'*proj;
c2_new = c2'*proj;

%add a legend to plot
legend({'c1', 'c2'})

% plot of all data
figure('Name', 'white')
hold on
scatter(c1_new(:,1)*100, c1_new(:,2)*100)
scatter(c2_new(:,1)*100, c2_new(:,2)*100)
plot(c1(1, :), c1(2, :)', 'og'); 
plot(c2(1, :)', c2(2, :)', 'xr');
legend({'c1_{new}', 'c2_{new}', 'c1_{old}', 'c2_{old}'})
hold off

% plot in new subspace, using only one dimension
figure('Name', 'white')
hold on
scatter(1:100, c1'*proj(:,1))
scatter(1:100, c2'*proj(:,1))
hold off