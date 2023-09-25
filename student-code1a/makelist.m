function lnodes = makelist(lpoly)
    [m, ~, ~] = size(lpoly);
    
    % Calculate the number of points
    num_points = (m - 1) * size(lpoly, 3) + 1;
    
    % Initialize lnodes with zeros
    lnodes = zeros(2, num_points);
    
    % Initialize the index to keep track of lnodes
    idx = 1;
    
    % Loop through each slice of lpoly
    for i = 1:size(lpoly, 3)
        % Extract the current slice
        current_slice = lpoly(:, :, i);
        
        % Add the first point of the current slice to lnodes
        lnodes(:, idx) = current_slice(:, 1);
        idx = idx + 1;
        
        % Add the remaining points (excluding the first point) of the current slice
        lnodes(:, idx:idx+m-2) = current_slice(:, 2:end);
        idx = idx + m - 1;
    end
end
