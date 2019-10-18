figure(1);
subplot(2,3,1)
% N = 40
y1=(expt_data_mat_median(:,1,1));
y2=(expt_data_mat_median(:,1,2));
y3=(expt_data_mat_median(:,1,3));
y4=(expt_data_mat_median(:,1,4));
y5=(expt_data_mat_median(:,1,5));

plot(Q_f,y1,Q_f,y2,Q_f,y3,Q_f,y4,Q_f,y5);
title('Qf-Median (N=40)');
xlabel('Qf');
ylabel('Median Error');
legend('var=0','var=0.5','var=1','var=1.5','var=2');

% N = 80
y1=(expt_data_mat_median(:,2,1));
y2=(expt_data_mat_median(:,2,2));
y3=(expt_data_mat_median(:,2,3));
y4=(expt_data_mat_median(:,2,4));
y5=(expt_data_mat_median(:,2,5));
subplot(2,3,2)
plot(Q_f,y1,Q_f,y2,Q_f,y3,Q_f,y4,Q_f,y5);
title('Qf-Median (N=80)');
xlabel('Qf');
ylabel('Median Error');
legend('var=0','var=0.5','var=1','var=1.5','var=2');

% N = 120
y1=(expt_data_mat_median(:,3,1));
y2=(expt_data_mat_median(:,3,2));
y3=(expt_data_mat_median(:,3,3));
y4=(expt_data_mat_median(:,3,4));
y5=(expt_data_mat_median(:,3,5));
subplot(2,3,3)
plot(Q_f,y1,Q_f,y2,Q_f,y3,Q_f,y4,Q_f,y5);
title('Qf-Median (N=120)');
xlabel('Qf');
ylabel('Median Error');
legend('var=0','var=0.5','var=1','var=1.5','var=2');

% N = 40
y1=(expt_data_mat_mean(:,1,1));
y2=(expt_data_mat_mean(:,1,2));
y3=(expt_data_mat_mean(:,1,3));
y4=(expt_data_mat_mean(:,1,4));
y5=(expt_data_mat_mean(:,1,5));
subplot(2,3,4)
plot(Q_f,y1,Q_f,y2,Q_f,y3,Q_f,y4,Q_f,y5);
title('Qf-Mean (N=40)');
xlabel('Qf');
ylabel('Mean Error');
legend('var=0','var=0.5','var=1','var=1.5','var=2');

% N = 80
y1=(expt_data_mat_mean(:,2,1));
y2=(expt_data_mat_mean(:,2,2));
y3=(expt_data_mat_mean(:,2,3));
y4=(expt_data_mat_mean(:,2,4));
y5=(expt_data_mat_mean(:,2,5));
subplot(2,3,5)
plot(Q_f,y1,Q_f,y2,Q_f,y3,Q_f,y4,Q_f,y5);
title('Qf-Mean (N=80)');
xlabel('Qf');
ylabel('Mean Error');
legend('var=0','var=0.5','var=1','var=1.5','var=2');

% N = 120
y1=(expt_data_mat_mean(:,3,1));
y2=(expt_data_mat_mean(:,3,2));
y3=(expt_data_mat_mean(:,3,3));
y4=(expt_data_mat_mean(:,3,4));
y5=(expt_data_mat_mean(:,3,5));
subplot(2,3,6)
plot(Q_f,y1,Q_f,y2,Q_f,y3,Q_f,y4,Q_f,y5);
title('Qf-Mean (N=120)');
xlabel('Qf');
ylabel('Mean Error');
legend('var=0','var=0.5','var=1','var=1.5','var=2');

figure(2)
% Qf = 5
y1=(expt_data_mat_median(1,:,1));
y2=(expt_data_mat_median(1,:,2));
y3=(expt_data_mat_median(1,:,3));
y4=(expt_data_mat_median(1,:,4));
y5=(expt_data_mat_median(1,:,5));
subplot(2,2,1)
plot(N,y1,N,y2,N,y3,N,y4,N,y5);
title('N-Median (Qf = 5)');
xlabel('N');
ylabel('Median Error');
legend('var=0','var=0.5','var=1','var=1.5','var=2');

