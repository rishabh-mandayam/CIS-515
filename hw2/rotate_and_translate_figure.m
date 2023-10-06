function rotate_and_translate_figure(vertices, a_1, a_2, num_frames)
    % Create a figure
    figure;
    axis equal;

    plot(vertices(1, :), vertices(2, :), 'b-');
    hold on;

    for frame = 1:num_frames
        % Create the rotation matrix R(pi/2)
        R = [cos(pi/3), -sin(pi/3); sin(pi/3), cos(pi/3)];

        % Apply the rotation to the vertices
        rotated_vertices = R * vertices;

        % Apply the translation
        translated_vertices = rotated_vertices + [a_1; a_2];

        % Extract the translated x and y coordinates
        translated_x = translated_vertices(1, :);
        translated_y = translated_vertices(2, :);

        % Plot the translated figure in red
        plot(translated_x, translated_y, 'r-');
        axis equal;

        pause(0.1);
    end
end
