function question1_v2()
hmm = createHMMmatrices();
hmm.G
hmm.V 

    function[y] = forward_worker(X,t,model, last_state)
        y = 0;
        if t == 0
            if last_state == 1
              y = 1;
            end
        else
            for state = 1:length(model.G)
                fw = forward_worker(X,t-1,model, state);
                y = y + fw * model.G(state, last_state);
            end
            
            y = y * model.V(last_state, X(t));
        end
    end

    function[y] = forward(X, t, model)
       
        
        y = 0;
        for state = 1: length(X)
            
            y = y + forward_worker(X,t-1,model, state);
        end
       
    end

forward([1 3 5 7 9], 5, hmm)
    
end