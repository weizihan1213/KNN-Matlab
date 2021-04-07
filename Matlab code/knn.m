% Load data from csv 
% dataTable = readtable('D:\git_project\KNN Matlab\datasets\diabetes.csv');
% dataTable = readtable('D:\git_project\KNN Matlab\datasets\housing.csv');
dataTable = readtable('D:\git_project\KNN Matlab\datasets\linnerud.csv');

% Convert data into array
data_array = table2array(dataTable);

% Calculate the size of array
data_array_size = size(data_array);
% disp(data_array_size);

% Refactor dataset into features and label
data_features = data_array(:, 1:end - 1);
data_label = data_array(:, end);

% Normalize data
data_norm = normalize(data_features, 'norm');
% disp(data_norm);

% Get the partition index 
test_ratio = 0.2;
cv = cvpartition(size(data_norm,1), 'HoldOut', test_ratio);
idx = cv.test;

% Partition data and label into train and test two parts
data_train = data_norm(~idx,:);
label_train = data_label(~idx,:);

data_test = data_norm(idx, :);
label_test = data_label(idx,:);

% Get the desirable k for KNN
%{
mse_val = zeros(1, 10);
for i = 1:10
    y_hat_test = knnPredict(data_train, data_test, label_train, i);
    y_hat_test = transpose(y_hat_test);
    mse = calcMSE(label_test, y_hat_test);
    mse_val(i) = mse;
    disp("The Mean Sqaured Error is: " + mse);
end
ax1 = nexttile;
plot(mse_val);
ylabel(ax1, 'MSE');
xlabel(ax1, 'number of k');
%}




% Multiple trials for getting the average MSE value from "knnPredict" function

k = 6;
mse_values = zeros(1,10);
for i = 1:10
    y_hat_test = knnPredict(data_train, data_test, label_train, k);
    y_hat_test = transpose(y_hat_test);

    % Calculate the MSE
    mse = calcMSE(label_test, y_hat_test);
    mse_values(i) = mse;
end
% ax1 = nexttile;
% plot(mse_values);
% ylabel(ax1, 'MSE');
% xlabel(ax1, 'iteration times');
disp("The average Mean Sqaured Error(Minkow Dis) is: " + mean(mse_values));









