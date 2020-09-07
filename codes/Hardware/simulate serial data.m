clc
clear all
%% ebteda Fall data ra mi andazim toosh

a(1:600,1)=x(440,: ,1);
a(1:600,2)=x(440,: ,2);
a(1:600,3)=x(440,: ,3);
for i=1:600
    mData(i*3-2,1)=a(i,1);
    mData(i*3-1,1)=a(i,2);
    mData(i*3,1)=a(i,3);
end
%%100, 440,5,