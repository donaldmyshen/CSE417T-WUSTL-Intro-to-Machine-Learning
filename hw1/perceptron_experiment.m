function [ num_iters, bounds] = perceptron_experiment ( N, d, num_samples )
%perceptron_experiment Code for running the perceptron experiment in HW1
%   Inputs: N is the number of training examples
%           d is the dimensionality of each example (before adding the 1)
%           num_samples is the number of times to repeat the experiment
%   Outputs: num_iters is the # of iterations PLA takes for each sample
%            bound_minus_ni is the difference between the theoretical bound
%               and the actual number of iterations
%      (both the outputs should be num_samples long)
%%
num_iters = zeros(1,num_samples);
for i = 1:num_samples
    % the first dimension is 0 and the other 10 dimensions are sampled 
    % independently at random from the uniform (0,1) distribution
    w_t = rand(1, d + 1);
    % threshold
    w_t(1) = 0;
    % random traing set
    x = 2*rand(N,d+1)-1;
    % x0 = 1
    x(:,1) = 1;
    % sign, 1 or 0
    y = sign(w_t * x');
    data = [x, y'];
    [ ~, num_iters(i) ] = perceptron_learn( data );
end
x_temp = zeros(1,N);
for i = 1 : N
    x_temp(i) = sum(x(i, 2 : end).^ 2);
end
% formula here
R = max(x_temp);
w_norm = norm(w_t.^ 2);
P = min(y.*(w_t * x'));
bounds = R * w_norm^ 2 / (P^ 2);
diff_bownds_iters =  bounds - num_iters
%%
figure(1)
histogram(num_iters)
title('hostogram of each experiment iterations')
xlabel('iterations times')
ylabel('apperence times')
legend('number of iterations')
figure(2)
histogram(log(diff_bownds_iters))
title('hostogram of log(bound - number of iterations)')
xlabel('log(bound - number of iterations)')
ylabel('apperence times')
legend('numbers of log(bound - number of iterations)')
end
