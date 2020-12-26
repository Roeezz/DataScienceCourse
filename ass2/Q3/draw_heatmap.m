function h=draw_heatmap(xvals, yvals, label_table, Xtrain, Ytrain)
    h = heatmap(label_table);
    colormapeditor
    grid off
    hs = struct(h);
    hs.XAxis.TickValues = [];
    hs.YAxis.TickValues = [];
    
    Xpos = Xtrain(Ytrain > 0,:);
    Xneg = Xtrain(Ytrain < 0,:);
    ax = axes();
    hold on
    plot(Xpos(:,1), Xpos(:,2), 'whiteo', 'MarkerFaceColor', 'w');
    plot(Xneg(:,1), Xneg(:,2), 'blacko', 'MarkerFaceColor', 'black');
    hold off
    ax.Color = 'none';
    ax.XTick = [];
    ax.YTick = [];
end