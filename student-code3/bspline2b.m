%
%  To display a cubic B-sline given by de Boor control points
%   d_0, ..., d_N  
%
% Input points: left click for the d's then press enter (or return, or right click)  
%
%  Performs a loop from 1 to N - 2 to compute the Bezier
%  points using de Casteljau subdivision
%  nn is the subdivision level
%
%  This version also outputs the x-coodinates and the y-coordinates
%  of all the control points of the Bezier segments stored in
%  Bx(N-2,4) and By(N-2,4)
%

function [Bx, By] = bspline2b(dx,dy,N,nn,drawb)
% Works if N >= 4.

 %%% COMPUTE Bx AND By HERE %%%
    Bx = zeros(N-2,4);
    By = zeros(N-2,4);

    if N == 4
        for i = 1:(N-2)
            if i == 1
                Bx(i, 1) = dx(1);
                Bx(i, 2) = dx(2);
                Bx(i, 3) = 1/2*dx(2) + 1/2*dx(3);
                Bx(i, 4) = 1/4*dx(2) + 1/2*dx(3) +1/4*dx(4);

                By(i, 1) = dy(1);
                By(i, 2) = dy(2);
                By(i, 3) = 1/2*dy(2) + 1/2*dy(3);
                By(i, 4) = 1/4*dy(2) + 1/2*dy(3) +1/4*dy(4);
            end
            if i == 2
                Bx(i, 1) = Bx(i-1, 4);
                Bx(i, 2) = 1/2*dx(3) + 1/2*dx(4);
                Bx(i, 3) = dx(4);
                Bx(i, 4) = dx(5);

                By(i, 1) = By(i-1, 4);
                By(i, 2) = 1/2*dy(3) + 1/2*dy(4);
                By(i, 3) = dy(4);
                By(i, 4) = dy(5);
            end
        end

    elseif N == 5
        for i = 1:(N-2)
            if i == 1
                Bx(i, 1) = dx(1);
                Bx(i, 2) = dx(2);
                Bx(i, 3) = 1/2*dx(2) + 1/2*dx(3);
                Bx(i, 4) = 1/4*dx(2) + 7/12*dx(3) +1/6*dx(4);

                By(i, 1) = dy(1);
                By(i, 2) = dy(2);
                By(i, 3) = 1/2*dy(2) + 1/2*dy(3);
                By(i, 4) = 1/4*dy(2) + 7/12*dy(3) +1/6*dy(4);
            end
            if i == 2
                Bx(i, 1) = Bx(i-1, 4);
                Bx(i, 2) = 2/3*dx(3) + 1/3*dx(4);
                Bx(i, 3) = 1/3*dx(3) + 2/3*dx(4);
                Bx(i, 4) = 1/6*dx(3) + 7/12*dx(4) +1/4*dx(5);

                By(i, 1) = By(i-1, 4);
                By(i, 2) = 2/3*dy(3) + 1/3*dy(4);
                By(i, 3) = 1/3*dy(3) + 2/3*dy(4);
                By(i, 4) = 1/6*dy(3) + 7/12*dy(4) +1/4*dy(5);
            end
            if i == 3
                Bx(i, 1) = Bx(i-1, 4);
                Bx(i, 2) = 1/2*dx(4) + 1/2*dx(5);
                Bx(i, 3) = dx(5);
                Bx(i, 4) = dx(6);

                By(i, 1) = By(i-1, 4);
                By(i, 2) = 1/2*dy(4) + 1/2*dy(5);
                By(i, 3) = dy(5);
                By(i, 4) = dy(6);
            end
        end
    else
        for i=1:(N-2)
            if i == 1
                Bx(i, 1) = dx(1);
                Bx(i, 2) = dx(2);
                Bx(i, 3) = 1/2*dx(2) + 1/2*dx(3);
                Bx(i, 4) = 1/4*dx(2) + 7/12*dx(3) +1/6*dx(4);
    
                
                By(i, 1) = dy(1);
                By(i, 2) = dy(2);
                By(i, 3) = 1/2*dy(2) + 1/2*dy(3);
                By(i, 4) = 1/4*dy(2) + 7/12*dy(3) +1/6*dy(4);
            
            elseif i == 2
                Bx(i, 1) = Bx(i - 1, 4);
                Bx(i, 2) = 2/3*dx(3) + 1/3*dx(4);
                Bx(i, 3) = 1/3*dx(3) + 2/3*dx(4);
                Bx(i, 4) = 1/6*dx(3) + 4/6*dx(4) + 1/6*dx(5);
       
                
                By(i, 1) = By(i - 1, 4);
                By(i, 2) = 2/3*dy(3) + 1/3*dy(4);
                By(i, 3) = 1/3*dy(3) + 2/3*dy(4);
                By(i, 4) = 1/6*dy(3) + 4/6*dy(4) + 1/6*dy(5);
            
            elseif i == N - 3
                Bx(i, 1) = Bx(i - 1, 4);
                Bx(i, 2) = 2/3*dx(N-2) + 1/3*dx(N-1);
                Bx(i, 3) = 1/3*dx(N-2) + 2/3*dx(N-1);
                Bx(i, 4) = 1/6*dx(N-2) + 7/12*dx(N-1) + 1/4*dx(N);
    
    
                By(i, 1) = By(i - 1, 4);
                By(i, 2) = 2/3*dy(N-2) + 1/3*dy(N-1);
                By(i, 3) = 1/3*dy(N-2) + 2/3*dy(N-1);
                By(i, 4) = 1/6*dy(N-2) + 7/12*dy(N-1) + 1/4*dy(N);
            
            elseif i == N - 2
                Bx(i, 1) = 1/6*dx(N-2) + 7/12*dx(N-1) + 1/4*dx(N);
                Bx(i, 2) = 1/2*dx(N-1) + 1/2*dx(N);
                Bx(i, 3) = dx(N);
                Bx(i, 4) = dx(N + 1);
    
                
                By(i, 1) = 1/6*dy(N-2) + 7/12*dy(N-1) + 1/4*dy(N);
                By(i, 2) = 1/2*dy(N-1) + 1/2*dy(N);
                By(i, 3) = dy(N);
                By(i, 4) = dy(N + 1);
            
            else
                Bx(i, 1) = Bx(i - 1, 4);
                Bx(i, 2) = 2/3*dx(i+1) + 1/3*dx(i+2);
                Bx(i, 3) = 1/3*dx(i+1) + 2/3*dx(i+2);
                Bx(i, 4) = 1/6*dx(i+1) + 4/6*dx(i+2) + 1/6*dx(i+3);
    
    
                By(i, 1) = By(i - 1, 4);
                By(i, 2) = 2/3*dy(i+1) + 1/3*dy(i+2);
                By(i, 3) = 1/3*dy(i+1) + 2/3*dy(i+2);
                By(i, 4) = 1/6*dy(i+1) + 4/6*dy(i+2) + 1/6*dy(i+3);
            end
        end
    end

    


% nn is the subdivision level
% fprintf('numpt = %d \n', numpt)
figure;
dim_data = 2;
B = zeros(dim_data,4);
plot(dx,dy,'or-');   % plots d's as red circles
hold on;
for i = 1:N-2       
    B(1,:) = Bx(i,:); B(2,:) = By(i,:);
    drawbezier_dc(B,nn,drawb);
end
hold off;
end

