function[p] = question3(a,b,x,c,d)
% error handling
% if wrong parameters are chosen return -1
if a>4 || b>2 ||x > 2 || c > 3 || d > 2
    fprintf('wrong parameters');
    p = -1;
else
    
    p_a = [0.25 0.25 0.25 0.25];
    p_b = [0.6 0.4];
    p_x = [0.5 0.5; 0.7 0.3; 0.6 0.4; 0.8 0.2; 0.4 0.6; 0.1 0.9; 0.2 0.8; 0.3 0.7];
    p_c = [0.6 0.2 0.2; 0.2 0.3 0.5];
    p_d = [0.3 0.7; 0.6 0.4];
    
    z = {p_a p_b p_x p_c p_d}
    
    if a < 1
        s = size(p_a);
        a = s;
    end
    if b < 1
        s = size(p_b);
        b = s(1);
    end
    if x < 1
        s = size(p_x);
        x = s;
    end
    if c < 1
        s = size(p_c);
        c = s;if a < 1
        s = size(a);
        a = s(1);
    end
    
    end
    if d < 1
        s = size(p_d);
        d = s;
    end
    
    
    
    p = 0;



end
end