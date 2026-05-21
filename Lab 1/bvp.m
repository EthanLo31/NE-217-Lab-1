% bvp 
% approximate a function y(x) that satisfies the differential equation and       
% takes the required values at the boundaries.
% 
% Parameters 
% ========== 
%    c:		The coefficients of the ODE, c1 being the one on u’’(x) 
%    x_int:	The interval over which the solution is defined 
%    u_int:	Boundary conditions at x=a and x=b 
% 
%    g:		The forcing function for the ODE 
% 
%    n:		Number of points on the interval 
% 
% Return Values 
% ============= 
%    x:		vector of x points at which the solution was approximated 
%    u:		vector of approximate values of u(x) at the point in x 

function [x, u] = bvp(c, x_int, u_int, g, n)
    
    % Argument Checking 
    % Check c is a 3x1 column vector 

    if ~all(size(c) == [3, 1]) 
        throw(MException('MATLAB:invalid_argument', ... 
            'the argument c must be a 3x1 column vector')); 
    end 
  
    % Check x_int is a 2-element vector 
    if ~isvector(x_int) || length(x_int) ~= 2 
        throw(MException('MATLAB:invalid_argument', ... 
            'the argument x_int must be a 2-element vector [a, b]')); 
    end 

    % Check u_int is a 2-element vector 
    if ~isvector(u_int) || length(u_int) ~= 2 
        throw(MException('MATLAB:invalid_argument', ... 
            'the argument u_int must be a 2-element vector [ua, ub]')); 
    end 
  
    % Check g is a function handle 
    if ~isa(g, 'function_handle') 
        throw(MException('MATLAB:invalid_argument', ... 
            'the argument g must be a function handle')); 
    end 

    % Check n is a positive integer scalar 
    if ~isscalar(n) || n ~= round(n) || n <= 0 
        throw(MException('MATLAB:invalid_argument', ... 
            'the argument n must be a positive integer scalar')); 
    end

    % Step 1: Grid setup 
    a = x_int(1); 
    b = x_int(2); 
    ua = u_int(1); 
    ub = u_int(2); 

    x = linspace(a, b, n)'; % column vector of grid points 
    h = (b - a) / (n - 1); % step size 

    % Step 2: Build system of equations for interior points 
    % Number of unknowns 
    m = n - 2; 

    % Coefficients for finite difference 
    c1 = c(1); % coefficient of u'' 
    c2 = c(2); % coefficient of u'  
    c3 = c(3); % coefficient of u 

    % Initialize matrix A and right-hand side vector F 
    A = zeros(m, m); 
    F = zeros(m, 1); 

    for i = 1:m 
        xi = x(i+1); % interior point 

        % Finite difference approximations 
        % u'' ~ (u_{i-1} - 2*u_i + u_{i+1}) / h^2 
        % u' ~ (u_{i+1} - u_{i-1}) / (2*h) 

        % Diagonal entries 
        if i > 1 
            A(i, i-1) = c1 / h^2 - c2 / (2*h); % left neighbor 
        end 

        A(i, i) = -2 * c1 / h^2 + c3; % center 

        if i < m 
            A(i, i+1) = c1 / h^2 + c2 / (2*h); % right neighbor 
        end 

        % Right-hand side 
        F(i) = g(xi); 

        % Adjust for known boundary values 
        if i == 1 
            F(i) = F(i) - (c1 / h^2 - c2 / (2*h)) * ua; 
        end 

        if i == m 
            F(i) = F(i) - (c1 / h^2 + c2 / (2*h)) * ub; 
        end 

    end 

    % Step 3: Solve the linear system 
    u_interior = A \ F; % solution at interior points 
    
    % Step 4: Assemble full solution 
    u = [ua; u_interior; ub];  

end