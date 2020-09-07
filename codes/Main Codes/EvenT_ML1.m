clc
clear all
%%
raw_Data=load('F:\lessons\Project\SisFall_dataset\SisFall_dataset\Fall datas\All\F02_SA08_R05.txt');
Range= 16;
Resolution=13;
raw_Data(:,7:9)=[];
Data=(2*Range)/(2^Resolution)*raw_Data;

aVM=sqrt(Data(:,1).^2 + Data(:,2).^2 +Data(:,3).^2);

Fs=200;
initial_buffer=1;%in seconds
waiting_time=1 ;%in seconds
aVM_thereshhold=1.8; %in terms of g
% first_time=1;
%%
 %while(check)
%  if (first_time)
 for i = (initial_buffer*Fs):size(aVM)
    
     if (aVM(i)>aVM_thereshhold)
         peak_index=i;
         peak=aVM(i);
         break
     end
 end
%  first_time=0;
%  end
 
 %%
 
%  if (~first_time)
%  for i = (initial_buffer*Fs):size(aVM)
%     
%      if (aVM(i)>aVM_thereshhold)
%          peak_index=i;
%          peak=aVM(i);
%          break
%      end
%  end
%  first_time=0;
%  end
 
 
 check=1;
 while check
     for i=peak_index : (peak_index+waiting_time*Fs)
         if ( aVM(i)>peak)
             peak_index=i;
             peak=aVM(i);
             break
         end
     end
     if i>=(peak_index+waiting_time*2*Fs)
         check=0;
     end
 end
 
            
            
            
            
            
            
            

