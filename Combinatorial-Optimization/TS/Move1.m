function tour2=Move1(tour1,i,j)
    tour2=tour1;
temp=tour2(i);
tour2(i)=tour2(j);
tour2(j)=temp;
end