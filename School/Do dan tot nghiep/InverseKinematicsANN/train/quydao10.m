function [Xd,dXd]=quydao10(t)

%% Quy dao 1
Xd(1) = 0.12 + 0.03*cos(t); %m
Xd(2) =  0.12 + 0.03*sin(t); %m
Xd(3) = 0; %m

dXd(1) = -0.03*sin(t);
dXd(2) = 0.03*cos(t);
dXd(3) = 0;                         
end