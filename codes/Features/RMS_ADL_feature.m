s=0;
for i=1:size(ADLmatrix,2)
    
    window_numbers=size (ADLmatrix{i},1);
    x=ADLmatrix{i};
    
    for j=1:window_numbers
        s=s+1;
        aVM=sqrt(x(j,:,1).^2 + x(j,:,2).^2 +x(j,:,3).^2);
        
        RMS_aVM_preimpact=rms(aVM(1:200));
        RMS_aVM_impact=rms(aVM(201:400));
        RMS_aVM_postimpact=rms(aVM(401:600));
        RMS_ADL_preimpact_vector(s)=RMS_aVM_preimpact;
        RMS_ADL_impact_vector(s)=RMS_aVM_impact;
        RMS_ADL_postimpact_vector(s)= RMS_aVM_postimpact;
        
    end
    
end
cd F:\DATA
save('RMS_ADL_preimpact_feature','RMS_ADL_preimpact_vector')
save('RMS_ADL_impact_feature','RMS_ADL_impact_vector')
save('RMS_ADL_postimpact_feature','RMS_ADL_postimpact_vector')