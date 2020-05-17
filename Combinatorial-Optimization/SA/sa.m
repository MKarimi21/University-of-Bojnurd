clc
clear
close all
% Tuned parameter
T0=1000;
T1=0.0001;
R=0.98;
Markov=20;
% Initialization
tic
Data=Input;
N=size(Data.D,1);
Sol.per=randperm(N);
Sol.ofv=Cost(Sol.per,Data.D);
Best=Sol;
figure;
hPlots=PlotTour(Data,Sol.per);
pause(0.01);
T=T0; % Current temperature
h=0;
while T>=T1
    Nbest.ofv=inf;
    for i=1:Markov
        Nsol.per=CreateN(Best.per);
        Nsol.ofv=Cost(Nsol.per,Data.D);
        if Nsol.ofv<=Nbest.ofv
            Nbest=Nsol;
        end
    end
    if Nbest.ofv<=Best.ofv
        Best=Nbest;
    elseif exp(-(Nbest.ofv-Best.ofv)/T) > rand
        Best=Nbest;
    end
    T=R*T;
    h=h+1;
    BSol(h)=Best;
        UpdatePlot(hPlots,Data,Best.per);
        pause(0.01);   
end
for i=1:h
    Bplot(i)=BSol(i).ofv;
end
toc
PlotTour(Data,Best.per);
disp(['The best known objective value is: ' num2str(min(Bplot))]);
Best.per
figure
plot(Bplot)
