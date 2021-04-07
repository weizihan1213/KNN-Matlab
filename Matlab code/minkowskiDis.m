function [mink_dis] = minkowskiDis(a,b,p)
%MINKOWSKIDIS calculates the minkowski distance between two data points
%   p: The Minkowski distance of order between two points
    mink_dis = sum(abs(a - b).^p).^(1/p);
end

