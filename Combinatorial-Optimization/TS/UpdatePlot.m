function UpdatePlot(h,model,tour)

    x2=model.Pos(tour,1);
    y2=model.Pos(tour,2);

    set(h{1},'XDataSource','x2');
    set(h{1},'YDataSource','y2');

    refreshdata(h(1),'caller');
    
end