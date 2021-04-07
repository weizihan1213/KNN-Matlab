function [manDis] = manhattanDis(a,b)
%MANHATTANDIS calculates the manhattan distance between two data points
%   Calculate the manhattan distance
    manDis = sum(abs(a-b));
end

