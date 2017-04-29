% This function takes in a single channel of a cardiac signal and, for both
% + and - data, computes a appropriate lengths for atrial and ventricular
% peaks using K-means and suggests which type of peak should be detected
% first

%Inputs:
% data - a vector containing prerecorded data

%Outputs:
% v_lengths - a appropriate ventricular detection durations for + (first
%             element) and - (second element) data
% a_lengths - a appropriate atrial detection durations for + (first
%             element) and - (second element) data
% first - 1 if we should detect ventricles first, 2 if we should detect
%         atria first, for both + (first element) and - (second element) data

function [v_lengths, a_lengths, first] = LearnLengths(data)

%featurize the data into a list of peaks with [width, height] values by
%locating edges at the pseudo-steepest points in the waveform (extrema in
%the weigthed derivative), and then featurizing peaks as appropriate pairs of
%rising and falling edges

extreme_over = 100; 
ddatadt = [0; diff(data)].^2.*sign([0; diff(data)]).*data.*sign(data);
ddatadt = ddatadt * max(data)/max(ddatadt);
a_lengths = [];
v_lengths = [];
first = [];
for flip = [+1 -1]
    wall_times = [];
    wall_steeps = [];
    for i = 1:length(ddatadt)
        nearby = ddatadt(max(1,i-extreme_over):min(end,i+extreme_over)).*(data(max(1,i-extreme_over):min(end,i+extreme_over))*flip>0);
        if flip*data(i)>0 && (all(ddatadt(i) >= nearby) || all(ddatadt(i) <= nearby))
            wall_times = [wall_times i];
            wall_steeps = [wall_steeps ddatadt(i)];
        end
    end
    
    if (false)
        figure
        plot(data)
        hold on
        plot(ddatadt)
        stem(wall_times, wall_steeps)
        xlabel('time (samples)','Fontsize',14)
        legend({'input waveform', 'weighted derivative of input', 'steepest points'},'Fontsize',14)
        title('Finding the steepest points','Fontsize',18)
    end

    peak_lengths = [];
    peak_steeps = [];
    peak_heights = [];
    peak_highests = [];
    for i = 2:length(wall_times)
        len = wall_times(i)-wall_times(i-1);
        highest = sign(data(wall_times(i-1)))*max(abs(data(wall_times(i-1):wall_times(i))));
        height = highest - (data(wall_times(i-1))+data(wall_times(i)))/2;
        if ( wall_steeps(i-1)*wall_steeps(i) < 0 && flip*data(wall_times(i-1))>0 && flip*data(wall_times(i))>0 && flip*wall_steeps(i-1)>0 && flip*wall_steeps(i)< 0 && len < 75)% && s*height > abs(median(data)) )
            peak_lengths = [peak_lengths; len];
            peak_steeps = [peak_steeps; wall_steeps(i-1) - wall_steeps(i)];
            peak_heights = [peak_heights; height];
            peak_highests = [peak_highests; highest];
        end
    end
    
    %remove outliers
	% simpler version:
    % outliers = abs(zscore([peak_lengths peak_heights peak_steeps]))>3;
    zscores = zscore([peak_lengths peak_heights peak_steeps]);
    zscorenorms = sqrt(sum(zscores.^2,2));
    outliers = zscorenorms > 2.5;
    to_removes = [];
    for i=1:length(peak_lengths)
        if any(outliers(i,:))
            to_removes = [to_removes i];
        end
    end
    if (length(to_removes)/length(peak_lengths)>1/10)
        disp('Excluding a lot of outliers')
    end
    peak_lengths(to_removes) = [];
    peak_steeps(to_removes) = [];
    peak_heights(to_removes) = [];
    peak_highests(to_removes) = [];
    
    if (length(peak_lengths)<=10)
        v_lengths = [v_lengths 0];
        a_lengths = [a_lengths 0];
        first = [first 1];
        continue
    end
    
    [idx,C] = kmeans([peak_lengths/mean(peak_lengths) peak_heights/mean(peak_heights)],2);% peak_steeps/mean(peak_steeps)],2);
    [~,vind] = max(abs(C(:,2))./C(:,1).^2); %figure out which are the ventricles based on height/length^2 ratio
    
    % if the two clusters centers are too close, or there too few in either
    % cluster, then they are probably all ventricles
    if (abs(C(1,1)-C(2,1))*mean(peak_lengths)<2.0 || numberOfNonZeros(idx==1)<length(idx)/5 || numberOfNonZeros(idx==2)<length(idx)/5)
        v_lengths = [v_lengths round(mean(peak_lengths))];
        a_lengths = [a_lengths 0];
        first = [first 1];
    else
        v_lengths = [v_lengths round(C(vind,1)*mean(peak_lengths))];
        a_lengths = [a_lengths round(C(3-vind,1)*mean(peak_lengths))];
        first = [first 1+(abs(mean(peak_highests(idx==vind)))<abs(mean(peak_highests(idx==3-vind))))];
    end
        
    if (true)
        figure
        hold on
    %     plot3(peak_lengths(idx==vind),peak_heights(idx==vind),peak_steeps(idx==vind),'r.','MarkerSize',12)
    %     plot3(peak_lengths(idx==3-vind),peak_heights(idx==3-vind),peak_steeps(idx==3-vind),'b.','MarkerSize',12)
    %     plot3(C(:,1)*mean(peak_lengths),C(:,2)*mean(peak_heights), C(:,3)*mean(peak_steeps),'kx','MarkerSize',15,'LineWidth',3)
        plot(peak_lengths(idx==vind),peak_heights(idx==vind),'r.','MarkerSize',12)
        plot(peak_lengths(idx==3-vind),peak_heights(idx==3-vind),'b.','MarkerSize',12)

        plot(C(1,1)*mean(peak_lengths),C(1,2)*mean(peak_heights),'rx','MarkerSize',15,'LineWidth',3)
        plot(C(2,1)*mean(peak_lengths),C(2,2)*mean(peak_heights),'bx','MarkerSize',15,'LineWidth',3)
        hlegend = legend('ventricles','atria','Cv','Ca','FontSize',20);
        title('K-means discrimination between peak types','Fontsize',18)
        set(hlegend,'FontSize',20)
        ylabel('peak heights','FontSize',20); xlabel('peak lengths (ms)','FontSize',20)
        
        grid
    end
end
v_lengths
a_lengths
first

end
