% Thiet lap mang Neural Network
%   T - input data.
%   P - target data.

x = [E_tinhlai_matrix; E_tinhlai_matrix3; E_tinhlai_matrix4; E_tinhlai_matrix5; ...
    E_tinhlai_matrix6; E_tinhlai_matrix7; E_tinhlai_matrix8; E_tinhlai_matrix9; E_tinhlai_matrix10; ...
    E_tinhlai_matrix11; E_tinhlai_matrix12; E_tinhlai_matrix13; E_tinhlai_matrix14; E_tinhlai_matrix15; E_tinhlai_matrix2]';
t = [q_tinhlai_matrix; q_tinhlai_matrix3; q_tinhlai_matrix4; q_tinhlai_matrix5; ...
    q_tinhlai_matrix6; q_tinhlai_matrix7; q_tinhlai_matrix8; q_tinhlai_matrix9; q_tinhlai_matrix10; ...
    q_tinhlai_matrix11; q_tinhlai_matrix12; q_tinhlai_matrix13; q_tinhlai_matrix14; q_tinhlai_matrix15; q_tinhlai_matrix2]';

% Chon thuat toan huan luyen
trainFcn = 'trainlm';

% Tao mo hinh mang
hiddenLayerSize = [50];
net = fitnet(hiddenLayerSize,trainFcn);

% Chon tin hieu
net.input.processFcns = {'removeconstantrows','mapminmax'};
net.output.processFcns = {'removeconstantrows','mapminmax'};

% Phan chia du lieu: 70% cho huan luyen; 15% cho kiem tra; 15% cho danh gia
net.divideFcn = 'dividerand';  
net.divideMode = 'sample';  
net.divideParam.trainRatio = 80/100;
net.divideParam.valRatio = 10/100;
net.divideParam.testRatio = 10/100;

% Chon ham hop ly la sai so trung binh binh phuong
net.performFcn = 'mse';  % Mean Squared Error

% Chon ham plot
net.plotFcns = {'plotperform','plottrainstate','ploterrhist', ...
    'plotregression', 'plotfit'};

% Huan luyen
[net,tr] = train(net,x,t);

% Kiem tra
y = net(x);
e = gsubtract(t,y);
performance = perform(net,t,y);

% Danh gia hieu qua
trainTargets = t .* tr.trainMask{1};
valTargets = t .* tr.valMask{1};
testTargets = t .* tr.testMask{1};
trainPerformance = perform(net,trainTargets,y);
valPerformance = perform(net,valTargets,y);
testPerformance = perform(net,testTargets,y);
view(net)

% Plots
%figure, plotperform(tr)
%figure, plottrainstate(tr)
%figure, ploterrhist(e)
%figure, plotregression(t,y)
%figure, plotfit(net,x,t)
% Tao ham de su dung trong chuong trinh main
genFunction(net,'pretrained_15_test');
y = pretrained_15_test(x);
