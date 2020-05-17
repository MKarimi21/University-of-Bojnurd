function z=Cost(per,D)
z=0;
for i=1:size(D,1)-1
    z=z+D(per(i),per(i+1));
end
z=z+D(per(i+1),per(1));   
end