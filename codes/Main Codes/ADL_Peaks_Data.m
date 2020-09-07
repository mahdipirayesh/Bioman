
%CHECK SHAVAD!!!
%cd F:\DATA
Range= 16;
Resolution=13;
Fs=200;
initial_buffer=1;%in seconds
waiting_time=2 ;%in seconds
aVM_thereshhold=1.8; %in terms of g
%  x=zeros(1,1);


S=1;
for s=1:size(files)
clearvars x
pass_threshhold=1;
first_time=1;
% x=zeros(29,600,6);
counterADL_windows=0;
the_end=0;

    raw_Data_name=erase(files(s).name,'.txt');
    raw_Data=eval(raw_Data_name);
    raw_Data(:,7:9)=[];
    
    Data=(2*Range)/(2^Resolution)*raw_Data;
    aVM=sqrt(Data(:,1).^2 + Data(:,2).^2 +Data(:,3).^2);
    
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
    
    
    
    
    
    if ((peak_index+2*Fs)<size(aVM,1))
        check=1;
        while check
            
            for i=peak_index : (peak_index+waiting_time*Fs)
                if (i+waiting_time*Fs>size(aVM,1))
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
%                  disp(peak_index);
                counterADL_windows=counterADL_windows+1;
                for j=1:6
                    x(counterADL_windows,:,j)=Data((peak_index-Fs+1:peak_index+2*Fs),j)'; %in chon rooye 200 peak darad dadeh 200 be eshtebah 200om hast v bayad baraye max deghat sahvad
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
    if the_end
        break
    end
    
    end
    
    if counterADL_windows==0
        continue
    %%else
        %%ADLmatrix{S}=x;
        %%S=S+1;
        %%if s==134
         %%disp(S)
       %%end
   %%end

end
  