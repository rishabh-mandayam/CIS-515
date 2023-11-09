function lnodes = makelist(lpoly)
    m = size(lpoly, 3); % num of polygons 
    num_control_points = size(lpoly, 2); % num of control points
    total_points = (m * (num_control_points - 1))+ 1; 
    
    lnodes = zeros(2, total_points);
    
    % get nodes for first cpoly
    lnodes(:, 1:num_control_points) = lpoly(:, :, 1);
    
    % Concat the rest of the cpolys, skipping the first point
    start = num_control_points + 1;
    for i = 2:m
        if (i ~= 2)
            start = start + num_control_points - 1;
        end
        finish = start + num_control_points - 2;
        to_insert = lpoly(:, 2:end, i);
        lnodes(:, start:finish) = lpoly(:, 2:end, i);
    end
end
