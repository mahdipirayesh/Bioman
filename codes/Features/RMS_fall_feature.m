
for i=1:size(x)
    aVM=sqrt(x(i,:,1).^2 + x(i,:,2).^2 +x(i,:,3).^2);
    
    RMS_aVM_preimpact=rms(aVM(1:200));
    RMS_aVM_impact=rms(aVM(201:400));
    RMS_aVM_postimpact=rms(aVM(401:600));
    RMS_fall_preimpact_vector(i)=RMS_aVM_preimpact;
    RMS_fall_impact_vector(i)=RMS_aVM_impact;
    RMS_fall_postimpact_vector(i)= RMS_aVM_postimpact;
end
cd F:\DATA
save('RMS_fall_preimpact_feature','RMS_fall_preimpact_vector')
save('RMS_fall_impact_feature','RMS_fall_impact_vector')
save('RMS_fall_postimpact_feature','RMS_fall_postimpact_vector')