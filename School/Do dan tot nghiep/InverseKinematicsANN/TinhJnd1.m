function Jnd = TinhJnd1(q1, q2, q3)
L1=0.08;
L2=0.128;
L3=0.135;

% Jacobian
J11 = (L3*sin(q2)*sin(q3)-L3*cos(q2)*cos(q3)-L2*cos(q2))*sin(q1);
J12 = cos(q1)*(-L3*cos(q3)*sin(q2)-L2*sin(q2)-L3*sin(q3)*cos(q2));
J13 = cos(q1)*(-L3*cos(q2)*sin(q3)-L3*sin(q2)*cos(q3));

J21 = (-L3*sin(q2)*sin(q3)+L3*cos(q2)*cos(q3)+L2*cos(q2))*cos(q1);
J22 = sin(q1)*(-L3*cos(q3)*sin(q2)-L2*sin(q2)-L3*sin(q3)*cos(q2));
J23 = sin(q1)*(-L3*cos(q2)*sin(q3)-L3*sin(q2)*cos(q3));

J31 = 0;
J32 = -L3*sin(q3)*sin(q2)+L3*cos(q3)*cos(q2)+L2*cos(q2);
J33 = L3*cos(q2)*cos(q3)-L3*sin(q2)*sin(q3);


J = [J11 J12 J13; J21 J22 J23; J31 J32 J33];

% Transpose Jacobian
Jt = J';

% Pseudo-inverse using backslash operator
Jnd = Jt*inv(J*Jt);
end
