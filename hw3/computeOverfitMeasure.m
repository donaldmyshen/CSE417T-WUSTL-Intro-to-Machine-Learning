function [ overfit_m ] = computeOverfitMeasure( true_Q_f, N_train, N_test, var, num_expts )
%COMPUTEOVERFITMEASURE Compute how much worse H_10 is compared with H_2 in
%terms of test error. Negative number means it's better.
%   Inputs
%       true_Q_f: order of the true hypothesis
%       N_train: number of training examples
%       N_test: number of test examples
%       var: variance of the stochastic noise
%       num_expts: number of times to run the experiment
%   Output
%       overfit_m: vector of length num_expts, reporting each of the
%                  differences in error between H_10 and H_2
    overfit_m = zeros(num_expts, 1);
    sigma = sqrt(var);
    
    for i = 1:num_expts
        [train_set, test_set] = generate_dataset(true_Q_f, N_train, N_test, sigma);
        
        two_transform_train = computeLegPoly(train_set(:,1), 2);    
        ten_transform_train = computeLegPoly(train_set(:,1), 10);
        two_transform_test = computeLegPoly(test_set(:,1), 2);
        ten_transform_test = computeLegPoly(test_set(:,1), 10);
        
        g2 = glmfit(two_transform_train, train_set(:,2), 'normal', 'constant', 'off');
        g10 = glmfit(ten_transform_train, train_set(:,2), 'normal','constant', 'off');   
        
        Eout_g2 = 0;
        Eout_g10 = 0;
        
        for j = 1:N_test
            Eout_g2 = Eout_g2 + (two_transform_test(j,:)*g2-test_set(j,2))^2;
            Eout_g10 = Eout_g10 + (ten_transform_test(j,:)*g10-test_set(j,2))^2;
        end
        
        Eout_g2 = Eout_g2/N_test;
        Eout_g10 = Eout_g10/N_test;
        
        overfit_m(i, 1) = Eout_g10 - Eout_g2;
        
    end