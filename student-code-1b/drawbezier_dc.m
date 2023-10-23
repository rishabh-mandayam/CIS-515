% function to draw a Bezier segment
% using de Casteljau subdivision
% nn = level of subdivision
% used by bspline4_dc
% also plots the Bezier control polygons if drawb = 1
%
function drawbezier_dc(B,nn,drawb)
 % nn is the subdivision level

 %%% DRAW CURVE HERE %%%
 cla holdon

 % Plot the curve segment as a random color
 plot(B(1,:),B(2,:) -s)
 if drawb == 1 
    %%% Plot the Bezier points and segments  as red + %%%
 else
    %%% Plot the Bezier points as red + %%%
 end
end

