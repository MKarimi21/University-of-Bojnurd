function [xx] = Move3(x,R1,R2)
a=max(R1,R2);
b=min(R1,R2);
    t=x(b);
    for k=b:a-1
        x(k)=x(k+1);
    end
    x(a)=t;
xx=x;
end