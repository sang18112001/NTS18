function [Xd,dXd]=quydao15(t)

%% Quy dao 1
Xd(1) = 0.145 + 0.03*cos(t); %m
Xd(2) = 0; %m
Xd(3) = 0.09 + 0.03*sin(t); %m

dXd(1) = -0.03*sin(t);
dXd(2) = 0;
dXd(3) = 0.03*cos(t);                         
end