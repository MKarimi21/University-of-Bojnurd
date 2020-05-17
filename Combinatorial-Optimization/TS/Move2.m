function tour2=Move2(tour1,i,j)
tour2=tour1;
tour2(i:j)=tour2(j:-1:i);
end