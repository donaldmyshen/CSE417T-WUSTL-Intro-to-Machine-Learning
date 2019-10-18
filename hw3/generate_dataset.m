function [ train_set, test_set ] = generate_dataset( Q_f, N_train, N_test, sigma )
%GENERATE_DATASET Generate training and test sets for the Legendre
%polynomials example
%   Inputs:
%       Q_f: order of the hypothesis
%       N_train: number of training examples
%       N_test: number of test examples
%       sigma: standard deviation of the stochastic noise
%   Outputs:
%       train_set and test_set are both 2-column matrices in which each row
%       represents an (x,y) pair
    train_set = zeros(N_train, 2);
    test_set = zeros(N_test, 2);
    
    train_x = rand([N_train, 1])*2-1;
    test_x = rand([N_test, 1])*2-1;
    
    trainLeg_x = computeLegPoly(train_x, Q_f);
    testLeg_x = computeLegPoly(test_x, Q_f);
   
    a = randn(Q_f+1,1) / sum(1./(2*(0:Q_f)+1));
    
    train_y = trainLeg_x*a+ sigma*randn(N_train, 1);
    test_y = testLeg_x*a + sigma*randn(N_test, 1);
    
    train_set = horzcat(train_x, train_y);
    test_set = horzcat(test_x, test_y);
    
end
    