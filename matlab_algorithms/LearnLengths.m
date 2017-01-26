function [v_length, a_length] = LearnLengths(data)

extreme_over = 100;
ddatadt = [0; diff(data)].^5.*data.*sign(data);
ddatadt = ddatadt * max(data)/max(ddatadt);
a_length = [];
v_length = [];
for s = [1 -1]
    wall_times = [];
    wall_steeps = [];
    for i = 1:length(ddatadt)
        nearby = ddatadt(max(1,i-extreme_over):min(end,i+extreme_over)).*(data(max(1,i-extreme_over):min(end,i+extreme_over))*s>0);
        if s*data(i)>0 && (all(ddatadt(i) >= nearby) || all(ddatadt(i) <= nearby))
            wall_times = [wall_times i];
            wall_steeps = [wall_steeps ddatadt(i)];
        end
    end

    figure
    plot(data)
    hold on
    stem(wall_times, wall_steeps)
    plot(ddatadt)

    peak_lengths = [];
    peak_steeps = [];
    peak_heights = [];
    for i = 2:length(wall_times)
        len = wall_times(i)-wall_times(i-1);
        height = sign(data(wall_times(i-1)))*max(abs(data(wall_times(i-1):wall_times(i))))-(data(wall_times(i-1))+data(wall_times(i)))/2;
        if ( wall_steeps(i-1)*wall_steeps(i) < 0 && s*data(wall_times(i-1))>0 && s*data(wall_times(i))>0 && s*wall_steeps(i-1)>0 && s*wall_steeps(i)< 0 && len < 75)% && s*height > abs(median(data)) )
            peak_lengths = [peak_lengths; len];
            peak_steeps = [peak_steeps; wall_steeps(i-1) - wall_steeps(i)];
            %peak_heights = [peak_heights data(floor((wall_times(i-1)+wall_times(i))/2))-(data(wall_times(i-1))+data(wall_times(i)))/2];
            peak_heights = [peak_heights; height];
        end
    end

    [idx,C] = kmeans([peak_lengths/mean(peak_lengths) peak_heights/mean(peak_heights) peak_steeps/mean(peak_steeps)],2);
    figure
    plot3(peak_lengths(idx==1),peak_heights(idx==1),peak_steeps(idx==1),'r.','MarkerSize',12)
    hold on
    plot3(peak_lengths(idx==2),peak_heights(idx==2),peak_steeps(idx==2),'b.','MarkerSize',12)
    plot3(C(:,1)*mean(peak_lengths),C(:,2)*mean(peak_heights), C(:,3)*mean(peak_steeps),'kx','MarkerSize',15,'LineWidth',3)
    grid
    
    v_length = [v_length min(C(:,1)*mean(peak_lengths))];
    a_length = [a_length max(C(:,1)*mean(peak_lengths))];
end
v_length
a_length

v_length = mean(v_length);
a_length = mean(a_length);
end