% Thiet lap mang Neural Network
%   T - input data.
%   P - target data.

x = [E_tinhlai_matrix; E_tinhlai_matrix2; E_tinhlai_matrix3; E_tinhlai_matrix4; E_tinhlai_matrix5];
t = [q_tinhlai_matrix; q_tinhlai_matrix2; q_tinhlai_matrix3; q_tinhlai_matrix4; q_tinhlai_matrix5]';

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
genFunction(net,'pretrained_5');
y = pretrained_5(x);
