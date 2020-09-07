cd F:\DATA
Range= 16;
Resolution=13;
Fs=200;
initial_buffer=1;%in seconds
waiting_time=1 ;%in seconds
aVM_thereshhold=1.8; %in terms of g
x=zeros(1796,3*Fs,6);

pass_threshhold=1;
cheking_peak_index=1;

for s=1:size(files)
    raw_Data_name=erase(files(s).name,'.txt');
    raw_Data=eval(raw_Data_name);
    raw_Data(:,7:9)=[];
    
    Data=(2*Range)/(2^Resolution)*raw_Data;
    aVM=sqrt(Data(:,1).^2 + Data(:,2).^2 +Data(:,3).^2);
    
    for i = (initial_buffer*Fs):size(aVM)
        
        if (aVM(i)>aVM_thereshhold)
            peak_index=i;
            peak=aVM(i);
            break
        end
        
    end
    if i==size(aVM)
    pass_threshhold=0;
    end
    
    check=1;
    while check
        for i=peak_index : (peak_index+waiting_time*Fs)
            if ( aVM(i)>peak)
                peak_index=i;
                peak=aVM(i);
                break
            end
        end
        if i>=(peak_index+waiting_time*Fs)
            check=0;
        end
    end
    if peak_index+2*Fs >= size(aVM)
        cheking_peak_index=0;
    end
%     eval(raw_Data_name)=zeros(size(aVM));
for j=1:6
   x(s,:,j)=Data((peak_index-Fs:peak_index+2*Fs-1),j)'; 
end

end
save('Fall_Windows.mat','x')% x(1,:,:)= number of samples;x(:,:,1)= which sensor
