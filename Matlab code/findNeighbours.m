function [distances_sort_k] = findNeighbours(data_train, data_test, label_train, k)
%FINDNEIGHBOURS finds the nearest k number of neighbours for test_data
%   data_train: the features of training data
%   data_test: the test point 
%   label_train: the target value of training data
%   k: the number of neighbors defined in advance
    distances = zeros(size(data_train, 1), 2);
    for i = 1 : size(data_train, 1)
        neighbour_dis = minkowskiDis(data_train(i,:), data_test, 3);
        distances(i,1) = neighbour_dis;
        distances(i,2) = label_train(i);
    end

    distances_sort = sortrows(distances,1);
    distances_sort_k = distances_sort(1:k, :);

end

