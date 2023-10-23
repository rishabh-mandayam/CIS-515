function [ud, ld] = subdecas(cpoly)
    m = length(cpoly);
    b = cpoly;
    bb = zeros([2 m]);
    

    ud = cpoly(:, 1);
    ld = cpoly(:, m);

    for j = 2:m
        %preform computation
        for i = 1:(m-j+1)
            curr_control_point = 1/2*b(:, i) + 1/2*b(:, i+1);
            bb(:, i) = curr_control_point;
            %bb(i) = b^(j)_i
        end
        %set variables for next set
        next_ud = bb(:, 1);
        ud = [ud bb(:, 1)];
        
            
        next_ld = bb(:, m - j + 1);
        
        ld = [bb(:, m - j + 1) ld];
    
        b = bb;
        bb = zeros([2 m]);
    end

end
