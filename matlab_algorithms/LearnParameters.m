function [ vc, ac, vflip, aflip, v_length, a_length ] = LearnParameters( data )
%GUESSPARAMETERS2 Summary of this function goes here
%   Detailed explanation goes here
 
    [v_lengths, a_lengths] = LearnParameters(data)
    %samplesHB = floor(length(data)/heartbeats);
    visualize_bs = true;% BINARY SEARCH VISUALIZATION
    flip = [+1, -1];
    if visualize_bs
        for f = 1:2
            figure(99)
            hold on
            xs = linspace(0, max(vflip*data), 200);
            ys=zeros(200,1);
            for i = 1:200
                [beats, ~, ~] = CountPeaks(flip(f)*data > xs(i), v_lengths(f));
                ys(i) = beats;
            end
            plot(flip(f)*xs, ys);
        end
    end
    
    v_cutoffs = BinarySearch(data, v_lengths(1));
    v_cutoffs_neg = BinarySearch(-data, v_lengths(2));
    if (v_cutoffs_neg(2)-v_cutoffs_neg(1)<v_cutoffs(2)-v_cutoffs(1))
        vf = 1;
    else
        vf = 2;
        v_cutoffs = v_cutoffs_neg;
    end
    vflip = flip(vf);
    v_length = v_lengths(vf);
    vc = sum([.5, .5] .* v_cutoffs);
    
    
    if visualize_bs
        heartbeats = FindHeartRate(data);
        plot(vflip*v_cutoffs, [heartbeats, heartbeats], 'bx');
    end

    ndata = data;
    
    t_blank = 50;
    l_blank = 50;
    [~, rising_edges, falling_edges] = CountPeaks(vflip*data > vc, v_length(vf));
    for i = 1:length(rising_edges)
        ndata((rising_edges(i)-t_blank):(falling_edges(i)+l_blank)) = 0;
    end
%     ndata = abs(ndata);
%     figure
%     plot(ndata)
    
    if visualize_bs
        for f = 1:2
            xs = linspace(0, max(flip(f)*ndata), 200);
            ys=zeros(200,1);
            for i = 1:200
                [beats, ~, ~] = CountPeaks(flip(f)*ndata > xs(i), a_lengths(f));
                ys(i) = beats;
            end
            plot(flip(f)*xs, ys, 'k');
        end
    end

    a_cutoffs =  BinarySearch(ndata, a_lengths(1));
    a_cutoffs_neg =  BinarySearch(-ndata, a_lengths(2));
    if (a_cutoffs_neg(2)-a_cutoffs_neg(1)<a_cutoffs(2)-a_cutoffs(1))
        af = 1;
    else
        a_cutoffs = a_cutoffs_neg;
        af = 2;
    end
    ac = sum([.7, .3] .* a_cutoffs);
    aflip = flip(af);
    a_length = a_lengths(af);
    
    if visualize_bs
        plot(aflip*a_cutoffs, [heartbeats, heartbeats], 'ro');
    end
end

function [flatcutoffs] = BinarySearch(data, minlength)
    npts = 20;
    sample_rate = 1000;
    minbeats = length(data) / sample_rate * 10 / 60; %10 bpm
    maxbeats = length(data) / sample_rate * 150 / 60; %200bpm

    max_th = max(data);
    for th = [max(data)/4 max(data)/2]
         beat = CountPeaks(data > th, minlength);
         if beat<minbeats
             max_th = th;
         end
    end
    
    ths = linspace(0, max_th, npts);
    beats = zeros(1,npts);
    beats(1) = length(data)/150;
    beats(end) = 0;
    
   
    for i=1:3
        beats = zeros(1,npts);
        for j = 1:length(ths)
            % We can assume the function is monotonic, so if beats(j) =
            % beats(k), we don't need to compute anything else between j
            % and k.
            beats(j) = CountPeaks(data > ths(j), minlength);
            if beats(j)<minbeats
                break
            end
        end
        last_valid = find(beats > minbeats, 1, 'last');
        first_valid = find(beats < maxbeats, 1, 'first');
        if (last_valid<=first_valid)
            flatcutoffs = [0 0];
            return
        end
        
        beats = beats(first_valid:last_valid);
        ths = ths(first_valid:last_valid);
        derivs = abs(beats(2:end)-beats(1:(end-1)));
        %derivs = abs(beats(2:last_valid)-beats(1:(last_valid-1)));
        [minder, idx] = min(derivs);
        if minder == 0
            % longest strech of zeros
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
            endidx = idx+1;
        end
        nmin = min(ths(idx),ths(endidx));
        nmax = max(ths(idx),ths(endidx));
        ths = linspace(nmin, nmax, npts);
        
        beats1 = beats(idx);
        beats2 = beats(endidx);
        if beats1 == beats2
            break
        end
        beats(1) = beats1;
        beats(end) = beats2;
    end
    % TODO? expand the region more
    flatcutoffs = [ths(1), ths(end)];
end

function [heartbeats] = FindHeartRate(data)
    min_heartrate = 50; % bpm
    max_heartrate = 150; % bpm
    sample_rate = 1000;
    Y = abs(fft(data));
    rescale =  length(data)/(sample_rate * 60); % TODO: check this
    min_idx = round(min_heartrate * rescale);
    max_idx = round(max_heartrate * rescale);
    [~, hr_idx] = max(Y(min_idx:max_idx));
    hr_idx = hr_idx - 1 + min_idx;
    heartbeats = hr_idx;
end
