function [Xd,dXd]=quydao14(t)

%% Quy dao 1
Xd(1) = 0.1 + 0.02*sin(t); %m
Xd(2) = 0; %m
Xd(3) = 0.15 + 0.02*cos(t); %m

dXd(1) = 0.02*cos(t);
dXd(2) = 0;
dXd(3) = -0.02*sin(t);                         
end