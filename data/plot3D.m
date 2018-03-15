function [ t,pos,vel,acc ] = plot3D(s,mode)
%     clc;
%     close all;

    if nargin==1
        m = 0;
    end

    if nargin==2
        if strcmpi(mode,'debug')==1
            m = 1;
        else
            disp('unknown plot mode');
            m = 0;
        end
    end
    
    D = load(s);

    t = D(:,1);
    dt = t(2)-t(1);

    pos = D(:,2:4);
    vel = D(:,5:7);
    acc = D(:,8:10);

    pos_r = sqrt(pos(:,1).^2 + pos(:,2).^2 + pos(:,3).^2);
    vel_r = sqrt(vel(:,1).^2 + vel(:,2).^2 + vel(:,3).^2);
    acc_r = sqrt(acc(:,1).^2 + acc(:,2).^2 + acc(:,3).^2);

    for i=1:length(t)
        if i==1
            vel_d(i,:) = vel(i,:);
            acc_d(i,:) = acc(i,:);
        else
            vel_d(i,:) = (pos(i,:)-pos(i-1,:))/dt;
            acc_d(i,:) = (vel(i,:)-vel(i-1,:))/dt;
        end
    end

    vel_d_r = sqrt(vel_d(:,1).^2 + vel_d(:,2).^2 + vel_d(:,3).^2);
    acc_d_r = sqrt(acc_d(:,1).^2 + acc_d(:,2).^2 + acc_d(:,3).^2);

    figure(1)
    hold on;
    plot3(pos(:,1),pos(:,2),pos(:,3),'k');
    xlabel('x');
    ylabel('y');
    zlabel('z');
    grid on;

    figure(2)
    subplot(311)
    hold on;
    plot(t,pos);
    ylabel('pos');
    legend('x','y','z');
    subplot(312)
    hold on;
    plot(t,vel);
    ylabel('vel');
    subplot(313)
    hold on;
    plot(t,acc);
    ylabel('acc');
    xlabel('time(s)');

    figure(3)
    subplot(311)
    hold on;
    plot(t,pos_r);
    ylabel('pos');
    subplot(312)
    hold on;
    plot(t,vel_r);
    ylabel('vel');
    subplot(313)
    hold on;
    plot(t,acc_r);
    ylabel('acc');
    xlabel('time(s)');

    if m==1
        figure(2)
        subplot(312)
        plot(t,vel_d,'--');
        subplot(313)
        plot(t,acc_d,'--');

        figure(3)
        subplot(312)
        plot(t,vel_d_r,'--');
        subplot(313)
        plot(t,acc_d_r,'--');
    end


end