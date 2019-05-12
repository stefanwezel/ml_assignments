function question4()
setosa_data = csvread('trainingSetosa.csv');
versicolor_data = csvread('trainingVersicolor.csv');
virginica_data = csvread('trainingVirginica.csv');

setosa_sl = setosa_data(1:40,1);
setosa_sb = setosa_data(1:40,2);
setosa_pl = setosa_data(1:40,3);
setosa_pb = setosa_data(1:40,4);

versicolor_sl = versicolor_data(1:40,1);
versicolor_sb = versicolor_data(1:40,2);
versicolor_pl = versicolor_data(1:40,3);
versicolor_pb = versicolor_data(1:40,4);

virginica_sl = virginica_data(1:40,1);
virginica_sb = virginica_data(1:40,2);
virginica_pl = virginica_data(1:40,3);
virginica_pb = virginica_data(1:40,4);

% histogram(virginica_pb, 10)

setosa = [0,0,0,0];
versicolor = [];
virginica = [];

for i = 1:4
    setosa(i) = setosa_data(1:40,i);
end
setosa


var(setosa_sl)
mean(setosa_sl)
end