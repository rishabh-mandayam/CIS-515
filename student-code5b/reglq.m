function [wps,nw3,bps,xi,nxi] = reglq(X,y)
%  Regression minimizing w and b
%  X is an m x n matrix, y a m x 1 colum vector
%  weight vector w, intercept b
%  Computes the least squares solution using the pseudo inverse
%
m = size(y,1); 
n = size(X,2);
XX = [X ones(m,1)];

sol = pinv(XX) * y;

wps = sol(1, :); 
bps = sol(2:end, :); 
nw3 = norm(wps);

xi = y - X*wps - bps;
nxi = norm(xi);
end

