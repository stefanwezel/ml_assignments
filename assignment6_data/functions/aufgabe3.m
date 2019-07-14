function[] = aufgabe3()
function[y] = phi(x, sigma)
    y = 1/(sqrt(2*pi*sigma)) * exp((-x^2)/(2*sigma^2));
end

function[p] = pn(x, xv, sigma)
    phis = 0;
    n = size(xv,2);
    for i = 1:n
        xi = xv(i);
        phis = phis + phi(x - xi, sigma);
    end
    p = phis/n;
end

function[] = result(x)
    d = [2 4 5 8 15]
    results = [];
    i = 1;
    for z = x
        results(i, 1) = pn(z, d, 1);
        for a = 1:size(d,2)
            results(i, a+1) = phi((z - d(a)), 1);
        end
        i = i+1;
    end
    hold on
    plot(x, results(:,1), 'k');
    for a = 2:(size(results,2))
        plot(x, results(:,a)/5, '--');
    end
    legend('Dichtefunktion', 'd = 2', 'd = 4', 'd = 5', 'd = 8', 'd = 15')
    hold off
end

result(0:0.1:20)
D1 = csvread('D1.csv');
D2 = csvread('D2.csv');

    function[w, a] = PNN_training()
        n1 = size(D1, 1);
        n2 = size(D2, 1);
        w = zeros(n1+n2, size(D1, 2));
        %a = zeros(n1+n2, size(D1, 2));
        for j = 1:n1
            D1(j,:) = D1(j,:)/sqrt(sum(D1(j,:).*D1(j,:)));
            w(j,:) = D1(j,:);
            a(j,1) = 1;
            a(j,2) = 0;
        end
        for j = (n1+1):(n2+n1)
            D2(j-n1,:) = D2(j-n1,:)/sqrt(sum(D2(j-n1,:).*D2(j-n1,:)));
            w(j,:) = D2(j-n1,:);
            a(j,1) = 0;
            a(j,2) = 1;
        end
    end

[w, a] = PNN_training();

    function[class] = PNN_classification(test, sigma)
        g = [0 0];
        n = size(w, 1);
        z = zeros(1, n);
        for k = 1:n
            w(k,:)*test';
            z(k) = w(k,:)*test';
            if a(k, 1) == 1
                g(1) = g(1) + exp((z(k) - 1)/sigma^2);
            else
                g(2) = g(2) + exp((z(k) - 1)/sigma^2);
            end
        end
        if g(1) == g(2)
            class = 'tie!';
        else
            class = find(g == max(g));
        end
    end

test_pattern = [[0 0]; [7 7]; [30 20]; [14 40]];
for l  = 1:size(test_pattern, 1)
    class = PNN_classification([test_pattern(l,:)], 1)
end

end
