function question1()
hmm = createHMMmatrices();
hmm.G
hmm.V 


    function[y] = forward(X, t, model)
        y = 0;
        X;
        t;
        %if size(X) == [1 0]
        %    return ;
        %end
        if t == 1
            y = zeros(11, 1);
            y(t) = 1;
        %    return ;
        else
        
        
        s = size(X);
        current_X = X(t)
        current_X
        s2 = size(model.G);
        s3 = size(model.V);
        for i = 1: s2(2)
            i;
        %y = forward(X, t-1, model) + y
            fw = forward(X,t-1,model);
            fw
            model.G(i, 1:s2(1));
            y;
            y = y + fw* model.G(i, 1:s2(1))
        end
        
        model.V(1:s3(1), X(t));
        y = y * model.V(1:s3(1), current_X);
        
        end
       
        
    end

forward([1 3 6 7 9], 5, hmm)
    
end