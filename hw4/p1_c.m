load zip.train;

fprintf('Working on the one-vs-three problem...\n\n');
subsample = zip(find(zip(:,1)==1 | zip(:,1) == 3),:);
Y_train = subsample(:,1);
X_train = subsample(:,2:257);
% get single decision tree
ct = fitctree(X_train,Y_train);
% get bagged trees
label = unique(Y_train);
msg = 'one-vs-three problem';
[ oobErr, treeList ] = BaggedTreesHelper( X_train, Y_train, 200, msg );

% get test data
load zip.test
subsample = zip(find(zip(:,1)==1 | zip(:,1) == 3),:);
Y_test = subsample(:,1);
X_test = subsample(:,2:257);

% for single decision tree: compute the result and 
y_pred = predict(ct, X_test);
testError = mean(Y_test~=y_pred);

% bagged tree, trained on label 1, -1
Y_test(Y_test==label(1)) = 1;
Y_test(Y_test==label(2)) = -1;

[numPoints, dim] = size(X_test);
pointAgg_Res = zeros(numPoints, 1);

for i = 1:length(treeList)
    curTree = treeList{i};
    curPredict = predict(curTree, X_test);
    pointAgg_Res = pointAgg_Res + curPredict;
end

% break tie by random pick -1 or 1
pointAgg_Res = sign(pointAgg_Res);
tie = find(pointAgg_Res==0);
pointAgg_Res(tie) = datasample([1, -1], length(tie));
oobErr = mean(pointAgg_Res ~= Y_test);
fprintf('test error, decision tree: %f, bagged: %f\n', testError, oobErr)


% for three-vs-five problem
load zip.train;
fprintf('Working on the three-vs-five problem...\n\n');
subsample = zip(find(zip(:,1)==3 | zip(:,1) == 5),:);
Y_train = subsample(:,1);
X_train = subsample(:,2:257);
% single decision tree
ct = fitctree(X_train,Y_train);
% bagged trees
label = unique(Y_train);
msg = 'three-vs-five problem';
[ oobErr, treeList ] = BaggedTreesHelper( X_train, Y_train, 200, msg );

load zip.test
subsample = zip(find(zip(:,1)==3 | zip(:,1) == 5),:);
Y_test = subsample(:,1);
X_test = subsample(:,2:257);

% single decision tree: out-of-sample error computed using test set
y_pred = predict(ct, X_test);
testError = mean(Y_test~=y_pred);

% bagged tree, trained on label 1, -1
Y_test(Y_test==label(1)) = 1;
Y_test(Y_test==label(2)) = -1;

[numPoints, dim] = size(X_test);
pointAgg_Res = zeros(numPoints, 1);

for i = 1:length(treeList)
    curTree = treeList{i};
    curPredict = predict(curTree, X_test);
    pointAgg_Res = pointAgg_Res + curPredict;
end

% break tie by random pick -1 or 1
pointAgg_Res = sign(pointAgg_Res);
tie = find(pointAgg_Res==0);
pointAgg_Res(tie) = datasample([1, -1], length(tie));
oobErr = mean(pointAgg_Res ~= Y_test);
fprintf('test error, decision tree: %f, bagged: %f\n', testError, oobErr)
