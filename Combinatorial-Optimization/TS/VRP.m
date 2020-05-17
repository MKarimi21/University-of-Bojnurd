function route=VRP(per)
model=Input;
demand=model.D;
cap=model.Cap;
sumd=0;
h=1;
route{h}=[];
index= per==1;
per(index)=[];
for i=1:model.N-1
    sumd=sumd+demand(per(i));
    if sumd>cap
        sumd=demand(per(i));
        h=h+1;
        route{h}=per(i);
    else
        route{h}=[route{h} per(i)];
    end 
end