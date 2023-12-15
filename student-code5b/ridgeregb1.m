function [w,b,xi,nxi,alpha] = ridgeregb1(X,y,K)
%  Ridge regression 
%  b is not penalized
%  Uses the KKT equations
%  X is an m x n matrix, y a m x 1 colum vector
%  weight vector w, intercept b
%  Solution in terms of the dual variables
%  This version does not display the solution
%
% Get the dimensions of the matrices.
m = size(y, 1);
n = size(X, 2);

% onstruct the system of equations.
A = [X*X' + K*eye(m), ones(m, 1);  ones(1, m), zeros(1, 1)];
b = [y; zeros(1, 1)];

sol = A\b;

% Extract the solutions for alpha and mu.
alpha = sol(1:m, :); 
mu = sol(end, :); 

w = transpose(X) * alpha;
b = mu;
xi = K * alpha;
nxi = norm(xi);

end
