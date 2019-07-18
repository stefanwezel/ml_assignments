function question1()
hmm = createHMMmatrices();
hmm.G;
hmm.V;

% ----- b) -------

    function[y] = forward(X, t, model)
        y = 0;
        
        if t == 0
            y = zeros(1, 11);
            y(1) = 1;
        else
            
            
            
            s2 = size(model.G);
            s3 = size(model.V);
            fw = forward(X,t-1,model);
            z = zeros(11,11);
            for state = 1:s2(2)
                z(state, 1:s2(1)) = fw(state) * model.G(state, 1:s2(1));
            end
            
            for i = 1:11
                y = y + z(i, 1:11)'.* model.V(1:s3(1), X(t));
            end
            y = y';
        end
        
        
    end

% c) d) missing

% ---- e) -----
e = forward([1 3 5 7 9],5 , hmm);
% WK fuer G_9:
e(10) % Da G bei 0 anfaengt aber matlab bei 1

% ---- f) ------
f = forward([2 3 5 7 10], 5, hmm);
% WK fuer G_9:
f(10) % Da G bei 0 anfaengt aber matlab bei 1

% g) missing

end