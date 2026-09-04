function multi_pendulum_simulation_v5(N, theta0, dt, Tsim)
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
    L = compute_pendulum_lengths(N,51,80);
    
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
    axis([-max_length/2 max_length/2 -max_length-0.2 -max_length/4]);
    
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
    
    % Animation loop with real-time synchronization
    dt = T(2)-T(1);
    for k = 1:length(T)
        frame_start = tic;  % Start timer for this frame
        
        for i = 1:N
            x = L(i) * sin(theta(i, k));
            y = -L(i) * cos(theta(i, k));
            set(pendulum_lines(i), 'XData', [0 x], 'YData', [0 y]);
            set(pendulum_masses(i), 'XData', x, 'YData', y);
        end
        
        elapsed = toc(frame_start);  % Time spent on this frame
        pause_time = dt - elapsed;   % Remaining time to pause
        if pause_time > 0
            pause(pause_time);  % Pause only if time remains
        else
            drawnow;
        end
     end
end

function L = compute_pendulum_lengths(N, F, P)
    % Validate inputs
    if N < 1
        error('Number of pendulums N must be at least 1.');
    end
    if F < 1
        error('Number of oscillations F must be at least 1.');
    end
    if P <= 0
        error('Time period P must be a positive number.');
    end
    
    % Gravity constant
    g = 9.81;
%{    
    % Length of the longest pendulum based on F oscillations in P seconds
    % T = 2*pi*sqrt(L/g) -> L = (T/(2*pi))^2 * g
    T_longest = P / F; % Period of the longest pendulum
    L_longest = (T_longest / (2 * pi))^2 * g;
    
    % Initialize length vector
    L = zeros(1, N);
    L(1) = L_longest;
%}    
    % Compute lengths for remaining pendulums
    for i = 1:N
        T_current = P / (F + 2*i - 2); % Period of the i-th pendulum
        L(i) = (T_current / (2 * pi))^2 * g; % Corresponding length
    end
end