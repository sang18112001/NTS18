function [xE,yE,zE]=donghocthuan(q1,q2,q3)
    L1=0.08;
    L2=0.128;
    L3=0.135;
    xE=((L3 .* cos(q3) + L2) .* cos(q2) - L3 .* sin(q2) .* sin(q3)) .* cos(q1);
    yE=sin(q1) .* ((L3 .* cos(q3) + L2) .* cos(q2) - L3 .* sin(q2) .* sin(q3));
    zE=(L3 .* cos(q3) + L2) .* sin(q2) + cos(q2) .* L3 .* sin(q3) + L1;
end