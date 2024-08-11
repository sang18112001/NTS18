function [Xd,dXd]=quydao11(t)

%% Quy dao 1
Xd(1) = 0.2 + 0.02*sin(t); %m
Xd(2) = 0.1 + 0.02*cos(t); %m
Xd(3) = 0; %m

dXd(1) = 0.02*cos(t);
dXd(2) = -0.02*sin(t);
dXd(3) = 0;                         
end