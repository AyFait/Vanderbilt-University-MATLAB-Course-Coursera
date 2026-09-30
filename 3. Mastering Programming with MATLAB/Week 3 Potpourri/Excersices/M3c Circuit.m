
%{
See the image of a passive electrical circuit below. Write a function called voltage that computes the voltages at junctions A, B and c. The function has two inputs, V for the
voltage of the supply in volts and R, a vector of the values of the resistors in ohm. R1 in the figure is R(1), that is, the first element of the vector R. In general, RN is R(N).
The output of the function is a three-element column vector with the voltage levels at junctions A, B and c, respectively.
%}

%{
%Solution 1
function y = voltage(V, R)
    % Extract resistor values
    R1 = R(1); R2 = R(2); R3 = R(3); R4 = R(4);
    R5 = R(5); R6 = R(6); R7 = R(7); R8 = R(8);

    % System matrix M (derived by clearing denominators R1*R2, R3*R4, R5*R6)
    M = [ R2 + R1 + (R1*R2)/R7,         -(R1*R2)/R7,                       0;
               -(R3*R4)/R7,    R4 + R3 + (R3*R4)/R7 + (R3*R4)/R8,    -(R3*R4)/R8;
                    0,                  -(R5*R6)/R8,         R6 + R5 + (R5*R6)/R8 ];

    % Right-hand side vector b
    b = [ V * R2;
          V * R4;
          V * R6 ];

    % Solve M * y = b for column vector y = [A; B; C]
    y = M \ b;
end
%}

%{
%Solution 2
function y = voltage(V, R)
    M = zeros(3, 3);
    b = zeros(3, 1);

    % --- Junction A ---
    if R(1) == 0
        M(1, :) = [1, 0, 0];
        b(1) = V;
    elseif R(2) == 0
        M(1, :) = [1, 0, 0];
        b(1) = 0;
    else
        M(1, :) = [1/R(1) + 1/R(2) + 1/R(7), -1/R(7), 0];
        b(1) = V / R(1);
    end

    % --- Junction B ---
    if R(3) == 0
        M(2, :) = [0, 1, 0];
        b(2) = V;
    elseif R(4) == 0
        M(2, :) = [0, 1, 0];
        b(2) = 0;
    else
        M(2, :) = [-1/R(7), 1/R(3) + 1/R(4) + 1/R(7) + 1/R(8), -1/R(8)];
        b(2) = V / R(3);
    end

    % --- Junction C ---
    if R(5) == 0
        M(3, :) = [0, 0, 1];
        b(3) = V;
    elseif R(6) == 0
        M(3, :) = [0, 0, 1];
        b(3) = 0;
    else
        M(3, :) = [0, -1/R(8), 1/R(5) + 1/R(6) + 1/R(8)];
        b(3) = V / R(5);
    end

    % Solve for y = [A; B; C]
    y = M \ b;
end
%}


%{
%Solution 3
function x = voltage(V, R)
    R = R(:);                 % column vector
    M = zeros(3);
    b = zeros(3,1);

    g7 = 1/R(7);
    g8 = 1/R(8);

    % Junction A (R1 to V, R2 to ground)
    if R(1) == 0
        M(1,:) = [1 0 0];  b(1) = V;     % A = V
    elseif R(2) == 0
        M(1,:) = [1 0 0];  b(1) = 0;     % A = 0
    else
        M(1,:) = [-(1/R(1) + 1/R(2) + g7),  g7,  0];
        b(1)   = -V/R(1);
    end

    % Junction B (R3 to V, R4 to ground)
    if R(3) == 0
        M(2,:) = [0 1 0];  b(2) = V;     % B = V
    elseif R(4) == 0
        M(2,:) = [0 1 0];  b(2) = 0;     % B = 0
    else
        M(2,:) = [g7,  -(1/R(3) + 1/R(4) + g7 + g8),  g8];
        b(2)   = -V/R(3);
    end

    % Junction C (R5 to V, R6 to ground)
    if R(5) == 0
        M(3,:) = [0 0 1];  b(3) = V;     % C = V
    elseif R(6) == 0
        M(3,:) = [0 0 1];  b(3) = 0;     % C = 0
    else
        M(3,:) = [0,  g8,  -(1/R(5) + 1/R(6) + g8)];
        b(3)   = -V/R(5);
    end

    x = M \ b;
end
%}


