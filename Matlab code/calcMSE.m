function [rmse] = calcMSE(label_test,y_hat_test)
%CALCRMSE calculates the Root Mean Squared Error of y and y_hat
%   y: the value of target variable
%   y_hat: the predicted value of target variable
    rmse = mean((label_test - y_hat_test).^2);
end

