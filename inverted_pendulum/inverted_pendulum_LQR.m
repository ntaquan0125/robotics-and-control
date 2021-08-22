clear all;
close all;
clc;

%% Parameters
L = 2;
M = 5;      % Mass of the cart
m = 1;      % Mass of pendulum
g = 9.8;    % Acceleration due to gravity
d = 1;      % Damping coefficient

%% Modeling
% State space representation
A = [0 1 0 0;
    0 -d/M -m*g/M 0;
    0 0 0 1;
    0 d/(M*L) (m+M)*g/(M*L) 0];
B = [0; 1/M; 0; -1/(M*L)];

controllable = rank(ctrb(A,B))
eigen = eig(A)

%% Controller design
Q = diag([1,1,1,10]);
R = 0.001;

K = lqr(A,B,Q,R);

%% Simulation
tspan = 0:0.01:8;
x0 = [-2; 0; 0.1; 0];   % Initial condition 
wr = [2; 0; 0; 0];     % Reference position
u=@(x)-K*(x - wr);      % Control law
[t,x] = ode45(@(t,x)nonlinear_model(x,L,M,m,g,d,u(x)), tspan, x0, odeset);

for k = 1:length(t)
    draw_cart(x(k,:));
end

%% Plot results
plot(t,x,'LineWidth',2);
hold on
legend('x','v','\theta','\omega')
xlabel('Time')
ylabel('State')
grid on
