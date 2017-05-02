% This function takes a single channel of data and learns appropriate
% detection parameters for it individually.

%Inputs:
% data - a vector containing prerecorded data

%Outputs:
% v_height - the appropriate magnitude threshold for detecting ventricular peaks
% a_height - the appropriate magnitude threshold for detecting atrial peaks
% v_flip - sign of data that should be examined for ventricuar peaks (+1 or -1)
% a_flip - sign of data that should be examined for atrial peaks (+1 or -1)
% v_length - the duration (in samples) a ventricular peak must occur in (see yamPeakFinder)
% a_length - the duration (in samples) an atrial peak must occur in (see yamPeakFinder)
% v_first - boolean value that is true if we should detect ventricles first
%           before looking for atria, false otherwise

function [ v_height, a_height, v_flip, a_flip, v_length, a_length, v_first ] = LearnParameters(data)
    VENT = 1;
    ATRIA = 2;

    %learn the appropriate lengths of atria and ventricles, as well as
    %which should be detected first, for + and - data
    [v_lengths, a_lengths, first] = LearnLengths(data);
    
    lengths = [v_lengths; a_lengths]; %2x2 array, dimensions: chamber, flip
    visualize_bs = true; % Visualize the function that LearnHeightRange uses and the algorithm's performance
    flip = [+1, -1]; % signs corresponding to the two flip indices
    
    %The ranges of magnitudes returned by LearnHeightRange for each chamber and sign
    cutoffs = zeros(2,2,2); % Dimensions: chamber, flip, start-end
    
    %Where in the middle of each range we should pick the magnitude
    %threshold; each row should sum to 1
    mid_finders = [0.5 0.5; 0.5 0.5]; % Dimensions: chamber, start-end
    
    if visualize_bs
        figure
        hold on
    end
    
    % + and - data
    for f = 1:2
        %Learn the cutoffs for whichever chamber we should do first for this sign of the data
        cutoffs(first(f),f,:) = LearnHeightRange(flip(f)*data, lengths(first(f),f));
        
        %Find peak times and zero out the region around them
        ndata = data;
        t_blank = 100; l_blank = 100; %how many samples to zero out on either side
        %pick exact threshold from the middle of the range according to mid_finders
        thresh = sum(squeeze(cutoffs(first(f),f,:)).*mid_finders(first(f),:));
        [~, rising_edges, falling_edges] = CountPeaks(flip(f)*data > thresh, lengths(first(f),f)); %find peak times
        %zero out surrounding region
        for i = 1:length(rising_edges)
            ndata(max(1,(rising_edges(i)-t_blank)):min(end,(falling_edges(i)+l_blank))) = 0;
        end
        
        %Learn the cutoffs for whichever chamber we should do second for this sign of the data
        cutoffs(3-first(f),f,:) = LearnHeightRange(flip(f)*ndata, lengths(3-first(f),f));
        
        if visualize_bs
            if first(f)==1
                color1 = 'r';
                color2 = 'k';
                peak1 = 'ventricular';
                peak2 = 'atrial';
            else
                color1 = 'k';
                color2 = 'r';
                peak1 = 'atrial';
                peak2 = 'ventricular';
            end
            
            xs = linspace(0, max(flip(f)*data), 200);
            ys=zeros(200,1);
            for i = 1:200
                [beats, ~, ~] = CountPeaks(flip(f)*data > xs(i), lengths(first(f),f));
                ys(i) = beats;
            end
            h(1) = plot(flip(f)*xs, ys,color1);
            
            % axis([0 3000 0 200])
            xlabel('Threshold (mV)','FontSize',18)
            ylabel('Number of Beats','FontSize',18)
            title('Beats(threshold)','Fontsize',18)
            xs = linspace(0, max(flip(f)*ndata), 200);
            ys=zeros(200,1);
            for i = 1:200
                [beats, ~, ~] = CountPeaks(flip(f)*ndata > xs(i), lengths(3-first(f),f));
                ys(i) = beats;
            end
            h(2) = plot(flip(f)*xs, ys, color2);
        end
    end
    
    %pick which signs to use according to which one returned a wider range in LearnHeightRange
    [~,vf] = max(cutoffs(VENT,:,2)-cutoffs(VENT,:,1)); 
    [~,af] = max(cutoffs(ATRIA,:,2)-cutoffs(ATRIA,:,1));
    %pick exact thresholds from the middle of the ranges according to mid_finders
    v_height = sum(cutoffs(VENT,vf,:).*mid_finders(VENT,vf));
    a_height = sum(cutoffs(ATRIA,af,:).*mid_finders(ATRIA,af));
    v_length = v_lengths(vf);
    a_length = a_lengths(af);
    v_flip = flip(vf);
    a_flip = flip(af);
    %detect ventricles first if we should on the sign(s) of the data we use,
    %otherwise detect atria first
    v_first = (first(af)==VENT && first(vf)==VENT); 
    
    if visualize_bs
        heartbeats = FindHeartRate(data);
        h(3) = plot(v_flip*reshape(cutoffs(VENT,vf,:),[1,2]), [heartbeats, heartbeats], 'ro');
        h(4) = plot(a_flip*reshape(cutoffs(ATRIA,af,:),[1,2]), [heartbeats, heartbeats], 'kx');
        xlabel('Threshold used','Fontsize',14)
        ylabel('Number of peaks detected','Fontsize',14)
        legend(h,{[peak1 ' # peaks found vs threshold curve'],[peak2 ' # peaks found vs threshold curve'],...
            'range of good ventricular thresholds found', 'range of good atrial thresholds found'},'Fontsize',14)
        title('Full # peaks vs thresholds curves and the algorithm''s solutions','Fontsize',18)
    end
      
