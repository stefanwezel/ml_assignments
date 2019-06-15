function question3
setosa = csvread('trainingSetosa.csv');
versicolor = csvread('trainingVersicolor.csv');
virginica = csvread('trainingVirginica.csv');

input_data = csvread('completeData.csv');

% input_data

[pc ws sc] = pca(input_data);
sc
total_scatter = 0;
for i = 1:4
    total_scatter = total_scatter + sc(i);
end
%(sc(1)+ sc(2))/total_scatter % = 0.9768 => pc(1) and pc(2) scatter more than 95%
firstComp = pc(:,1);
secondComp = pc(:,2);

x_setosa = firstComp' * setosa';
y_setosa = secondComp' * setosa';

x_versicolor = firstComp' * versicolor';
y_versicolor = secondComp' * versicolor';

x_virginica = firstComp' * virginica';
y_virginica = secondComp' * virginica';

hold on;
scatter(x_versicolor,y_versicolor)
scatter(x_setosa,y_setosa)
scatter(x_virginica,y_virginica)
legend('versicolor', 'setosa', 'virginica')
xlabel 'pc 1'
ylabel 'pc 2'
hold off;

end