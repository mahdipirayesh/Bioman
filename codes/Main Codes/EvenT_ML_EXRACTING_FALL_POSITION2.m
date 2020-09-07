%% Ebteda in ra run mikoni
clc
clear all
%% Sepas read_files ra run mikony
% cd F:\DATA
Range= 16;
Resolution=13;
Fs=200;
initial_buffer=1;%in seconds
waiting_time=1 ;%in seconds
aVM_thereshhold=1.8; %in terms of g
x=zeros(1796,3*Fs,6);

pass_threshhold=1;
cheking_peak_index=1;
x=zeros(1796,3*Fs,6);
Ignored_files=0; %file hayii ke be tereshhold nimiresad
%
for s=1:size(files)
    %I=0; %Bara in ke agar yeki nadasht eror dahad
    raw_Data_name=erase(files(s).name,'.txt');
    raw_Data=eval(raw_Data_name);
    raw_Data(:,7:9)=[];
    
    Data=(2*Range)/(2^Resolution)*raw_Data;
    aVM=sqrt(Data(:,1).^2 + Data(:,2).^2 +Data(:,3).^2);
    
    [peakValues, indexesOfPeaks] = findpeaks(aVM, 'MINPEAKHEIGHT', 1.8);
    [A,I]=max(peakValues);
    peak_index=indexesOfPeaks(I);
    
    if size(peakValues,1)==0
        Ignored_files=Ignored_files+1;
        X(Ignored_files)=s;
        continue
    end
    
    if peak_index<Fs
        peakValues(I)=[];
        indexesOfPeaks(I)=[];
        [A,I]=max(peakValues);
        peak_index=indexesOfPeaks(I);
    end
    
    for j=1:6
        x(s,:,j)=Data((peak_index-Fs:peak_index+2*Fs-1),j)'; 
    end
    
end

for q=1: Ignored_files
    x(X(q),:,:)=[];
end










