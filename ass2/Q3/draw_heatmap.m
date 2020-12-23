function h=draw_heatmap(xvals, yvals, label_table, Xtrain, Ytrain)
    Xpos = Xtrain(Ytrain > 0,:);
    Xneg = Xtrain(Ytrain < 0,:);
    
    h = heatmap(xvals, yvals, label_table);
    colormapeditor
    grid off
    colormapeditor
    hs = struct(h);
    warning(old_warning_state);
    hs.XAxis.TickValues = [];
    hs.YAxis.TickValues = [];
    ax = axes();
    hold on
    plot(Xpos(:,1), Xpos(:,2), 'whiteo', 'MarkerFaceColor', 'w');
    plot(Xneg(:,1), Xneg(:,2), 'blacko', 'MarkerFaceColor', 'black');
    hold off
    ax.Color = 'none';
    ax.XTick = [];
    ax.YTick = [];
end