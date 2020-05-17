function h=PlotTour(model,tour)

    x1=model.Pos(:,1);
    y1=model.Pos(:,2);
    
    if ~isempty(tour)
        tour=[tour tour(1)];
    end
    x2=x1(tour);
    y2=y1(tour);

    h={0,0};
    
    h{1}=plot(x2,y2,'g');
    hold on;
    h{2}=plot(x1,y1,'r.','MarkerSize',10);
    axis equal;   
end