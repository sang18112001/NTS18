clc

%% Parameters
L1=0.08;
L2=0.128;
L3=0.135;

%% Vi tri ban dau cua diem thao tac E
xx_0 = 0.1860;
yy_0 = 0;
zz_0 = 0.0751;
X_0=[xx_0; yy_0; zz_0];% Vec to vi tri E

%% Gia tri gan dung cua goc khop ban dau, su dung auto cad de xac dinh
q1_0 = 0;
q2_0 = pi/4;
q3_0 = -pi/2;

%% Tinh chinh xac gia tri goc khop ban dau q_0
for n=1:1:10^10

    Jnd_0 = TinhJnd1(q1_0,q2_0,q3_0); % Tinh ma tran Jacobian theo q_0

    [xE_0,yE_0,zE_0] = donghocthuan(q1_0,q2_0,q3_0);% tinh lai xx_Z0, yy_0 theo q_0 
    XX_0 = [xE_0;yE_0;zE_0];

    delta_q_0 = Jnd_0*(X_0 - XX_0);% Tinh gia tri hieu chinh delta_q_0
    % Tinh lai cac gia tri q_0 hieu chinh
    q1_0 = q1_0 + delta_q_0(1,1);
    q2_0 = q2_0 + delta_q_0(2,1);
    q3_0 = q3_0 + delta_q_0(3,1);

    % khai bao do chinh xac can thiet va tao vong lap tinh toan
    ss=10^(-10);
    if abs(delta_q_0(1,1)) < ss
        if abs(delta_q_0(2,1)) < ss
            if abs(delta_q_0(3,1)) < ss
                break
            end
        end
    end
    n;
end

%% Xac nhan cac gia tri q_0 chinh xac sau khi hieu chinh
q1=q1_0;
q2=q2_0;
q3=q3_0;

%% Thuat toan ap dung cho toan bo quy dao x, y, z cho truoc
% bien thoi gian
dt = 0.1; % Khai bao buoc thoi gian chay

t_max = 10; % Khai bao thoi gian

num_iterations = round(t_max / dt) + 1;
E_tinhlai_matrix2 = zeros(num_iterations, 3);
q_tinhlai_matrix2 = zeros(num_iterations, 3);

%syms tt
for idx = 1:num_iterations
    t = (idx - 1)*dt;
    [Xd,dXd]=quydao2(t); % Vi tri va van toc diem E cho truoc theo thoi gian t
    Jnd=TinhJnd1(q1,q2,q3); % Tinh ma tran Jacobian theo q
    dX=[dXd(1);dXd(2);dXd(3)]; % Vec to van toc diem thao tac E cho truoc
    q=[q1;q2;q3];
    dq=Jnd*dX; % Van toc goc khop

    for k=1:1:10^5
        q_k=q + dq*dt; % Tinh gia tri goc khop trong vong lap bien k
        q1=q_k(1,1);
        q2=q_k(2,1);
        q3=q_k(3,1);
        Jnd_real=TinhJnd1(q1,q2,q3); % Tinh lai gia tri ma tran Jacobian
        [xE,yE,zE]=donghocthuan(q1,q2,q3); % Tinh lai quy dao diem E tu q tim duoc
        Xq=[xE;yE;zE];
        [Xd,dXd]=quydao2(t);% Goi quy dao mong muon
        Xm=[Xd(1);Xd(2);Xd(3)];
        Delta_q = Jnd_real*(Xm - Xq);% Tinh sai lech goc khop
        % khai bao do chinh xac can thiet
        ss1=10^(-5);
        if abs(Delta_q(1,1)) < ss1
            if abs(Delta_q(2,1)) < ss1
                if abs(Delta_q(3,1)) < ss1
                    break
                end
            end
        end
    end
    k;

    % Tinh lai gia tri goc khop chinh xac
    q1 = q1 + Delta_q(1,1);
    q2 = q2 + Delta_q(2,1);
    q3 = q3 + Delta_q(3,1);

    % Tính lại quỹ đạo lần nữa
    [xE_tinhlai,yE_tinhlai,zE_tinhlai]=donghocthuan(q1,q2,q3);
    
    %% MO DAU PHAN THEM MOI NGAY 17/05/2021
    % Thiet lap vecto sai so quy dao
    eX=xE-xE_tinhlai;
    eY=yE-yE_tinhlai;
    eZ=zE-zE_tinhlai;
    
    E_tinhlai_matrix2(idx, :) = [xE_tinhlai, yE_tinhlai, zE_tinhlai];
    q_tinhlai_matrix2(idx, :) = [q1, q2, q3];
    %% Ve do thi
    % Do thi cac bien khop - ket qua bai toan dong hoc nguoc
    figure(1)
        plot(t,q1,'r.',t,q2,'g.',t,q3,'b.')
        xlabel('time (sec)')
        ylabel('Bien khop q1,q2,q3')
        hold on
        grid on
    % Do thi quy dao thao tac
    %% KET THUC PHAN THEM NGAY 17/05/2021

    %% Bieu dien co cau chuyen dong de kiem tra tinh chinh xac tu q1, q2, q3 tim duoc
    figure(2)
    P1=[0 0 0];
    % Mo phong quy dao
    curve=animatedline('Linewidth',1.5);
    set(gca,'xlim',[-0.1 0.3],'Zlim',[0 0.25]);
    view(43,24);
    xlabel('X(m)');
    ylabel('Y(m)');
    zlabel('Z(m)');
    
    for t_q1=0:0.01:1
        x_khau_1=0;
        y_khau_1=0;
        z_khau_1=L1*t_q1;
        plot3(x_khau_1,y_khau_1,z_khau_1,'c.')
        grid on
        hold on
    end
    for t_q2=0:0.08:1
        x_khau_2=cos(q1)*L2*cos(q2)*t_q2;
        y_khau_2=sin(q1)*L2*cos(q2)*t_q2;
        z_khau_2=L2*sin(q2)*t_q2+L1;
        plot3(x_khau_2,y_khau_2,z_khau_2,'y.')
        hold on
        grid on
    end
    for t_q3 = 0:0.08:1
        x_khau_3= cos(q1)*(L3*cos(q2)*cos(q3)*t_q3-L3*sin(q3)*t_q3*sin(q2)+L2*cos(q2));
        y_khau_3= sin(q1)*(L3*cos(q2)*cos(q3)*t_q3-L3*sin(q3)*t_q3*sin(q2)+L2*cos(q2));
        z_khau_3= sin(q2)*L3*cos(q3)*t_q3+cos(q2)*L3*sin(q3)*t_q3+L2*sin(q2)+L1;
        plot3(x_khau_3,y_khau_3,z_khau_3,'g.',xE_tinhlai,yE_tinhlai,zE_tinhlai,'ro')
%         plot3(xE_tinhlai,yE_tinhlai,zE_tinhlai,'bo')
        grid on
        hold on
    end

    M(:,:) = getframe;
    pause(0.05)
    hold on
    grid on
end

