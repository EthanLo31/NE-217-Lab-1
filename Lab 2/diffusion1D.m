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
