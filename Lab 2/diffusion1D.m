% Diffusion1D
% Approximates the heat diffusion equation in 1D
% 
% Parameters 
% ========== 
%    kappa: Thermal conductivity of the material
%    x_rng: Interval in 1D space over which we’re analyzing 
%    t_rng: Time over which it’s being analyzed 
% 
%    u_init: Initial heat distribution in the rod
%    u_bndry: Boundary conditions
% 
%    nx: Number of points on X over which solution will be approximated
%    nt: Number of time points over which solution is approximated
% 
% Return Values 
% ============= 
%    x_out: List of points in X over which solution was approximated
%    t_out: List of time points over which solution was approximated
%    U_out: Contains all the solution approximations for all points (x_out, t_out)

 

function [x_out, t_out, U_out] = diffusion1d( kappa, x_rng, nx, t_rng, nt, u_init, u_bndry )

    % Check if kappa is scalar
    if ~isscalar(kappa)
        throw(MException('MATLAB:invalid_argument', 'The argument kappa is not a scalar'));
    end

    % Check if x_rng is 2-element vector
    if ~isvector(x_rng) || length(x_rng) ~= 2 
        throw(MException('MATLAB:invalid_argument', 'The argument x_rng is not a 2-element vector'));
    end

    % Check if nx is scalar
    if ~isscalar(nx)
        throw(MException('MATLAB:invalid_argument', 'The argument nx is not a scalar'));
    end

    % Check if t_rng is 2-element vector
    if ~isvector(t_rng) || length(t_rng) ~= 2 
        throw(MException('MATLAB:invalid_argument', 'The argument t_rng is not a 2-element vector'));
    end

    % Check if nt is scalar
    if ~isscalar(nt)
        throw(MException('MATLAB:invalid_argument', 'The argument nt is not a scalar'));
    end

    % Check if u_init is function handle
    if ~isa(u_init, 'function_handle')
        throw(MException('MATLAB:invalid_argument', 'The argument u_init is not a function handle'));
    end

    % Check if u_bndry is function handle
    if ~isa(u_init, 'function_handle')
        throw(MException('MATLAB:invalid_argument', 'The argument u_bndry is not a function handle'));
    end