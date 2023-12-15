function [w,nw2,b,xi,nxi] = ridgeregv2(X,y,K)
%  Ridge regression minimizing w and b
%  b is penalized
%  X is an m x n matrix, y a m x 1 colum vector
%  weight vector w, intercept b
%  Solution in terms of the primal variables
%  And also in terms of the dual variable alpha
%
m = size(y,1); n = size(X,2);
XX = [X ones(m,1)];

alpha = inv(XX * transpose(XX)+ K*eye(m)) * y ;
sol = transpose(XX)*alpha ;

w = sol(1:n, :); 
b = sol(n+1:end, :); 
nw2 = norm(w);
xi = K*alpha;
nxi = norm(xi);

end

