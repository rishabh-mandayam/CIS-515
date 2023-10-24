% function to draw a Bezier segment
% using de Casteljau subdivision
% nn = level of subdivision
% used by bspline4_dc
% also plots the Bezier control polygons if drawb = 1
%
function drawbezier_dc(B,nn,drawb)
 % nn is the subdivision level
    [x,y] = show_decas_subdiv2(B,nn);
    
    random_color = [rand, rand, rand];

    % Plot the curve segment as a random color
    plot(x, y, 'o-', 'Color', random_color, 'LineWidth', 1.5);
    hold on;

    % Check the drawb parameter to decide how to plot control points/polygons
    if drawb == 1
         %%% Plot the Bezier points and segments  as red + %%%
        plot(B(1,:), B(2,:), 'r-', 'LineWidth', 1.5);
        plot(B(1,:), B(2,:), 'r+');
    else
        %%% Plot the Bezier points as red + %%%
        plot(B(1,:), B(2,:), 'r+');
    end
end
