%% THUC HIEN BAI TOAN TU MANG NN DA TAO RA
clc;
% Du lieu dau ra
t = 0:0.1:10;

%% QD test mong muon
xp =  0.145 + 0.02*cos(t); %m
yp =  zeros(1, length(xp)); %m
zp = 0.09 + 0.02*sin(t);
Q_test = q_tinhlai_matrix_test';
len = length(xp);
T_mongmuon = [xp;yp;zp];

% Pretrained model với 5 quỹ đạo
% Q_5 = pretrained_5(T_mongmuon);
% error_5 = Q_5 - Q_test;

% Pretrained model với 10 quỹ đạo
% Q_10 = pretrained_10(T_mongmuon);
% error_10 = Q_10 - Q_test;

% Pretrained model với 15 quỹ đạo
Q_15 = pretrained_15_test(T_mongmuon);
error_15 = Q_15 - Q_test;

[x_neural_5, y_neural_5, z_neural_5] = donghocthuan(Q_5(1,:),Q_5(2,:),Q_5(3,:));
[x_neural_10, y_neural_10, z_neural_10] = donghocthuan(Q_10(1,:),Q_10(2,:),Q_10(3,:));
[x_neural_15, y_neural_15, z_neural_15] = donghocthuan(Q_15(1,:),Q_15(2,:),Q_15(3,:));

x_err_5 = x_neural_5 - xp;
x_err_10 = x_neural_10 - xp;
x_err_15 = x_neural_15 - xp;

y_err_5 = y_neural_5 - yp;
y_err_10 = y_neural_10 - yp;
y_err_15 = y_neural_15 - yp;

z_err_5 = z_neural_5 - zp;
z_err_10 = z_neural_10 - zp;
z_err_15 = z_neural_15 - zp;

% Do thi goc
% figure(1)
% hold on
% plot(1:len, Q_5(1,:),'.k', 1:len, Q_10(1,:), '.b', 1:len, Q_15(1,:),'.r');
% plot(1:len, Q_5(2,:),'.k', 1:len, Q_10(2,:), '.b', 1:len, Q_15(2,:),'.r');
% plot(1:len, Q_5(3,:),'.k', 1:len, Q_10(3,:), '.b', 1:len, Q_15(3,:),'.r');
% legend('case 1', 'case 2', 'case 3');
% xlim([0 100]);
% ylim([-3 3]);
% title('Giá trị Q1 trong 3 trường hợp');
% ylabel('Vị trí (rad)');
% xlabel('Thời gian (s)');

% Do thi sai so goc
% figure(2)
% plot(1:len,error_5(2,:),'k', 1: len, error_10(2, :), '.b', 1: len, error_15(2, :), '--r');
% xlim([0 100]);
% ylim([-0.01 0.03]);
% title('Sai số Q3 với dữ liệu đào tạo là 5, 10 và 15 quỹ đạo');
% ylabel('Sai số (rad)');
% xlabel('Thời gian (s)');
% legend('err case 1 (đen)', 'err case 2 (xanh)','err case 3 (đỏ)');

%Do thi sai so toa do
% figure(3)
% plot(1:len,z_err_5(1,:),'k', 1: len, z_err_10(1, :), '.b', 1: len, z_err_15(1, :), '--r');
% xlim([0 100]);
% ylim([-0.001 0.001]);
% title('Sai số zE với dữ liệu đào tạo là 5, 10 và 15 quỹ đạo');
% ylabel('Sai số (m)');
% xlabel('Thời gian (s)');
% legend('err case 1 (đen)', 'err case 2 (xanh)','err case 3 (đỏ)');

% Do thi mo ta ket qua
figure(4) % Cac gia tri q1 q2 q3 tinh toan tu mang NN
hold on
plot(x_neural_5, z_neural_5, 'k','LineWidth',1);
plot(x_neural_10, z_neural_10, '.b','LineWidth',1);
plot(x_neural_15, z_neural_15, '--r','LineWidth',1);
% plot(xp, zp, ' c', 'LineWidth', 1) 
% legend('case 1 (đen)', 'case 2 (xanh)','case 3 (đỏ)', 'mong muốn (tím)');
xlim([0.12 0.17]);
ylim([0.065 0.115]);
title('Quỹ đạo đường tròn theo 3 trường hợp');
ylabel('Vị trí (m)');
xlabel('Thời gian (s)');

% Tinh sai so trung binh goc khop
avg_error_5_q1 = mean(error_5(1,:));
avg_error_5_q2 = mean(error_5(2,:));
avg_error_5_q3 = mean(error_5(3,:));
avg_error_10_q1 = mean(error_10(1,:));
avg_error_10_q2 = mean(error_10(2,:));
avg_error_10_q3 = mean(error_10(3,:));
avg_error_15_q1 = mean(error_15(1,:));
avg_error_15_q2 = mean(error_15(2,:));
avg_error_15_q3 = mean(error_15(3,:));

% Tinh sai so trung binh toa do
avg_error_5_xE = mean(x_err_5);
avg_error_5_yE = mean(y_err_5);
avg_error_5_zE = mean(z_err_5);
avg_error_10_xE = mean(x_err_10);
avg_error_10_yE = mean(y_err_10);
avg_error_10_zE = mean(z_err_10);
avg_error_15_xE = mean(x_err_15);
avg_error_15_yE = mean(y_err_15);
avg_error_15_zE = mean(z_err_15);

