%% CMiM_10_assignment_Simple kinematic analysis
% Narges Derakhshandeh
clear all;close all;clc;

%% Initial values
a = 0.1; % a and b are in meters
b = 0.2;
fi=pi/6;
theta=asin(sin(fi)*a/b); %the value of the theta in time=0
third_angle=pi-(fi+theta); 
d=(a*sin(third_angle))/sin(theta); %the value of the d in time=0
w =-1; %rotaional speed in rad/s
error = 1e-9;
time = linspace(0, 1, 101);
X = [0.252680255142079; 0.280251707688815]; % initial value for X_0 = [theta_0, d_0];
i = 1;

%% the time loop
for t = linspace(0, 1, 101)

    fi =w * t  + pi/6;
    F = @(X) constarints(X, a, b, fi);
    J = @(X) jacobian(X, b);

    [X, iteration_counter] = NewtonRaphson_method(F, J, X, error);

   dFt = [-a * w * sin(w * t); a * w * cos(w * t)];

   dFq = [-b * sin(X(1)), -1; -b * cos(X(1)), 0];

   dX = - dFt \ dFq;
    
    theta(i,1) = X(1); d(i,1) = X(2);
    d_theta(i,1) = dX(1); dd(i,1) = dX(2);

    i = i + 1;
end
 %d=d*(-1);
%% Plot
figure(1)
subplot(2,2,1)
plot(time, theta,'k');
ylabel('\Theta');
subplot(2,2,2);
plot(time, d, 'r');
ylabel('d');
subplot(2,2,3)
plot(time, d_theta,'k-.' );
ylabel('derivation of \Theta ');
subplot(2,2,4);
plot(time, dd,'r-.' );
ylabel('derivation of d ');
xlabel('Time(s)');



