function [A,Z]= KnapsackR(V,W,Cap)
Item_No=length(W);
Rand_Item=randperm(Item_No);
SumW=0;
A=zeros(1,Item_No);
iter=1;
SumW=SumW+W(Rand_Item(iter));
while SumW<=Cap
    B(iter)=Rand_Item(iter);
    iter=iter+1;
    SumW=SumW+W(Rand_Item(iter));
end
A(B)=1;
Z=sum(V(B));
end
