function [w,nw1,b,xi,nxi] = ridgeregv1(X,y,K)
%  Ridge regression with centered data
%  b is not penalized
%  X is an m x n matrix, y a m x 1 colum vector
%  weight vector w, intercept b
%  Solution in terms of the primal variables
%
m = size(y, 1);
n = size(X, 2);

mean_x_row_vector  = mean(X);
mean_y_val = mean(y);

y_mean = repmat(mean_y_val, size(y, 1), 1);
X_mean = repmat(mean_x_row_vector, size(X, 1), 1);

X_hat = X - X_mean;
y_hat = y - y_mean;

w = transpose(X_hat) * inv(X_hat*transpose(X_hat) + K * eye(m)) * y_hat;
b = mean_y_val - (mean_x_row_vector * w); 
nw1 = norm(w);

xi = y_hat - (X_hat*w);
nxi = norm(xi);

end
