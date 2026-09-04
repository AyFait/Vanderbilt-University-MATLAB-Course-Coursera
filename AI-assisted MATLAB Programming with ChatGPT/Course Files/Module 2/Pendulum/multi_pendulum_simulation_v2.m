function multi_pendulum_simulation_v2(N, theta0, dt, Tsim)
    % Validate inputs
    if N < 1
        error('Number of pendulums must be at least 1.');
    end
    if theta0 < 0 || theta0 > 15
        error('Initial angle must be between 0 and 15 degrees.');
    end
    if dt < 0.01 || dt > 0.05
        error('Time step must be between 0.01 and 0.05 seconds.');
    end
    
    % Convert initial angle to radians
    theta0 = deg2rad(theta0);
    
    % Define gravity
    g = 9.81;
    
    % Generate N lengths evenly distributed between 1 and 2 meters
    L = linspace(1, 2, N);
    
    % Time vector
    t = 0:dt:Tsim;
    
    % Compute pendulum angles for each pendulum
    theta = zeros(N, length(t));
    for i = 1:N
        omega = sqrt(g / L(i));
        theta(i, :) = theta0 * cos(omega * t);
    end
    
    % Call the animation function
    animate_pendulums(t, theta, L);
end

function animate_pendulums(T, theta, L)
    % Get number of pendulums
    N = size(theta, 1);
    
    % Setup figure
    figure;
    axis equal;
    hold on;
    grid on;
    xlabel('X (m)');
    ylabel('Y (m)');
    title('Multiple Pendulum Animation');
    
    % Set axis limits
    max_length = max(L);
    axis([-max_length/2 max_length/2 -max_length-0.2 -max_length/3]);
    
    % Plot pivot point
    plot(0, 0, 'ko', 'MarkerFaceColor', 'k');
    
    % Initialize line and mass handles
    pendulum_lines = gobjects(1, N);
    pendulum_masses = gobjects(1, N);
    
    % Initial positions and plot
    for i = 1:N
        x = L(i) * sin(theta(i, 1));
        y = -L(i) * cos(theta(i, 1));
        pendulum_lines(i) = plot([0 x], [0 y], 'k', 'LineWidth', 1);
        pendulum_masses(i) = plot(x, y, 'o', 'MarkerFaceColor', 'k', 'MarkerEdgeColor', 'k', 'MarkerSize', 20);
    end
    
    % Animation loop
    for k = 1:length(T)
        for i = 1:N
            x = L(i) * sin(theta(i, k));
            y = -L(i) * cos(theta(i, k));
            set(pendulum_lines(i), 'XData', [0 x], 'YData', [0 y]);
            set(pendulum_masses(i), 'XData', x, 'YData', y);
        end
        drawnow;
    end
end
