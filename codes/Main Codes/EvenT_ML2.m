% clc
% clear all
%%
raw_Data=D04_SA20_R01; %load('F:\lessons\Project\SisFall_dataset\SisFall_dataset\Fall datas\All\F02_SA08_R05.txt');
Range= 16;
Resolution=13;
raw_Data(:,7:9)=[];
Data=(2*Range)/(2^Resolution)*raw_Data;

aVM=sqrt(Data(:,1).^2 + Data(:,2).^2 +Data(:,3).^2);

Fs=200;
initial_buffer=1;%in seconds
waiting_time=2 ;%in seconds
aVM_thereshhold=1.8; %in terms of g

pass_threshhold=1;
first_time=1;
% x=zeros(29,600,6);
counterADL_windows=0;
the_end=0;
%%
while(1)
    
    if (~first_time) %&& (peak_updated+waiting_time*2*Fs<size(aVM))
        for i = (peak_updated+waiting_time*Fs):size(aVM,1)
            
            if (aVM(i)>aVM_thereshhold)
                peak_index=i;
                peak=aVM(i);
                break
            end
        end
        if i==size(aVM,1)
            pass_threshhold_again=0;
            break   %az halghe asli
            
        end
    end
    
    
    
    if (first_time)
        for i = (initial_buffer*Fs):size(aVM,1)
            
            if (aVM(i)>aVM_thereshhold)
                peak_index=i;
                peak=aVM(i);
                break
            end
        end
        first_time=0;
        
        if i==size(aVM,1)
            pass_threshhold=0;
            break   %az halghe asli
        end
        
    end
% %  

    
    
    
    
    if ((peak_index+2*Fs)<size(aVM,1))
        check=1;
        while check
            for i=peak_index : (peak_index+waiting_time*Fs)
                if i==size(aVM,1)
                    the_end=1;
                    break
                end
                if ( aVM(i)>peak)
                    peak_index=i;
                    peak=aVM(i);
                    break
                end
                
            end
            if the_end
                break
            end
            
            
            if i>=(peak_index+waiting_time*Fs)
                check=0;
                 disp(peak_index);
                counterADL_windows=counterADL_windows+1;
                for j=1:6
                    x(counterADL_windows,:,j)=Data((peak_index-Fs+1:peak_index+2*Fs),j)';
                end
            end
        end
    
     else
         break
    end
 
    
    

    peak_updated=peak_index;
    if (peak_updated+2*Fs>size(aVM,1))
        the_end=1;
        break
    end
    
end
            
            
            
            
            
            
            

