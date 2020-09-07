function Energy = Energy_func(ax,ay,az)
N = 200; % window length
Fs = 200; % sample frequency
df = Fs/N; % frequency increment
ax_squared = ax.*ax;  
energy_x=sum(ax_squared)*df;
ay_squared = ay.*ay;  
energy_y=sum(ay_squared)*df;
az_squared = az.*az;  
energy_z=sum(az_squared)*df;
Energy=energy_x+energy_y+energy_z; 
end