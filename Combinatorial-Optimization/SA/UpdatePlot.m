function UpdatePlot(h,model,tour)

    if ~isempty(tour)
        tour=[tour tour(1)];
    end
    x2=model.pos(tour,1);
    y2=model.pos(tour,2);

    set(h{1},'XDataSource','x2');
    set(h{1},'YDataSource','y2');

    refreshdata(h(1),'caller');
    
end