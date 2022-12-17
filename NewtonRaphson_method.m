%% Newton-Raphson method
function [x, iteration_counter] = NewtonRaphson_method(F, J, x, error)
    F_value = F(x);
    F_norm = norm(F_value);
    iteration_counter = 0;

    while F_norm > error && iteration_counter < 100
        delta = J(x)\-F_value;
        x = x + delta;
        F_value = F(x);
        F_norm = norm(F_value);
        iteration_counter = iteration_counter + 1;
    end

    if F_norm > error
        iteration_counter = -1;
    end
end