function rotate_figure(vertices, theta, num_frames)
    % Create a figure
    figure;
    axis equal;

    % Plot the original figure in blue
    plot(vertices(1, :), vertices(2, :), 'b-');
    hold on;

    for frame = 1:num_frames
        % Create the rotation matrix R(θ)
        R = [cos(theta), -sin(theta); sin(theta), cos(theta)];

        % Apply the rotation to the vertices
        rotated_vertices = R * vertices;

        % Extract the rotated x and y coordinates
        rotated_x = rotated_vertices(1, :);
        rotated_y = rotated_vertices(2, :);

        % Plot the rotated figure in red
        plot(rotated_x, rotated_y, 'r-');
        axis equal;

        % Add a pause to show the animation
        pause(0.1);
    end
end
