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
end