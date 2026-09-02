%Root finding function via bisection algorithm
%INPUTS:
%   fun: the function we are computing the root of
%   x_left: left guess
%   x_right: right guess
%   note that f(x_left) and f(x_right) should have different signs
%   dxtol: termination threshold (stop when interval x_right-x_left < dxtol)
%   ftol: termination threshold (stop when abs(f(x_guess))<ftol
%   max_iter: maximum iteration limit
%OUTPUTS
%   x: estimate for root of fun
%   exit_flag: an integer indicating whether or not the solver succeeded
% exit flag 0 => success
% exit flag 1 => failiure
function [x, exit_flag] = bisection_solver(fun,x_left,x_right,dxtol,ftol,max_iter)
    if fun(x_left)*fun(x_right) > 0
        x = 0;
        exit_flag = 1;
        return
    end
    temp_left = x_left;
    temp_right = x_right;
    current_guess = 0;
    for i = 1:max_iter
        x_mid = (temp_left+temp_right)/2;
        fun_mid = fun(x_mid);
        if abs(temp_right-temp_left) <= dxtol
           x = x_mid;
           exit_flag = 0;
           disp(num2str(current_guess))
           return
        end

        if abs(fun_mid) < ftol
            x = x_mid;
            exit_flag = 0;
            disp(num2str(current_guess))
            return
        end

        if fun(temp_left)*fun_mid < 0
            temp_right = x_mid;
            
        else
            temp_left = x_mid;
        end
        current_guess = x_mid;
        % disp(num2str(fun(temp_left)*fun_mid))
        % disp("bounds updated to "+ num2str(temp_left) +" "+ num2str(temp_right))
    end
    
    disp(num2str(current_guess))
    x = current_guess;
    exit_flag = 1;
    
end