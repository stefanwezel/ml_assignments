function question4()

% a)
setosa_data = csvread('trainingSetosa.csv');
versicolor_data = csvread('trainingVersicolor.csv');
virginica_data = csvread('trainingVirginica.csv');

% b),
% the following code automaticly creates the histograms and saves them
% because we don't want to create them over again it's commented out.

% for i = 1:4
%     ending = '';
%     if i == 1
%         ending = '_sl';
%     elseif i == 2
%         ending = '_sb';
%     elseif i == 3
%         ending = '_pl';
%     else
%         ending = '_pb';
%     end
%     setosa_hist = histogram(setosa_data(1:40,i), 10);
%     saveas(setosa_hist, strcat('setosa',ending),'png');
%     versicolor_hist = histogram(versicolor_data(1:40,i), 10);
%     saveas(versicolor_hist, strcat('versicolor', ending),'png');
%     virginica_hist = histogram(virginica_data(1:40,i), 10);
%     saveas(virginica_hist, strcat('virginica', ending),'png');
% end
% c)
setosa = [];
versicolor = [];
virginica = [];

setosa = [mean(setosa_data); sqrt(var(setosa_data)); var(setosa_data)];
versicolor = [mean(versicolor_data); sqrt(var(versicolor_data)); var(versicolor_data)];
virginica = [mean(virginica_data); sqrt(var(virginica_data)); var(virginica_data)];
    
setosa
versicolor
virginica

%d) 
setosa_test = csvread('testSetosa.csv');
versicolor_test = csvread('testVersicolor.csv');
virginica_test = csvread('testVirginica.csv');

prob_s_s = normpdf(setosa_test, setosa(1,1:4), setosa(2,1:4));
prob_ve_s = normpdf(versicolor_test, setosa(1,1:4), setosa(2,1:4));
prob_vi_s = normpdf(virginica_test, setosa(1,1:4), setosa(2,1:4));

prob_s_ve = normpdf(setosa_test, versicolor(1,1:4), versicolor(2,1:4));
prob_ve_ve = normpdf(versicolor_test, versicolor(1,1:4), versicolor(2,1:4));
prob_vi_ve = normpdf(virginica_test, versicolor(1,1:4), versicolor(2,1:4));

prob_s_vi = normpdf(setosa_test, virginica(1,1:4), virginica(2,1:4));
prob_ve_vi = normpdf(versicolor_test, virginica(1,1:4), virginica(2,1:4));
prob_vi_vi = normpdf(virginica_test, virginica(1,1:4), virginica(2,1:4));

%e)
    function [result] = row_mult(x) 
        result = x(1:size(x,1),1);
        for j = 2:size(x,2)
            result = result .* x(1:size(x,1), j);
        end
    end

setosa_results = [];
for i = 1:size(setosa_test, 1)
    max = 0;
    setosa_results(i, 1) = false;
    p_S_i = row_mult(prob_s_s(i, 1:4)) * 1/3;
    setosa_results(i, 2) = p_S_i;
    if p_S_i > max
        setosa_results(i, 1) = true;
        max = p_S_i;
    end
     p_Ve_i = row_mult(prob_s_ve(i, 1:4)) * 1/3;
     setosa_results(i, 3) = p_Ve_i;
    if p_Ve_i > max
        setosa_results(i, 1) = false;
        max = p_Ve_i;
    end
    p_Vi_i = row_mult(prob_s_vi(i, 1:4)) * 1/3;
    setosa_results(i, 4) = p_Vi_i;
    if p_Vi_i > max
        setosa_results(i, 1) = false;
        max = p_Vi_i;
    end
end

versicolor_results = [];

for i = 1:size(versicolor_test, 1)
    max = 0;
    versicolor_results(i, 1) = false;
    p_S_i = row_mult(prob_ve_s(i, 1:4)) * 1/3;
    versicolor_results(i, 2) = p_S_i;
    if p_S_i > max
        max = p_S_i;
    end
     p_Ve_i = row_mult(prob_ve_ve(i, 1:4)) * 1/3;
     versicolor_results(i, 3) = p_Ve_i;
    if p_Ve_i > max
        versicolor_results(i, 1) = true;
        max = p_Ve_i;
    end
    p_Vi_i = row_mult(prob_ve_vi(i, 1:4)) * 1/3;
    versicolor_results(i, 4) = p_Vi_i;
    if p_Vi_i > max
        max = p_Vi_i;
    end
end

virginica_results = [];

for i = 1:size(virginica_test, 1)
    max = 0;
    virginica_results(i, 1) = false;
    p_S_i = row_mult(prob_vi_s(i, 1:4)) * 1/3;
    virginica_results(i, 2) = p_S_i;
    if p_S_i > max
        max = p_S_i;
    end
     p_Ve_i = row_mult(prob_vi_ve(i, 1:4)) * 1/3;
     virginica_results(i, 3) = p_Ve_i;
    if p_Ve_i > max
        max = p_Ve_i;
    end
    p_Vi_i = row_mult(prob_vi_vi(i, 1:4)) * 1/3;
    if p_Vi_i > max
        virginica_results(i, 1) = true;
        virginica_results(i, 4) = p_Vi_i;
        max = p_Vi_i;
    end
