function [Xd,dXd]=quydao2(t)
%[L3,L4,R]=parameter1();

%% Quy dao 2
Xd(1) = 0.2 + 0.06*sin(t); 
Xd(2) = 0; 
Xd(3) = 0.1 + 0.06*cos(t);

dXd(1) = 0.06*cos(t);
dXd(2) = 0;
dXd(3) = -0.06*sin(t);
end