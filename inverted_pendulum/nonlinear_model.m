function dx = nonlinear_model(x,L,M,m,g,d,u)
    dx(1,1) = x(2);
    dx(2,1) = (m*L*x(4)^2*sin(x(3)) + u - m*g*sin(x(3))*cos(x(3)) - d*x(2)) / (M + m - m*cos(x(3))^2);
    dx(3,1) = x(4);
    dx(4,1) = -((u + m*L*x(4)^2*sin(x(3)) - d*x(2))*cos(x(3)) - (M + m)*g*sin(x(3))) / (L*(M + m - m*cos(x(3))^2));