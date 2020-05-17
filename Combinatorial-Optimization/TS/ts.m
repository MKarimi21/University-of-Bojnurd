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
TL0=N;
%% Initialization
TL=zeros(N*(N-1)/2);
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
%% TS
www=0;
for it=1:MaxIt
    BestNewSol.Position=[];
    BestNewSol.Cost=inf;
    BestMove=0;
    k=0;
    for i=1:N-1
        for j=i+1:N
            k=k+1;
            h=randi(2);
            if TL(k)==0
           switch h
            case 1
              NewSol.rnd=Move1(Sol.rnd,i,j);
              NewSol.Pos=VRP(NewSol.rnd);
              NewSol.Cost=Cost(NewSol.Pos);
              if NewSol.Cost<BestNewSol.Cost
                BestNewSol=NewSol;
                BestMove=k;
              end
            case 2
              NewSol.rnd=Move2(Sol.rnd,i,j);
              NewSol.Pos=VRP(NewSol.rnd);
              NewSol.Cost=Cost(NewSol.Pos);
            if NewSol.Cost<BestNewSol.Cost
                BestNewSol=NewSol;
                BestMove=k;
            end
            end
           end
        end
    end
    TL=max(TL-1,0);
    TL(BestMove)=TL0;
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
if cputime-time>5000
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