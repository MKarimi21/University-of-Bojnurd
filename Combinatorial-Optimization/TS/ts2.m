clc;
clear
close all;
%% Problem Definition

model=Input();
N=model.N;                   

%% TS Parameters
tic
time=cputime;
MaxIt=20*N;
TLP=N;
%% Initialization
TL=zeros(N*(N-1)/2);
TabuL=100;
Sol.rnd=randperm(N);
Sol.Position=VRP(Sol.rnd);
Sol.Cost=Cost(Sol.Position);
BestSol=Sol;
BestCost=zeros(MaxIt,1);
V=size(BestSol.Position,2); %Number of Vehicle
per1=[];
for k=1:V
   per1=[per1,1,BestSol.Position{k}(1,:),1];
end
figure;
hPlots=PlotTour(model,per1);
pause(0.01);
%% Initial Solution Plot



%% TS
www=0;
for it=1:MaxIt
    BestNewSol.Position=[];
    BestNewSol.Cost=inf;
    
    BestMove=0;
    for i=1:TabuL
            ind=randsample(1:N,2);
            ind1=ind(1);
            ind2=ind(2);
            if TL(ind1,ind2)==0
              NewSol.rnd=Move1(Sol.rnd,ind1,ind2);
              NewSol.Pos=VRP(NewSol.rnd);
              NewSol.Cost=Cost(NewSol.Pos);
              if NewSol.Cost<BestNewSol.Cost
                BestNewSol=NewSol;
                BestMove(1)=ind1;
                BestMove(2)=ind2;
              end
              NewSol.rnd=Move2(Sol.rnd,ind1,ind2);
              NewSol.Pos=VRP(NewSol.rnd);
              NewSol.Cost=Cost(NewSol.Pos);
            if NewSol.Cost<BestNewSol.Cost
                BestNewSol=NewSol;
                BestMove(1)=ind1;
                BestMove(2)=ind2;
            end
              NewSol.rnd=Move3(Sol.rnd,ind1,ind2);
              NewSol.Pos=VRP(NewSol.rnd);
              NewSol.Cost=Cost(NewSol.Pos);
              if NewSol.Cost<BestNewSol.Cost
                BestNewSol=NewSol;
                BestMove(1)=ind1;
                BestMove(2)=ind2;
              end            
            end
    end
    TL=max(TL-1,0);
    TL(BestMove(1),BestMove(1))=TLP;
    Sol=BestNewSol;
    if Sol.Cost<BestSol.Cost
        BestSol=Sol;
        www=it;
    end
    
    BestCost(it)=BestSol.Cost; 
V=size(BestSol.Pos,2); %Number of Vehicle
per1=[];
for k=1:V
   per1=[per1,1,BestSol.Pos{k}(1,:),1];
end
        UpdatePlot(hPlots,model,per1);
        pause(0.01);     
 disp(['Iteration ' num2str(it) ': Best Cost = ' num2str(BestCost(it))]); 
if cputime-time>1000
    break
end
end

%% Results
toc
figure;
plot(BestCost);
xlabel('Iteration');
ylabel('Best Tour Length');
BestSol.Cost
BestSol.Pos