function [Xd,dXd]=quydao7(t)

Xd(1) = 0.145 + 0.04*cos(t); %m
Xd(2) =  0; %m
Xd(3) = 0.1 + 0.04*sin(t); %m

dXd(1) = -0.04*sin(t);
dXd(2) = 0;
dXd(3) = 0.04*cos(t);                          
end