% Qf = 10
y1=(expt_data_mat_median(2,:,1));
y2=(expt_data_mat_median(2,:,2));
y3=(expt_data_mat_median(2,:,3));
y4=(expt_data_mat_median(2,:,4));
y5=(expt_data_mat_median(2,:,5));
subplot(2,2,2)
plot(N,y1,N,y2,N,y3,N,y4,N,y5);
title('N-Median (Qf = 10)');
xlabel('N');
ylabel('Median Error');
legend('var=0','var=0.5','var=1','var=1.5','var=2');

% Qf = 15
y1=(expt_data_mat_median(3,:,1));
y2=(expt_data_mat_median(3,:,2));
y3=(expt_data_mat_median(3,:,3));
y4=(expt_data_mat_median(3,:,4));
y5=(expt_data_mat_median(3,:,5));
subplot(2,2,3)
plot(N,y1,N,y2,N,y3,N,y4,N,y5);
title('N-Median (Qf = 15)');
xlabel('N');
ylabel('Median Error');
legend('var=0','var=0.5','var=1','var=1.5','var=2');

% Qf = 20
y1=(expt_data_mat_median(4,:,1));
y2=(expt_data_mat_median(4,:,2));
y3=(expt_data_mat_median(4,:,3));
y4=(expt_data_mat_median(4,:,4));
y5=(expt_data_mat_median(4,:,5));
subplot(2,2,4)
plot(N,y1,N,y2,N,y3,N,y4,N,y5);
title('N-Median (Qf = 20)');
xlabel('N');
ylabel('Median Error');
legend('var=0','var=0.5','var=1','var=1.5','var=2');

figure(3)
% Qf = 5
y1=(expt_data_mat_mean(1,:,1));
y2=(expt_data_mat_mean(1,:,2));
y3=(expt_data_mat_mean(1,:,3));
y4=(expt_data_mat_mean(1,:,4));
y5=(expt_data_mat_mean(1,:,5));
subplot(2,2,1)
plot(N,y1,N,y2,N,y3,N,y4,N,y5);
title('N-Mean (Qf = 5)');
xlabel('N');
ylabel('Mean Error');
legend('var=0','var=0.5','var=1','var=1.5','var=2');

% Qf = 10
y1=(expt_data_mat_mean(2,:,1));
y2=(expt_data_mat_mean(2,:,2));
y3=(expt_data_mat_mean(2,:,3));
y4=(expt_data_mat_mean(2,:,4));
y5=(expt_data_mat_mean(2,:,5));
subplot(2,2,2)
plot(N,y1,N,y2,N,y3,N,y4,N,y5);
title('N-Mean (Qf = 10)');
xlabel('N');
ylabel('Mean Error');
legend('var=0','var=0.5','var=1','var=1.5','var=2');

% Qf = 15
y1=(expt_data_mat_mean(3,:,1));
y2=(expt_data_mat_mean(3,:,2));
y3=(expt_data_mat_mean(3,:,3));
y4=(expt_data_mat_mean(3,:,4));
y5=(expt_data_mat_mean(3,:,5));
subplot(2,2,3)
plot(N,y1,N,y2,N,y3,N,y4,N,y5);
title('N-Mean (Qf = 15)');
xlabel('N');
ylabel('Mean Error');
legend('var=0','var=0.5','var=1','var=1.5','var=2');

% Qf = 20
y1=(expt_data_mat_mean(4,:,1));
y2=(expt_data_mat_mean(4,:,2));
y3=(expt_data_mat_mean(4,:,3));
y4=(expt_data_mat_mean(4,:,4));
y5=(expt_data_mat_mean(4,:,5));
subplot(2,2,4)
plot(N,y1,N,y2,N,y3,N,y4,N,y5);
title('N-Mean (Qf = 20)');
xlabel('N');
ylabel('Mean Error');
legend('var=0','var=0.5','var=1','var=1.5','var=2');
            