end

% e)
setosa_results
versicolor_results
virginica_results

%f)
% Petrale Breite gegen sepale Breite
scatter(setosa_data(1:40,4), setosa_data(1:40, 2));
xlabel('Petale Breite')
ylabel('Sepale Breite')
% petale L�nge gegen sepale L�nge
%scatter(setosa_data(1:40,3), setosa_data(1:40, 1))
%xlabel('Petale L�nge')
%ylabel('Sepale L�nge')
% petale L�nge gegen petale Breite
%scatter(setosa_data(1:40,3), setosa_data(1:40, 4))
%xlabel('Petale L�nge')
%ylabel('Petale Breite')
% sepale L�nge gegen sepale Breite
%scatter(setosa_data(1:40,1), setosa_data(1:40, 2))
%xlabel('Sepale L�nge')
%ylabel('Sepale Breite')

%g)
prob_s_s_mvn = mvnpdf(setosa_test, setosa(1,1:4), cov(setosa_data));
prob_ve_s_mvn = mvnpdf(versicolor_test, setosa(1,1:4), cov(setosa_data));
prob_vi_s_mvn = mvnpdf(virginica_test, setosa(1,1:4), cov(setosa_data));

prob_s_ve_mvn = mvnpdf(setosa_test, versicolor(1,1:4), cov(versicolor_data));
prob_ve_ve_mvn = mvnpdf(versicolor_test, versicolor(1,1:4), cov(versicolor_data));
prob_vi_ve_mvn = mvnpdf(virginica_test, versicolor(1,1:4), cov(versicolor_data));

prob_s_vi_mvn = mvnpdf(setosa_test, virginica(1,1:4), cov(versicolor_data));
prob_ve_vi_mvn = mvnpdf(versicolor_test, virginica(1,1:4), cov(versicolor_data));
prob_vi_vi_mvn = mvnpdf(virginica_test, virginica(1,1:4), cov(versicolor_data));


setosa_results_mvn = [];
for i = 1:size(setosa_test, 1)
    max = 0;
    setosa_results_mvn(i, 1) = false;
    p_S_i = prob_s_s_mvn(i) * 1/3;
    setosa_results_mvn(i, 2) = p_S_i;
    if p_S_i > max
        setosa_results_mvn(i, 1) = true;
        max = p_S_i;
    end
     p_Ve_i = prob_s_ve_mvn(i) * 1/3;
     setosa_results_mvn(i, 3) = p_Ve_i;
    if p_Ve_i > max
        max = p_Ve_i;
    end
    p_Vi_i = prob_s_vi_mvn(i) * 1/3;
    setosa_results_mvn(i, 4) = p_Vi_i;
    if p_Vi_i > max
        max = p_Vi_i;
    end
end

versicolor_results_mvn = [];
for i = 1:size(versicolor_test, 1)
    max = 0;
    versicolor_results_mvn(i, 1) = false;
    p_S_i = prob_ve_s_mvn(i) * 1/3;
    versicolor_results_mvn(i, 2) = p_S_i;
    if p_S_i > max
        max = p_S_i;
    end
     p_Ve_i = prob_ve_ve_mvn(i) * 1/3;
     versicolor_results_mvn(i, 3) = p_Ve_i;
    if p_Ve_i > max
         versicolor_results_mvn(i, 1) = true;
        max = p_Ve_i;
    end
    p_Vi_i = prob_ve_vi_mvn(i) * 1/3;
    versicolor_results_mvn(i, 4) = p_Vi_i;
    if p_Vi_i > max
        max = p_Vi_i;
    end
end

virginica_results_mvn = [];
for i = 1:size(virginica_test, 1)
    max = 0;
    virginica_results_mvn(i, 1) = false;
    p_S_i = prob_vi_s_mvn(i) * 1/3;
    virginica_results_mvn(i, 2) = p_S_i;
    if p_S_i > max
        max = p_S_i;
    end
     p_Ve_i = prob_vi_ve_mvn(i) * 1/3;
     virginica_results_mvn(i, 3) = p_Ve_i;
    if p_Ve_i > max
        max = p_Ve_i;
    end
    p_Vi_i = prob_vi_vi_mvn(i) * 1/3;
    virginica_results_mvn(i, 4) = p_Vi_i;
    if p_Vi_i > max
        virginica_results_mvn(i, 1) = true;
        max = p_Vi_i;
    end
end

setosa_results_mvn
versicolor_results_mvn
virginica_results_mvn

end