function ret = read_ismr(fname)
%read_ismr Parse plaintext ismr file

% use https://www.labsat.co.uk/index.php/en/gps-time-calculator for time
scint_data = importdata(fname);
sz=size(scint_data);
ret = {};

% go through each columns
for idx = 1:sz(1)
    svid = scint_data(idx,3);
    ret.raw = scint_data;
    ret.(sprintf("G%i",svid)) = {};
    ret.(sprintf("G%i",svid)).WN = []; % week number
    ret.(sprintf("G%i",svid)).TOW = []; % time of week, seconds
    ret.(sprintf("G%i",svid)).TEC = []; % total electron content
    ret.(sprintf("G%i",svid)).dTEC = []; % 15-second difference in total electron content
    ret.(sprintf("G%i",svid)).phase_sigma = []; % 1-second
    ret.(sprintf("G%i",svid)).phase_sigma.s1 = []; % 1-second
    ret.(sprintf("G%i",svid)).phase_sigma.s2 = []; % 1-second
    ret.(sprintf("G%i",svid)).phase_sigma.s3 = []; % 1-second
    ret.(sprintf("G%i",svid)).S4 = []; % S4 index
    ret.(sprintf("G%i",svid)).S4.s1 = []; % S4 index
    ret.(sprintf("G%i",svid)).S4.s2 = []; % S4 index
    ret.(sprintf("G%i",svid)).S4.s3 = []; % S4 index
end

for idx = 1:sz(1)
    svid = scint_data(idx,3);
    ret.(sprintf("G%i",svid)).WN = [ret.(sprintf("G%i",svid)).WN; scint_data(idx,1)]; 
    ret.(sprintf("G%i",svid)).TOW = [ret.(sprintf("G%i",svid)).TOW; scint_data(idx,2)];
    ret.(sprintf("G%i",svid)).TEC = [ret.(sprintf("G%i",svid)).TEC; scint_data(idx,23)];
    ret.(sprintf("G%i",svid)).dTEC = [ret.(sprintf("G%i",svid)).dTEC; scint_data(idx,24)];
    ret.(sprintf("G%i",svid)).phase_sigma.s1 = [ret.(sprintf("G%i",svid)).phase_sigma.s1; scint_data(idx,10)]; % 1-second
    ret.(sprintf("G%i",svid)).phase_sigma.s2 = [ret.(sprintf("G%i",svid)).phase_sigma.s2; scint_data(idx,35)]; % 1-second
    ret.(sprintf("G%i",svid)).phase_sigma.s3 = [ret.(sprintf("G%i",svid)).phase_sigma.s3; scint_data(idx,49)]; % 1-second
    ret.(sprintf("G%i",svid)).S4.s1 = [ret.(sprintf("G%i",svid)).S4.s1; scint_data(idx,8)]; 
    ret.(sprintf("G%i",svid)).S4.s2 = [ret.(sprintf("G%i",svid)).S4.s2; scint_data(idx,33)];
    ret.(sprintf("G%i",svid)).S4.s3 = [ret.(sprintf("G%i",svid)).S4.s3; scint_data(idx,47)];
end

end