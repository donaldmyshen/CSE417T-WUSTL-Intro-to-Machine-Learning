function [ train_err, test_err ] = AdaBoost( X_tr, y_tr, X_te, y_te, n_trees )
%AdaBoost: Implement AdaBoost using decision stumps learned
%   using information gain as the weak learners.
%   X_tr: Training set
%   y_tr: Training set labels
%   X_te: Testing set
%   y_te: Testing set labels
%   n_trees: The number of trees to use

    [numTrainPoints, ~] = size(X_tr);
    % initialize weights to be uniform distributed
    weights = zeros(numTrainPoints, 1);
    weights(:) = 1.0/numTrainPoints;
    [numTestPoints, ~] = size(X_te);
    
    % store cumulative/aggregated classification result for each point
    classificaRes_train = zeros(numTrainPoints, 1);
    classificaRes_test = zeros(numTestPoints, 1);
    
    % transform the label to be +1, -1
    label = unique(y_tr);
    y_tr(y_tr==label(1)) = 1;
    y_tr(y_tr==label(2)) = -1;    
    y_te(y_te==label(1)) = 1;
    y_te(y_te==label(2)) = -1;
    
    % store the training error and test error under different number of
    % decision stumps
    errorList_train = zeros(1, n_trees);
    errorList_test = zeros(1, n_trees);
    for i = 1:n_trees
        % train current stump
        curr_stump = fitctree(X_tr,y_tr,'Weights', weights, 'SplitCriterion', 'deviance', 'MaxNumSplits', 1);
        % calculate Et
        y_pred = predict(curr_stump, X_tr);
        Et = sum(weights.*(y_pred~=y_tr));
        % calculate alphat
        alphat = 0.5*log((1-Et)/Et);
        % reweight distribution
        normalize_term = 2*sqrt(Et*(1-Et));
        idx = y_pred == y_tr;
        weights(idx) = weights(idx)*sqrt(Et/(1-Et));
        idx = curr_stump.Y~=y_tr;
        weights(idx) = weights(idx)*sqrt((1-Et)/Et);
        weights = weights/normalize_term;
        
        y_train_pred = y_pred;
        % aggregate classification result for each point in training set
        classificaRes_train = classificaRes_train + alphat*y_train_pred;
        
        y_test_pred = predict(curr_stump, X_te);
        % aggregate classification result for each point in test set
        classificaRes_test =classificaRes_test + alphat*y_test_pred;
    
        % get aggregated training result
        train_res = sign(classificaRes_train);
        % break tie
        tie_idxs = find(train_res == 0);
        train_res(tie_idxs) = datasample([1, -1], length(tie_idxs));
        % get aggregated test result
        test_res = sign(classificaRes_test);
        tie_idxs = find(test_res==0);
        test_res(tie_idxs) = datasample([1, -1], length(tie_idxs));   
        % compute test error and training error
        errorList_train(i) = mean(train_res~=y_tr);
        errorList_test(i) = mean(test_res~=y_te);
    end
    
    train_err = errorList_train(n_trees);
    test_err = errorList_test(n_trees);
    
    if isempty(find(label==5, 1))
        msg = 'one-vs-three';
    else
        msg = 'three-vs-five';
    end
    
    figure
    plot(1:n_trees, errorList_train);
    hold on;
    plot(1:n_trees, errorList_test);
    ylabel('Error');
    xlabel('Number of trees');
    legend('Training error', 'Test error');
    title(msg);
end

