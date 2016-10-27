N = 8; %number of independent patients
Fs = 1000;
L = Fs*30; %number of samples to take
locnames = {'afw' 'ivc' 'svc' 'tva'}; %names of cathode placements
num_sites = 4;
for i=1:N
    sigs = zeros(L,num_sites);
    for j = 1:num_sites
        sigs(:,i) = rdsamp(['iafdb/iaf' num2str(i) '_' locnames{j}],1,L);
    end
    s.data = sigs;
    s.Fs = Fs;
    save(['iaf' num2str(i) '_struct'], 's')
end