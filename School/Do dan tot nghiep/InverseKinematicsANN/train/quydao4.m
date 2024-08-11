function [Xd,dXd]=quydao4(t)
%[L3,L4,R]=parameter1();

%% Quy dao 1
Xd(1) = 0.1 + 0.05*cos(t); %m
Xd(2) =  0.1 + 0.05*sin(t); %m
Xd(3) = 0; %m

dXd(1) = -0.05*sin(t);
dXd(2) = 0.05*cos(t);
dXd(3) = 0;
end