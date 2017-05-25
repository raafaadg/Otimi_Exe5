close all;clear all;clc

[x,y]=meshgrid(-7:.25:7,-20:.5:36);

% [x]=meshgrid(-7:.25:7);
% [y]=meshgrid(-7:.25:7);

z=2.*x.^3+(y-8).^2+exp(-x);

meshc(x,y,z)
figure
contour(x,y,z)