function [ t,pos,vel,acc ] = plot1D(s,mode)
%     clc;
%     close all;

    if nargin==1
        m = 0;
    end

    if nargin==2
        if strcmpi(mode,'debug')==1
            m = 1;
        else
            m = 0;
        end
    end

    D = load(s);
    
    t = D(:,1);
    dt = t(2)-t(1);

    pos = D(:,2);
    vel = D(:,3);
    acc = D(:,4);
    jer = D(:,5);

    for i=1:length(t)
        if i==1
            vel_d(i) = vel(i);
            acc_d(i) = acc(i);
            jer_d(i) = jer(i);
        else
            vel_d(i) = (pos(i)-pos(i-1))/dt;
            acc_d(i) = (vel(i)-vel(i-1))/dt;
            jer_d(i) = (acc(i)-acc(i-1))/dt;
        end
    end


    figure(1)

    subplot(411)    
    hold on;
    plot(t,pos);
    ylabel('p');
    subplot(412)
    plot(t,vel);hold on;
%     plot(t,vel_d,'--');
    ylabel('v');
    subplot(413)
    plot(t,acc);hold on;
%     plot(t,acc_d,'--')
    ylabel('a');
    subplot(414)
    plot(t,jer);hold on;
%     plot(t,jer_d,'--');
    ylabel('j');
    xlabel('time(s)');

    if m==1
        figure(2)
        subplot(412)
        plot(t,vel_d,'--');
        subplot(413)
        plot(t,acc_d,'--')
        subplot(414)
        plot(t,jer_d,'--');
    end
end