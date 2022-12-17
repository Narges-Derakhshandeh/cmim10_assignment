%% Jacobian Matrix
function J = jacobian(X, b)
%X=[theta;d];
theta = X(1);
J = [-b * sin(theta), -1;-b * cos(theta), 0]; 
end
