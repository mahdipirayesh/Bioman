mData=zeros(1800,1);
    delete(instrfindall);   %pre-emptively close all ports
    s1 = serial('COM4');    %define serial port to read the Arduino
    s1.BaudRate=9600;     %define baud rate
    fopen(s1);
    s1.ReadAsyncMode = 'continuous';
    readasync(s1);
    while(s1.BytesAvailable <= 0)  %wait until Arduino outputs data 
        %
    end
    for i=1:1800 %while if constant acquisition is needed. 
            sSerialData = fscanf(s1); %read sensor
            flushinput(s1);
            %t = strsplit(sSerialData); % same character as the Arduino code
            mData(i,1) = str2double(sSerialData); 
           % mData(i,2) = str2double(t(2));
    end    
    delete(instrfindall);    % close the serial port
  %% mData feature
  for i=1:600
      ax(i,1)=mData(3*i-2,1);
      ay(i,1)=mData(3*i-1,1);
      az(i,1)=mData(3*i,1);
  end 
aVM=sqrt(ax(:).^2 + ay(:).^2 +az(:).^2);
% aVM1=aVM(1:200);
% aVM2=aVM(201:400);
% aVM3=aVM(401:600);

average_aVM_preimpact_vector=sum(aVM(1:200))/200;%3
average_aVM_impact_vector=sum(aVM(201:400))/200;%1
average_aVM_postimpact_vector=sum(aVM(401:600))/200;%2

ax_preimpact=ax(1:200,1);
ay_preimpact=ay(1:200,1);
az_preimpact=az(1:200,1);

ax_impact=ax(201:400,1);
ay_impact=ay(201:400,1);
az_impact=az(201:400,1);

ax_postimpact=ax(401:600,1);
ay_postimpact=ay(401:600,1);
az_postimpact=az(401:600,1);











ax_preimpact_SMA=abs(ax(1:200,1));
ay_preimpact_SMA=abs(ay(1:200,1));
az_preimpact_SMA=abs(az(1:200,1));

ax_impact_SMA=abs(ax(201:400,1));
ay_impact_SMA=abs(ay(201:400,1));
az_impact_SMA=abs(az(201:400,1));

ax_postimpact_SMA=abs(ax(401:600,1));
ay_postimpact_SMA=abs(ay(401:600,1));
az_postimpact_SMA=abs(az(401:600,1));










Energy_preimpact=Energy_func(ax_preimpact, ay_preimpact,az_preimpact);%6  
Energy_impact=Energy_func(ax_impact, ay_impact,az_impact);  %4 
Energy_postimpact=Energy_func(ax_postimpact, ay_postimpact,az_postimpact);%5

maximum_aVM_preimpact_vector=max(aVM(1:199));%9 % 200 omi ompact bayad bashad  
maximum_aVM_impact_vector=max(aVM(200:400));%7
maximum_aVM_postimpact_vector=max(aVM(401:600));%8

minimum_aVM_preimpact_vector=min(aVM(1:199));%12
minimum_aVM_impact_vector=min(aVM(200:400));%10
minimum_aVM_postimpact_vector=min(aVM(401:600));%11


RMS_aVM_preimpact=rms(aVM(1:200));%15
RMS_aVM_impact=rms(aVM(201:400));%13
RMS_aVM_postimpact=rms(aVM(401:600));%14

SMA_preimpact=SMA_func(ax_preimpact_SMA,ay_preimpact_SMA,az_preimpact_SMA);  %18
SMA_impact=SMA_func(ax_impact_SMA, ay_impact_SMA,az_impact_SMA); %16  
SMA_postimpact=SMA_func(ax_postimpact_SMA, ay_postimpact_SMA,az_postimpact_SMA);%17

Var_aVM_preimpact=var(aVM(1:200));%21
Var_aVM_impact=var(aVM(201:400));%19
Var_aVM_postimpact=var(aVM(401:600));%20

neural_input=[average_aVM_impact_vector,average_aVM_postimpact_vector,average_aVM_preimpact_vector,...
    Energy_impact,Energy_postimpact,Energy_preimpact,maximum_aVM_impact_vector,...
    maximum_aVM_postimpact_vector,maximum_aVM_preimpact_vector,minimum_aVM_impact_vector,...
    minimum_aVM_postimpact_vector,minimum_aVM_preimpact_vector,...
    RMS_aVM_impact,RMS_aVM_postimpact,RMS_aVM_preimpact,...
    SMA_impact,SMA_postimpact,SMA_preimpact,Var_aVM_impact,...
    Var_aVM_postimpact,Var_aVM_preimpact];
      
    final_ans=predict(Md1,neural_input); 
      