end


% Learn an appropriate threshold for beat detection 
% by searching (the function that maps threshold to # of beats detected in data)
% for a maximal-length flat segment. This corresponds to a large range of thresholds 
% that give the same number of beats, and we've found that those thresholds are good.
function [flatcutoffs] = LearnHeightRange(data, minlength)
    if (minlength==0) % length learning failed, so threshold learning doesn't make sense
        flatcutoffs = [0 0];
        return
    end
    npts = 20; % How many samples to take in each iteration of our recursive search
    sample_rate = 1000;
    minbeats = length(data) / sample_rate * 10 / 60; %10 bpm
    maxbeats = length(data) / sample_rate * 150 / 60; %200bpm

    max_th = max(data); % upper bound for this iteration of the search
	% but try two other uppper bounds. Having a better upper bound makes the search better
	if CountPeaks(data > max(data) / 4, minlength) < minbeats
		max_th = max(data)/4 % We already know this is too big, so no need to check anything larger
	elseif CountPeaks(data > max(data) / 2, minlength) < minbeats
		max_th = max(data)/2 
	end
    
    ths = linspace(0, max_th, npts); % thresholds to try in this iteration
    beats = zeros(1,npts);
    
   
    for i=1:3 % refinement round
        beats = zeros(1,npts);
        for j = 1:length(ths)
            % Potential optimization: We can assume the function is monotonic, so if beats(j) =
            % beats(k), we don't need to compute anything else between j
            % and k.
            beats(j) = CountPeaks(data > ths(j), minlength);
			% as j increases, ths(j) increases, so beats(j) decreases. 
			% This means if beats(j) < minbeats, then beats(j+1) < minbeats, etc. 
            if beats(j)<minbeats
				% don't touch the rest. They'll be 0, which we treat the same as any value < minbeats
                break
            end
        end
        last_valid = find(beats > minbeats, 1, 'last');
        first_valid = find(beats < maxbeats, 1, 'first');
		% Could we find any thresholds that were reasonable?
        if ( isempty(last_valid) || isempty(first_valid) ||(last_valid<=first_valid))
            flatcutoffs = [0 0];
            return
        end
        
        beats = beats(first_valid:last_valid); % just take the valid ones
        ths = ths(first_valid:last_valid);
        derivs = abs(beats(2:end)-beats(1:(end-1))); % consecutive differences
        %derivs = abs(beats(2:last_valid)-beats(1:(last_valid-1)));
        [minder, idx] = min(derivs); % which segment (between points we sampled) is the flattest?
        if minder == 0
            % was it actually flat? If so, find the longest strech of zeros
            flats = derivs == 0;
            iidx = -1;
            currentBest = -1;
            cbStart = -1;
            cbEnd = -1;
            for j = 1:length(derivs)
                if flats(j) && iidx  == -1 % extending a flat?
                    iidx = j;
                end
                if flats(j) && j - iidx > currentBest
                    currentBest = j - iidx;
                    cbStart = iidx;
                    cbEnd = j;
                end
                if ~flats(j)
                    iidx = -1;
                end 
            end
            idx = cbStart;
            endidx = cbEnd+1;
        else
			% otherwise, take the flattest segment
            endidx = idx+1;
        end
		% compute the thresholds for the next round
        nmin = min(ths(idx),ths(endidx));
        nmax = max(ths(idx),ths(endidx));
        ths = linspace(nmin, nmax, npts);
        
        beats1 = beats(idx);
        beats2 = beats(endidx);
		% if we have already reached a flat interval, that's good enough. We're done.
        if beats1 == beats2
            break
        end
		% we know these values, so we actually don't need to recompute them.
        % beats(1) = beats1;
        % beats(end) = beats2;
    end
    % Technically, this might not be the full extent of the interval because of how we sampled.
	% We could try to expand it, but that's not particularly necessary as far as I can tell.
    flatcutoffs = [ths(1), ths(end)];
end

