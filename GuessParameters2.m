function [ vc, ac, vflip, aflip ] = GuessParameters2( data, v_length, a_length)
%GUESSPARAMETERS2 Summary of this function goes here
%   Detailed explanation goes here
 
    %samplesHB = floor(length(data)/heartbeats);
    visualize_bs = true;% BINARY SEARCH VISUALIZATION
    
    if visualize_bs
        for vflip = [+1, -1]
            figure(99)
            hold on
            xs = linspace(0, max(vflip*data), 200);
            ys=zeros(200,1);
            for i = 1:200
                [beats, ~, ~] = CountPeaks(vflip*data > xs(i), v_length);
                ys(i) = beats;
            end
            plot(vflip*xs, ys);
        end
    end
    
    v_cutoffs = BinarySearch(data, v_length);
    v_cutoffs_neg = BinarySearch(-data, v_length);
    if (v_cutoffs_neg(2)-v_cutoffs_neg(1)<v_cutoffs(2)-v_cutoffs(1))
        vflip = 1;
    else
        vflip = -1;
        v_cutoffs = v_cutoffs_neg;
    end
    vc = sum([.5, .5] .* v_cutoffs);
    
    
    if visualize_bs
        heartbeats = FindHeartRate(data);
        plot(vflip*v_cutoffs, [heartbeats, heartbeats], 'bx');
    end

    ndata = data;
    
    t_blank = 50;
    l_blank = 50;
    [~, rising_edges, falling_edges] = CountPeaks(vflip*data > vc, v_length);
    for i = 1:length(rising_edges)
        ndata((rising_edges(i)-t_blank):(falling_edges(i)+l_blank)) = 0;
    end
%     ndata = abs(ndata);
%     figure
%     plot(ndata)
    
    if visualize_bs
        for aflip = [+1, -1]
            xs = linspace(0, max(aflip*ndata), 200);
            ys=zeros(200,1);
            for i = 1:200
                [beats, ~, ~] = CountPeaks(aflip*ndata > xs(i), a_length);
                ys(i) = beats;
            end
            plot(aflip*xs, ys, 'k');
        end
    end

    a_cutoffs =  BinarySearch(ndata, a_length);
    a_cutoffs_neg =  BinarySearch(-ndata, a_length);
    if (a_cutoffs_neg(2)-a_cutoffs_neg(1)<a_cutoffs(2)+a_cutoffs(1))
        aflip = 1;
    else
        a_cutoffs = a_cutoffs_neg;
        aflip = -1;
    end
    ac = sum([.7, .3] .* a_cutoffs);
    
    if visualize_bs
        plot(aflip*a_cutoffs, [heartbeats, heartbeats], 'ro');
    end
end

function [flatcutoffs] = BinarySearch(data, minlength)
    npts = 50;
    sample_rate = 1000;
    minbeats = length(data) / sample_rate * 10 / 60; %10 bpm
    maxbeats = length(data) / sample_rate * 150 / 60; %200bpm
    
    if nargin == 2
        ths = linspace(min(data), max(data), npts);
        beats = zeros(1,npts);
        beats(1) = length(data)/150;
        beats(end) = 0;
    else
        ths = linspace(startmin, endmin, npts);
        beats = zeros(1,npts);
        beats(1) = CountPeaks(data > ths(1), minlength);
        beats(end) = CountPeaks(data > ths(end), minlength);
    end
   
   
    for i=1:3
        beats = zeros(1,npts);
        for j = 1:length(ths)
            % We can assume the function is monotonic, so if beats(j) =
            % beats(k), we don't need to compute anything else between j
            % and k.
            beats(j) = CountPeaks(data > ths(j), minlength);
        end
        last_valid = find(beats > minbeats, 1, 'last');
        first_valid = find(beats < maxbeats, 1, 'first');
        if (last_valid<=first_valid)
            flatcutoffs = [0 0];
            return
        end
        
        beats = beats(first_valid:last_valid);
        ths = ths(first_valid:last_valid);
        derivs = abs(beats(2:end)-beats(1:(end-1))./ths(2:end)-ths(1:(end-1)));
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