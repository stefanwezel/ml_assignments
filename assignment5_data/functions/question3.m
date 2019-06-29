function[p] = question3(a,b,x,c,d)
% error handling
% if wrong parameters are chosen return -1
if a>4 || b>2 ||x > 2 || c > 3 || d > 2
    fprintf('wrong parameters');
    p = -1;
else
    
    p_a = [0.25 0.25 0.25 0.25];
    p_b = [0.6 0.4];
    p_x = {{[0.5 0.7] [0.6 0.8] [0.4 0.1] [0.2 0.3]} {[0.5 0.3] [0.4 0.2] [0.6 0.9] [0.8 0.7]}};
    p_c = [0.6 0.2; 0.2 0.3; 0.2 0.5];
    p_d = [0.3 0.6; 0.7 0.4];
    
    
    if a < 1
        
        a = [1 2 3 4];

    end
    if b < 1
       
        b = [1 2];
    
    end
%     if x < 1
    if x < 1
        x = [1 2];
    end
        
%     else
%         x_value = p_x{x}{a}(b);
%     end
    if c < 1
        c = [1 2 3];
    end
    
    end
    if d < 1
        d = [1 2];
    end
    
    a_value = p_a(a);
    b_value = p_b(b);
    p_ab = a_value' * b_value;
    size_ab = size(p_ab);
    p_xab = 0;
    p_cx = 0;
    p_dx = 0;
    for i = 1:size_ab(1)
        for j = 1:size_ab(2)
            for k = x
                p_xab = p_xab + p_ab(i,j) * p_x{k}{a(i)}(b(j));
                for l = c
                    p_cx = p_cx + p_c(l,k);
                end
                for m = d
                    p_dx = p_dx + p_d(m,k);
                end
            end
            
            
        end
    end
    
    p = p_xab * p_cx * p_dx;
end