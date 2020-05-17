function q=CreateN(p)
n=randsample(1:length(p),2);
m=randi(2);
switch m
    case 1
        q=Swap(p,n(1),n(2));
    case 2
        q=Reverse(p,n(1),n(2));
end
end

function q=Swap(p,n1,n2)
q=p;
q([n1,n2])=q([n2,n1]);
end

function q=Reverse(p,n1,n2)
m1=min(n1,n2);
m2=max(n1,n2);
q=[p(1:m1-1),p(m2:-1:m1),p(m2+1:end)];
end