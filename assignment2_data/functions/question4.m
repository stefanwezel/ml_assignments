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

setosa = [];
versicolor = [];
virginica = [];

setosa = [mean(setosa_data); var(setosa_data)];
versicolor = [mean(versicolor_data); var(versicolor_data)];
virginica = [mean(virginica_data); var(virginica_data)];
    
setosa
versicolor
virginica

end