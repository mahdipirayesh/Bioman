function SMA = SMA_func(ax,ay,az)
N = 200; % window length
Fs = 200; % sample frequency
df = Fs/N; % frequency increment

SMA_x=sum(ax)*df;
  
SMA_y=sum(ay)*df;
  
SMA_z=sum(az)*df;

SMA=(SMA_x+SMA_y+SMA_z)/200; %BE IN / 200 havasat bashad shayad majboor shi baresh dari

end