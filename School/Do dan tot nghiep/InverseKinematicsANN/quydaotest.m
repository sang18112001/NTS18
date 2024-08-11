function [Xd,dXd]=quydaotest(t)
%[L3,L4,R]=parameter1();

%% Quy dao 1
Xd(1) = 0.145 + 0.02*cos(t); %m
Xd(2) =  0; %m
Xd(3) = 0.09 + 0.02*sin(t); %m

dXd(1) = -0.02*sin(t);
dXd(2) = 0;
dXd(3) = 0.02*cos(t);                          
end