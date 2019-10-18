function [ oobErr, treeList ] = BaggedTreesHelper( X, Y, numBags, msg )
%BAGGEDTREES Returns out-of-bag classification error of an ensemble of
%numBags CART decision trees on the input dataset, and also plots the error
%as a function of the number of bags from 1 to numBags
%   Inputs:
%       X : Matrix of training data
%       Y : Vector of classes of the training examples
%       numBags : Number of trees to learn in the ensemble
%
%   You may use "fitctree" but do not use "TreeBagger" or any other inbuilt
%   bagging function
    
    % bootstrapping
    [numPoints, dimension] = size(X);
    % save trees
    treeList = cell(1, numBags);
    %points_error = cell(numPoints, numBags);
    pointAgg_Nin = zeros(numPoints, 1);
    pointAgg_Res = zeros(numPoints, 1);
    
    label = unique(Y);
    Y(Y==label(1)) = 1;
    Y(Y==label(2)) = -1;
    
    oobErr_List = zeros(numBags, 1);
    for i = 1:numBags
        % bootstrapping
        [curX, idx] = datasample(X, numPoints);
        curY = Y(idx);
        % train decision tree on the bootstrapped data points
        ct = fitctree(curX,curY);
        % find idx that are not in the data set
        leave_idx = setdiff(1:numPoints, idx);
        testX = X(leave_idx, :);
        testY = predict(ct, testX);
        % save the decision tree
        treeList{i} = ct;
        % stat the oof error of each point
        for j = 1:length(leave_idx)
            cur_idx = leave_idx(j);
            pointAgg_Res(cur_idx) = pointAgg_Res(cur_idx) + testY(j);
            pointAgg_Nin(cur_idx) = pointAgg_Nin(cur_idx) + 1;
        end
        
        effect_idx = find(pointAgg_Nin>0);
        effect_pointAgg_Res = pointAgg_Res(effect_idx);
        effect_pointAgg_Res = sign(effect_pointAgg_Res);
        % break tie by random pick -1 or 1
        tie = find(effect_pointAgg_Res==0);
        effect_pointAgg_Res(tie) = datasample([1, -1], length(tie));
        true_Y = Y(effect_idx);
        oobErr_List(i) = mean(effect_pointAgg_Res ~= true_Y);
    end
    
    oobErr = oobErr_List(200);
    %figure
    %plot(1:200, oobErrList);
    %ylabel('out-of-bag error');
    %xlabel('number of bags');
    %title(msg);
end

%plot oov error for different number of trees

