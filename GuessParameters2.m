function [ vc, ac ] = GuessParameters2( data )
%GUESSPARAMETERS2 Summary of this function goes here
%   Detailed explanation goes here
 
    %samplesHB = floor(length(data)/heartbeats);
    visualize_bs = true;% BINARY SEARCH VISUALIZATION
     
    if visualize_bs
        figure(99)
        hold on
        xs = linspace(min(data), max(data), 200);
        ys=zeros(200,1);
        for i = 1:200
            [beats, ~, ~] = CountPeaks(data > xs(i), 21);
            ys(i) = beats;
        end
        plot(xs, ys);
    end
    
    
    
    v_cutoffs = BinarySearch(data, 21);
    vc = sum([.5, .5] .* v_cutoffs);
    
    if visualize_bs
        heartbeats = FindHeartRate(data);
        plot(v_cutoffs, [heartbeats, heartbeats], 'bx');
    end
    
  
 
    
    ndata = data;
    
    t_blank = 30;
    l_blank = 30;
    [~, rising_edges, falling_edges] = CountPeaks(data > vc, 21);
    for i = 1:length(rising_edges)
        ndata((rising_edges(i)-t_blank):(falling_edges(i)+l_blank)) = min(data(rising_edges(i)-t_blank):(falling_edges(i)+l_blank));
    end
   
    if visualize_bs
        xs = linspace(min(ndata), max(ndata), 200);
        ys=zeros(200,1);
        for i = 1:200
            [beats, ~, ~] = CountPeaks(ndata > xs(i), 31);
            ys(i) = beats;
        end
         plot(xs, ys, 'y');
    end
     
    a_cutoffs =  BinarySearch(ndata, 31, 0, max(ndata));
    
    ac = sum([.7, .3] .* a_cutoffs);
    
     if visualize_bs
        plot(a_cutoffs, [heartbeats, heartbeats], 'ro');
     end
end

function [flatcutoffs] = BinarySearch(data, minlength, startmin, endmin)
    npts = 12;
    sample_rate = 1000;
    minbeats = length(data) / sample_rate * 40 / 60;
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
        for j = 2:length(beats)-1
            % We can assume the function is monotonic, so if beats(j) =
            % beats(k), we don't need to compute anything else between j
            % and k.
            beats(j) = CountPeaks(data > ths(j), minlength);
        end
        last_valid = find(beats > minbeats, 1, 'last');
        
        derivs = abs(beats(2:last_valid)-beats(1:(last_valid-1)));
        [minder, idx] = min(derivs);
        if minder == 0
            % longest strech of zeros
            flats = derivs == 0;
            iidx = -1;
            currentBest = -1;
            cbStart = -1;
            cbEnd = -1;
            for j = 1:length(derivs)
                if flats(j) && iidx  == -1
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
            endidx = cbEnd;
        else
            endidx = idx+1;
        end
        nmin = ths(idx);
        nmax = ths(endidx+1);
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