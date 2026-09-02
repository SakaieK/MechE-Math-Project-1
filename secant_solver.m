%Root finding function via secant method
%INPUTS:
%   fun: the function we are computing the root of
%   x0: first guess for secant method
%   x1: second guess for secant method
%   dxtol: termination threshold (stop when interval abs(x_{i+1}-x_i) < dxtol)
%   ftol: termination threshold (stop when abs(f(x_{i}))<ftol
%   max_iter: maximum iteration limit
%   dxmax: threshold for checking for a divide by zero error: 
%   terminate when abs(x_{i+1}-x_i) > dxmax, where dxmax is a very large number
%OUTPUTS
%   x: estimate for root of fun
%   exit_flag: an integer indicating whether or not the solver succeeded
function [x, exit_flag] = secant_solver(fun,x0, x1,dxtol,ftol,max_iter,dxmax)
    loc_x1 = x1;
    loc_x0 = x0;
    for i = 1:max_iter
        [fx1, ~] = fun(loc_x1);
        [fx0, ~] = fun(loc_x0);
        
        if abs(loc_x1-loc_x0) < dxtol
            disp("dxtol")
            disp(loc_x1)
            x = loc_x1;
            exit_flag = 0;
            return
        end
        if abs(fx1)<ftol
            disp("ftol")
            disp(loc_x1)
            x = loc_x1;
            exit_flag = 0;
            return
        end

        x2 = loc_x1-fx1*((loc_x1-loc_x0)/(fx1-fx0));
        if abs(x2-loc_x1) > dxmax
            disp("dxmax")
            x = loc_x1;
            exit_flag = 1;
            return
        end
        loc_x0 = loc_x1;
        loc_x1 = x2;
        
    end
    disp("iter lim")
    disp(loc_x1)
    x = loc_x1;
    exit_flag = 1;
end