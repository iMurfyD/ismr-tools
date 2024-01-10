fname = 'edmc21004l.ismr';
d=read_ismr(fname);
station_code = fname(1:3);

figure;
plot(d.G16.TOW/60/60,d.G16.TEC,'o');
hold on; xline(128595/60/60); 
ylabel('TEC (TECU)'); 
xlabel('Hours since start of GPS week'); 
title(sprintf('%s-G16 link',station_code));