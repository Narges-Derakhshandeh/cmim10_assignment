%% Constraint Matrix
function C = constarints(X, a, b, fi)
%     X=[theta;d];
theta = X(1); d = X(2);
C = [a * cos(fi) + b * cos(theta) - d;a * sin(fi) - b * sin(theta)];
end
