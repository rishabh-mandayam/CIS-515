function [w,nw1,b,xi,nxi] = ridgeregv1(X,y,K)
%  Ridge regression with centered data
%  b is not penalized
%  X is an m x n matrix, y a m x 1 colum vector
%  weight vector w, intercept b
%  Solution in terms of the primal variables
%

mean_row_vector  = mean(X);

y_mean = repmat(mean(y), size(y, 1), 1);
X_mean = repmat(X_mean, size(X, 1), 1);

X_hat = X_mean - X;
y_hat = y - y_mean;

w = transpose(X_hat) * (X_hat*transpose(X_hat) + K * eye(m)) * y_hat
b = y_hat - mean_row_vector * w; 
nw1 = norm(w)

xi = y_hat - X_hat*w
nxi = norm(xi)

end
