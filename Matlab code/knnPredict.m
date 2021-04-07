function [y_hat_test] = knnPredict(data_train, data_test, label_train, k)
%KNNPREDICT predicts the target values of test data
%   data_train: the features of training data
%   data_test: the features of test data
%   label_train: the target value of training data
%   k: the number of neighbors defined
    y_hat_test = zeros(1, size(data_test, 1));
    
    for i = 1 : size(data_test, 1)
        distances_sort_k = findNeighbours(data_train, data_test(i,:), label_train, k);
        y_hat_test(i) = sum(distances_sort_k(:,2))./size(distances_sort_k,1);     
    end
end

