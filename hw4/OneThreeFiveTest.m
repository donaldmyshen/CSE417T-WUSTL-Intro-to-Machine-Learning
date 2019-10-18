train = load('zip.train');
test = load('zip.test');

fprintf('Working on the one-vs-three problem...\n\n');
subsample_train = train(find(train(:,1)==1 | train(:,1) == 3),:);
y_train = subsample_train(:,1);
X_train = subsample_train(:,2:257);
subsample_test = test(find(test(:,1)==1 | test(:,1) == 3),:);
y_test = subsample(:,1);
X_test = subsample(:,2:257);
y_train(y_train==1) = -1;
y_train(y_train==3) = 1;
y_test(y_test==1) = -1;
y_test(y_test==3) = 1;

[ train_error, test_error ] = AdaBoost(X_train, y_train, X_test, y_test, 100);
fprintf('AdaBoost Train Error 1 vs 3: \n');
disp(train_error)
fprintf('AdaBoost Test Error 1 vs 3: \n');
disp(test_error)

fprintf('Working on the three-vs-5 problem...\n\n');
subsample_train = train(find(train(:,1) == 3 | train(:,1) == 5),:);
y_train = subsample_train(:,1);
X_train = subsample_train(:,2:257);
subsample_test = test(find(test(:,1) == 3 | test(:,1) == 5),:);
y_test = subsample(:,1);
X_test = subsample(:,2:257);
y_train(y_train==1) = -1;
y_train(y_train==3) = 1;
y_test(y_test==1) = -1;
y_test(y_test==3) = 1;

[ train_error, test_error ] = AdaBoost(X_train, y_train, X_test, y_test, 100);
fprintf('AdaBoost Train Error 3 vs 5: \n');
disp(train_error)
fprintf('AdaBoost Test Error 3 vs 5: \n');
disp(test_error)