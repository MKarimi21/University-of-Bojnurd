function z=Cost(Sol)
model=Input;
C=model.C;
V=size(Sol,2); %Number of Vehicle
z=0;
    for k=1:V
        z=z+C(1,Sol{k}(1));
        for i=1:length(Sol{k})-1
            z=z+C(Sol{k}(i),Sol{k}(i+1));
        end
        z=z+C(Sol{k}(end),1);   
    end
end