function simple_pendulum_animation(L, theta0, dt, num_periods)
    % Validate inputs
    if L < 0.1 || L > 2.0
        error('Length must be between 0.1 and 2.0 meters.');
    end
    if theta0 < 0 || theta0 > 15
        error('Initial angle must be between 0 and 15 degrees.');
    end
    if dt < 0.01 || dt > 0.05
        error('Time step must be between 0.01 and 0.05 seconds.');
    end
    
    % Convert initial angle to radians
    theta0 = deg2rad(theta0);
    
    % Pendulum parameters
    g = 9.81;                  % Gravity (m/s^2)
    omega = sqrt(g / L);       % Natural frequency
    T = 2 * pi / omega;        % Period of the pendulum
    total_time = num_periods * T;
    
    % Time vector
    t = 0:dt:total_time;
    
    % Small angle approximation for theta(t)
    theta = theta0 * cos(omega * t);
    
    % Pendulum position
    x = L * sin(theta);
    y = -L * cos(theta);
    
    % Create figure
    figure;
    axis equal;
    axis([-L-0.1 L+0.1 -L-0.1 0.1]);
    hold on;
    grid on;
    xlabel('X (m)');
    ylabel('Y (m)');
    title('Simple Pendulum Animation');
    
    % Plot static pivot point
    plot(0, 0, 'ko', 'MarkerFaceColor', 'k');
    
    % Pendulum components
    pendulum_line = plot([0 x(1)], [0 y(1)], 'r-', 'LineWidth', 2);
    pendulum_mass = plot(x(1), y(1), 'bo', 'MarkerFaceColor', 'b');
    
    % Animate pendulum
    for i = 1:length(t)
        set(pendulum_line, 'XData', [0 x(i)], 'YData', [0 y(i)]);
        set(pendulum_mass, 'XData', x(i), 'YData', y(i));
        pause(dt);
    end
end