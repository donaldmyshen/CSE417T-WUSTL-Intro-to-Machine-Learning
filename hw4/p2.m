load zip.train;

fprintf('Working on the one-vs-three problem...\n\n');
subsample = zip(find(zip(:,1)==1 | zip(:,1) == 3),:);
trainY = subsample(:,1);
trainX = subsample(:,2:257);

% get test data
load zip.test
subsample = zip(find(zip(:,1)==1 | zip(:,1) == 3),:);
testY = subsample(:,1);
testX = subsample(:,2:257);

[ train_err, test_err ] = AdaBoost( trainX, trainY, testX, testY, 200 )

% for three-vs-five problem

load zip.train;

fprintf('Working on the one-vs-three problem...\n\n');
subsample = zip(find(zip(:,1)==3 | zip(:,1) == 5),:);
trainY = subsample(:,1);
trainX = subsample(:,2:257);

% get test data
load zip.test
subsample = zip(find(zip(:,1)==3 | zip(:,1) == 5),:);
testY = subsample(:,1);
testX = subsample(:,2:257);

[ train_err, test_err ] = AdaBoost( trainX, trainY, testX, testY, 200 )
