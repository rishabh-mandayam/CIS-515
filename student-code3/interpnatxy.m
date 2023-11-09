function [dx, dy, Bx, By] = interpnatxy(x,y, ~)
% This version uses the natural end condition
% Uses Matlab \ to solve linear systems
% Input points: two column vectors of x and y coordinates of dim N+1
%
%  This version uses x_0, x_1, ..., x_{N-1}, x_N to compute the Bezier
%  points and the subdivision version of the de Casteljau algorithm
%  to plot the Bezier segments (bspline2b and drawbezier_dc)
%
%  This version outputs the x and y coordinates dx and dy of the de Boor control
%  points d_{-1}, d_0, d_1, ..., d_{N+1} as column vectors
%  and the x and y coordinates of the Bezier control polygons
%  Bx and By
%

 %%% COMPUTE dx, dy, Bx, By HERE %%%
N = length(x);
dx = zeros(N+2,1); 
dy = zeros(N+2,1);
%set d_{-1} and d_{N+1}
dx(1) = x(1);
dx(end) = x(end);
dy(1) = y(1);
dy(end) = y(end);


% Initialize the constants matrix with zeros
constants = zeros(N-2, N-2);
constants(1, 1:2) = [4, 1];
constants(end, end-1:end) = [1,4];
for i = 2:N-3
    constants(i, i-1:i+1) = [1, 4, 1];
end

%create column vectors
x_vector = zeros(N-2, 1);
y_vector = zeros(N-2, 1);

x_vector(1) = 6*x(2) - x(1);
x_vector(end) = 6*x(end-1) - x(end);

y_vector(1) = 6*y(2) - y(1);
y_vector(end) = 6*y(end-1) - y(end);

for i = 2:N-3
    x_vector(i) = 6*x(i+1);
    y_vector(i) = 6*y(i+1);
end
results_x = constants\x_vector;
results_y = constants\y_vector;

dx(3:end-2) = results_x; 
dy(3:end-2) = results_y;

%set d_0
dx(2) = (2/3)*x(1) + (1/3)*dx(3);
dy(2) = (2/3)*y(1) + (1/3)*dy(3);

%set d_N
dx(end - 1) = 1/3*dx(end - 2) + (2/3)*x(end);
dy(end - 1) = 1/3*dy(end - 2) + (2/3)*y(end);

% Plots the spline
Nx = size(dx,1)-1;
fprintf('Nx = %d \n', Nx)
nn = 6; % subdivision level
drawb = true;
% hold on
[Bx, By] = bspline2b(dx,dy,Nx,nn,true);
hold on
plot(x,y,'b+'); % Plot x's as blue +
hold off;
end
